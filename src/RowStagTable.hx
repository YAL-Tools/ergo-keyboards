package ;
import haxe.DynamicAccess;
import js.Browser.*;
import js.html.Element;
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
		
		mAddColumn(col = new IntRangeColumn("Key count", kb.keys));
		col.shortName = "#keys";
		
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
		addColCountCol(2, "A", mgf(kb.qCols), ";:", "'\"");
		addColCountCol(3, "Z", mgf(kb.qCols), ".>", "/?");
	}
	override function initClusters(kb:RowStagKeyboard):Void {
		super.initClusters(kb);
		function addHidden(col:FancyColumn<RowStagKeyboard>) {
			col.show = false;
			addColumn(col);
		}
		
		var lshift = new TagListColumn("LShift", mgf(kb.lshift), LShiftShape);
		addHidden(lshift);
		
		var rshift = new TagListColumn("RShift", mgf(kb.rshift), RShiftShape);
		addHidden(rshift);
		
		var enter = new TagListColumn("Enter", mgf(kb.enter), EnterShape);
		addHidden(enter);
		
		var space = new TagListColumn("Space", mgf(kb.space), SpaceShape);
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
		bksp.shortName = "Bksp";
		addHidden(bksp);
		
		var thumbKeys = new IntRangeColumn("Thumb keys", mgf(kb.thumbKeys));
		thumbKeys.defaultValue = 1;
		addHidden(thumbKeys);
		
		var fnPos = new TagColumn("Fn position", mgf(kb.fnPos), FnPos);
		fnPos.shortName = "@Fn";
		fnPos.shortLabels[FnPos.LeftMost] = "Left";
		fnPos.shortLabels[FnPos.RightMost] = "Right";
		fnPos.shortLabels[FnPos.AfterLCtl] = "LCtl Fn";
		fnPos.shortLabels[FnPos.AfterLGui] = "LGui Fn";
		fnPos.shortLabels[FnPos.AfterLAlt] = "LAlt Fn";
		fnPos.filterLabels[FnPos.AfterLAlt] = "After Left Alt";
		fnPos.filterLabels[FnPos.AfterLGui] = "After Left Gui (Win/Cmd/Meta)";
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
			if (kb == null || !Reflect.isObject(kb)) continue;
			for (col in columns) col.load(kb);
			values.push(kb);
		}
	}
	override public function post():Void {
		for (kb in values) {
			kb.stagger ??= Row;
		}
	}
}