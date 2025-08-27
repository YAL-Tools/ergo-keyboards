package table;
import type.NamedThing;
import js.Syntax;
import haxe.DynamicAccess;
import haxe.Json;
import js.html.FormElement;
import js.html.InputElement;
import js.html.SelectElement;
import js.html.TextAreaElement;
import table.FancyTable;
import externs.Tippy;
import externs.TippyOptions;
import js.html.Element;
import js.html.TableCellElement;
import js.html.TableRowElement;
import table.FancyColumn;
import table.FancyTableFilters;
import table.FancyRow;
import KeyboardTable;
import table.LinkListColumn;
import tools.CompactJsonPrinter;
import type.IntRange;
import type.Keyboard;
using tools.HtmlTools;
using StringTools;
import js.Browser.*;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableEditor {
	static function print<KB>(table:FancyTable<KB>, kb:Any) {
		var buf = new StringBuf();
		buf.add("{");
		
		var pretty:DynamicAccess<Bool> = { notes: true };
		for (col in table.columns) if (col is LinkListColumn) {
			pretty[(cast col:LinkListColumn<KB>).field.name] = true;
		}
		
		var sep = false;
		for (fd in Reflect.fields(kb)) {
			var val = Reflect.field(kb, fd);
			if (Syntax.strictEq(val, js.Lib.undefined)) continue;
			if (sep) buf.add(","); else sep = true;
			buf.add("\n\t");
			
			var wantPretty = pretty[fd];
			if (!wantPretty
				&& (val is Array)
				&& ((val:Array<String>)[0] is String)
				&& ((val:Array<String>)[0].length > 20)
			) wantPretty = true;
			
			var str:String;
			if (wantPretty) {
				str = Json.stringify(val, null, "\t");
				str = StringTools.replace(str, "\n", "\n\t");
			} else {
				str = CompactJsonPrinter.print(val, null, "");
			}
			buf.add(Json.stringify(fd) + ": " + str);
		}
		buf.add("\n}");
		return buf.toString();
	}
	public static function build<KB:NamedThing>(table:FancyTable<KB>,
		out:FormElement,
		ddLoad:SelectElement,
		btReset:InputElement,
		btBuild:InputElement,
		btTest:InputElement,
		fdJSON:TextAreaElement,
		btLoadJSON:InputElement,
	) {
		var dest:Element = out;
		var store:Array<KB->Void> = [];
		var restore:Array<KB->Void> = [];
		for (item in table.filterOrder) {
			var column = switch (item) {
				case Header(header):
					var details = document.createDetailsElement();
					details.open = true;
					var summary = document.createElement("summary");
					summary.appendTextNode(header.text);
					details.appendChild(summary);
					out.appendChild(details);
					dest = details;
					for (note in header.editorNotes) {
						var div = details.appendElTextNode("div", "");
						div.classList.add("note");
						var notice = div.appendElTextNode("span", note.text);
						FancyTableFilters.addNotesFor(note.func, notice, true);
					}
					continue;
				case Column(col): col;
			}
			if (!column.canEdit) continue;
			
			var tr = document.createDivElement();
			tr.classList.add("item");
			tr.setAttribute("data-id", column.getId());
			tr.setAttribute("data-name", column.name);
			
			var divFilters = document.createDivElement();
			column.buildEditor(divFilters, store, restore);
			divFilters.classList.add("filters");
			
			var meta = document.createDivElement();
			meta.classList.add("name");
			
			var colName = column.filterName ?? column.name;
			var colNameEl = document.createSpanElement();
			colNameEl.appendTextNode(colName);
			colNameEl.classList.add("column-name");
			FancyTableFilters.addNotesFor(column.onEditorNotes ?? column.onNotes, colNameEl, true);
			
			meta.appendChild(colNameEl);
			meta.appendChild(divFilters);
			
			tr.appendChild(meta);
			dest.appendChild(tr);
		}
		function buildKeyboard() {
			var kb:KB = cast {};
			for (fn in store) fn(kb);
			for (col in table.columns) col.save(kb);
			return kb;
		}
		btBuild.onclick = function() {
			var kb = buildKeyboard();
			fdJSON.value = print(table, kb) + ",";
		}
		btReset.onclick = function() {
			if (!window.confirm(
				"Are you sure that you want to reset all fields? This cannot be undone!"
			)) return;
			out.reset();
		}
		
		// shortcuts
		FancyTableEditorShortcuts.bind(out);
		
		if (true) {
			var isKB = (table is KeyboardTable);
			var kbTable:KeyboardTable<Keyboard> = isKB ? cast table : null;
			var kbs:Array<KB>;
			if (isKB) {
				kbs = cast kbTable.rawKeyboards;
			} else kbs = table.values.copy();
			kbs.sort(function(a, b) {
				var an = a.name.toUpperCase();
				var bn = b.name.toUpperCase();
				return an < bn ? -1 : 1;
			});
			for (kb in kbs) {
				var option = document.createOptionElement();
				option.appendTextNode(kb.name);
				ddLoad.appendChild(option);
			}
			ddLoad.onchange = function() {
				if (ddLoad.value == "") return;
				var name = ddLoad.value;
				if (!window.confirm(
					"Are you sure that you want to replace fields with those of \"" + name +
					"\"? This cannot be undone!"
				)) return;
				ddLoad.value = "";
				var kb = kbs.filter(kb->kb.name == name)[0];
				if (kb == null) return;
				for (fn in restore) fn(cast kb);
			}
			//
			if (btLoadJSON != null) btLoadJSON.onclick = () -> {
				var firstField:InputElement = out.querySelectorAuto("input");
				if (firstField.value != ""
					&& !window.confirm("Are you sure that you want to replace fields with those from JSON? This cannot be undone!")
				) return;
				
				var text = fdJSON.value;
				if (text.endsWith(",")) text = text.substring(0, text.length - 1);
				var item = Json.parse(text);
				for (col in table.columns) col.load(item);
				for (fn in restore) fn(item);
				fdJSON.value = "";
			}
			//
			btTest.onclick = function() {
				var kb = buildKeyboard();
				table.loadTest(kb);
			}
		} else {
			btTest.onclick = function() {
				table.loadTest(buildKeyboard());
			}
		}
	}
}
