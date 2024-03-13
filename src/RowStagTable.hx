package ;
import haxe.DynamicAccess;
import js.Browser.*;
import js.html.Element;
import js.html.InputElement;
import js.lib.RegExp;
import table.FancyColumn;
import table.*;
import type.*;
import table.TagColumn;
import type.row.*;
import table.FancyField;
import table.IntRangeColumn;
import table.TagListColumn;
import tools.FancyTableMacro.*;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class RowStagTable extends KeyboardTable<RowStagKeyboard> {
	override public function collectFilters():DynamicAccess<String> {
		var result = super.collectFilters();
		result["row"] = "";
		return result;
	}
	override function initGeneral(kb:RowStagKeyboard):Void {
		super.initGeneral(kb);
		initColConnection(kb);
		var col:FancyColumn<RowStagKeyboard>;
		
		mAddColumn(col = new IntRangeListColumn("Key count", kb.keys));
		col.shortName = "#keys";
		col.onEditorNotes = function(div):Void {
			var extra:InputElement = cast div.appendElTextNode("input");
			//extra.type = "number";
			extra.placeholder = "extra";
			
			var p = div.appendParaTextNode("");
			var btn:InputElement = cast p.appendElTextNode("input");
			btn.type = "button";
			btn.value = "Calculate";
			
			var ul = div.appendElTextNode("ul");
			btn.onclick = function() {
				function findInput(id:String):InputElement {
					return document.querySelectorAuto('#editor .item[data-id="$id"] .filters input');
				}
				function findValue(id:String):Int {
					return Std.parseInt(findInput(id).value) ?? 0;
				}
				var rows = findValue("rows");
				var dCols = findValue("dCols");
				var qCols = findValue("qCols");
				var aCols = findValue("aCols");
				var zCols = findValue("zCols");
				var log = [];
				var out = 0;
				function addFor(n:Int, name:String) {
					if (n == 0) return;
					out += n;
					log.push('+$n for $name');
				}
				if (rows >= 5) addFor(13, "Esc and F-row");
				if (rows >= 4) addFor(14 + dCols, "Num row (tilde to Bksp)");
				if (rows >= 3) addFor(14 + qCols, "Q-row (Tab to \\|)");
				if (rows >= 2) addFor(13 + aCols, "A-row (Caps to Enter)");
				if (rows >= 1) addFor(12 + zCols, "Z-row (Shift to Shift)");
				//
				{
					var xv = extra.value;
					var xi = 0;
					var rx = new RegExp("^(.+?)\\s*([+\\-])\\s*(\\d+)\\s*$");
					for (_ in 0 ... 16) {
						var mt = rx.exec(xv);
						if (mt == null) break;
						xi += (Std.parseInt(mt[3]) ?? 0) * (mt[2] == "-" ? -1 : 1);
						xv = mt[1];
					}
					addFor((Std.parseInt(xv) ?? 0) + xi, "User-defined");
				}
				log.push('$out total');
				
				ul.innerHTML = "";
				for (line in log) {
					ul.appendElTextNode("li", line);
				}
				findInput("keys").value = "" + out;
			}
		};
		
		mAddColumn(col = new IntRangeColumn("Rows", kb.rows));
		col.onNotes = function(div) {
			div.appendParaTextNode("(not counting the modifier row)");
		};
		
		function addColCountCol(row:Int, letter:String, f:FancyField<RowStagKeyboard, IntRange>, k1:String, k2:String) {
			var name = 'Columns Δ $row ("$letter")';
			col = new IntRangeColumn(name, f);
			col.shortName = "Δ" + letter;
			col.onNotes = function(div) {
				if (row == 0) {
					div.appendParaTextNode(
						"Number of columns in digit row "
						+ " (if keyboard has one)"
						+ " relative to a standard keyboard layout."
					);
				}
				else div.appendParaTextNode(
					"Number of columns in alpha row " + row
					+ " (starting with " + letter + " on QWERTY)"
					+ " relative to a standard keyboard layout."
				);
				var p = div.appendParaTextNode(
					"So 0 means that everything is as usual,"
					+ " -1 means that it's missing the key that would be "
				);
				p.appendElTextNode("code", k2);
				p.appendTextNode(" on en-US layout, -2 means that it's missing ");
				p.appendElTextNode("code", k1);
				p.appendTextNode(" and ");
				p.appendElTextNode("code", k2);
				p.appendTextNode(", and so on.");
			}
			col.show = false;
			addColumn(col);
		}
		addColCountCol(0, "1", mgf(kb.dCols), "-_", "=+");
		addColCountCol(1, "Q", mgf(kb.qCols), "[{", "]}");
		addColCountCol(2, "A", mgf(kb.aCols), ";:", "'\"");
		addColCountCol(3, "Z", mgf(kb.zCols), ".>", "/?");
	}
	override function initClusters(kb:RowStagKeyboard):Void {
		super.initClusters(kb);
		function addHidden(col:FancyColumn<RowStagKeyboard>) {
			col.show = false;
			addColumn(col);
		}
		
		var lshift = new TagListColumn("LShift", mgf(kb.lshift), LShiftShape);
		lshift.columnCount = 2;
		addHidden(lshift);
		
		var rshift = new TagListColumn("RShift", mgf(kb.rshift), RShiftShape);
		rshift.columnCount = 2;
		addHidden(rshift);
		
		var enter = new TagListColumn("Enter", mgf(kb.enter), EnterShape);
		enter.columnCount = 2;
		addHidden(enter);
		
		var space = new TagListColumn("Space", mgf(kb.space), SpaceShape);
		space.columnCount = 2;
		space.onNotes = function(div:Element):Void {
			var ul = div.appendElTextNode("ul"), li:Element;
			li = div.appendElTextNode("li");
			li.appendElTextNode("b", "SplitDistinct");
			li.appendTextNode(" means that the two halves of the spacebar "
				+ "emit different key codes or can be configured");
			li = div.appendElTextNode("li");
			li.appendElTextNode("b", "SplitDistinctFn");
			li.appendTextNode(" means same as above, "
				+ "but also that there's an extra 1u key on one of them");
			li = div.appendElTextNode("li");
			li.appendElTextNode("b", "Multi");
			li.appendTextNode(" means that both spacebars are split into two or more keys"
				+ " (see Thumb Keys)");
		}
		addHidden(space);
		
		var bksp = new TagListColumn("Backspace", mgf(kb.backspace), BkspShape);
		bksp.columnCount = 2;
		bksp.shortName = "Bksp";
		addHidden(bksp);
		
		var thumbKeys = new IntRangeColumn("Thumb keys", mgf(kb.thumbKeys));
		thumbKeys.defaultValue = 1;
		addHidden(thumbKeys);
		
		var fnPos = new TagColumn("Fn position", mgf(kb.fnPos), FnPos);
		fnPos.shortName = "@Fn";
		//
		fnPos.shortLabels[FnPos.LeftMost] = "Left";
		fnPos.shortLabels[FnPos.AfterLCtl] = "LCtl Fn";
		fnPos.shortLabels[FnPos.AfterLGui] = "LGui Fn";
		fnPos.shortLabels[FnPos.ReplaceLGui] = "-LGui";
		fnPos.shortLabels[FnPos.AfterLAlt] = "LAlt Fn";
		fnPos.shortLabels[FnPos.BeforeRCtl] = "Fn RCtl";
		fnPos.shortLabels[FnPos.BeforeRGui] = "Fn RGui";
		fnPos.shortLabels[FnPos.ReplaceLGui] = "-RGui";
		fnPos.shortLabels[FnPos.BeforeRAlt] = "Fn RAlt";
		fnPos.shortLabels[FnPos.BeforeMenu] = "Fn Menu";
		fnPos.shortLabels[FnPos.RightMost] = "Right";
		//
		fnPos.filterLabels[FnPos.AfterLCtl] = "After Left Control";
		fnPos.filterLabels[FnPos.AfterLGui] = "After Left Gui (Win/Cmd/Meta)";
		fnPos.filterLabels[FnPos.ReplaceLGui] = "Replaces Left Gui (Win/Cmd/Meta)";
		fnPos.filterLabels[FnPos.AfterLAlt] = "After Left Alt";
		fnPos.filterLabels[FnPos.BeforeRAlt] = "Before Right Alt";
		fnPos.filterLabels[FnPos.BeforeMenu] = "Before Menu";
		fnPos.filterLabels[FnPos.ReplaceRGui] = "Replaces Right Gui (Win/Cmd/Meta)";
		fnPos.filterLabels[FnPos.BeforeRGui] = "Before Right Gui (Win/Cmd/Meta)";
		fnPos.filterLabels[FnPos.BeforeRCtl] = "Before Right Control";
		//
		fnPos.onNotes = function(div:Element):Void {
			var p = div.appendParaTextNode("If a keyboard has a ");
			p.appendElTextNode("i", "non-remappable");
			p.appendTextNode(" Fn key, this indicates where's that");
		}
		addHidden(fnPos);
		
		var leftMods = new IntRangeColumn("Left-side mods", mgf(kb.leftMods));
		leftMods.shortName = "#lm";
		addHidden(leftMods);
		
		var rightMods = new IntRangeColumn("Right-side mods", mgf(kb.rightMods));
		leftMods.shortName = "#rm";
		addHidden(rightMods);
		
		initColNav(kb, false);
		initColNum(kb);
		
	}
	override function initInputs(kb:RowStagKeyboard):Void {
		super.initInputs(kb);
		
		var mw = new TagListColumn("Mouse wheel", mgf(kb.mouseWheel), MouseWheel);
		mw.onNotes = function(div) {
			div.appendParaTextNode("Just a mouse wheel, not remappable.");
		};
		mw.shortName = "wheel";
		mw.show = false;
		addColumn(mw);
	}
	override public function initKeyboards() {
		var kbs:Array<RowStagKeyboard> = (cast window).rowStagData;
		for (kb in kbs) {
			if (kb is String) {
				document.querySelector("#version").innerText = cast kb;
				continue;
			}
			if (kb == null || !Reflect.isObject(kb)) continue;
			for (col in columns) col.load(kb);
			values.push(kb);
		}
		ToDoList.set((cast window).rowStagTODOs);
	}
	override public function post():Void {
		super.post();
		for (kb in values) {
			if (kb.stagger == null) kb.stagger = [Row];
		}
	}
}