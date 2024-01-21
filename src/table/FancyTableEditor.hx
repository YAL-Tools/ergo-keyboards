package table;
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
import type.IntRange;
import type.Keyboard;
using tools.HtmlTools;
import js.Browser.*;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableEditor {
	public static function build<KB>(table:FancyTable<KB>,
		out:FormElement,
		ddLoad:SelectElement,
		btReset:InputElement,
		btBuild:InputElement,
		btTest:InputElement,
		fdJSON:TextAreaElement
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
						FancyTableFilters.addNotesFor(note.func, notice);
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
			FancyTableFilters.addNotesFor(column.onEditorNotes ?? column.onNotes, colNameEl);
			
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
			fdJSON.value = Json.stringify(kb, null, "\t") + ",";
		}
		btReset.onclick = function() {
			if (!window.confirm(
				"Are you sure that you want to reset all fields? This cannot be undone!"
			)) return;
			out.reset();
		}
		
		if (table is KeyboardTable) {
			var kbs = (cast table:KeyboardTable<Keyboard>).values;
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
		}
		
		btTest.onclick = function() {
			table.loadTest(buildKeyboard());
		}
	}
}
