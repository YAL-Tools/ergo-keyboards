package ;
import js.Browser.*;
import type.*;
import js.html.Element;
import table.FancyField;
import table.FloatColumn;
import table.IntRangeColumn;
import table.LinkListColumn;
import table.TagColumn;
import table.TagListColumn;
import type.Keyboard;
import type.HotSwap;
import tools.FancyTableMacro.*;
import table.FancyTable;
import table.FancyColumn;
import table.TagColumnBase;
import table.*;
import KeyboardTable;
import type.Splay.SplayBase;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class ColStagTable extends KeyboardTable<ColStagKeyboard> {
	
	override function initGeneral(kb:ColStagKeyboard):Void {
		super.initGeneral(kb);
		var col:FancyColumn<ColStagKeyboard>;
		
		initColConnection(kb);
		
		mAddColumn(col = new IntRangeColumn("Key count", kb.keys));
		col.shortName = "#keys";
		
		mAddColumn(col = new IntRangeColumn("Rows", kb.rows));
		col.onNotes = function(div) {
			div.appendParaTextNode(
				"The number of rows in a keyboard half's main area,"
				+ " not counting the thumb-keys row."
			);
			addImagePara(div, "matrix.png", 450, 250, "Key matrix on a Redox keyboard");
			div.appendParaTextNode(
				"Conventionally, 4th row is typically used for digit keys"
				+ " and 5th row is typically used for F-key,"
				+ " but don't let anyone tell you what to do"
				+ " - most of these keyboards are reprogrammable."
			);
		};
		
		mAddColumn(col = new IntRangeColumn("Columns", kb.cols));
		col.onNotes = function(div) {
			div.appendParaTextNode(
				"The number of columns in a keyboard half's main area,"
				+ " not counting the extension columns."
			);
			div.appendParaTextNode(
				"To avoid some classification oddities,"
				+ " let's assume non-chorded keyboards to intend to have at least 5 columns"
				+ " and evaluate edge columns based on their layout, completeness,"
				+ " and suitability for common main-area mappings."
			);
			div.appendParaTextNode(
				"For example:"
			);
			var ul = div.appendElTextNode("ul", "");
			var li:Element = ul.appendElTextNode("li",
				"ErgoDox's inner columns are extension columns since two keys are 1.5u tall."
			);
			li = ul.appendElTextNode("li",
				"Pinky4's inner columns are extension columns since the bottom keys are rotated."
			);
			li = ul.appendElTextNode("li",
				"ErgoDash's inner columns are extension columns since they are offset by half a key."
			);
			li = ul.appendElTextNode("li",
				"Spleeb's and Drift's outer columns aren't extension columns"
				+ " as only a single key is missing."
			);
			div.appendParaTextNode(
				"This system isn't perfect and some keyboards don't fit well at all,"
				+ " in which case \"outer keys\" may have to be used to roughly annotate"
				+ " total number of extra/missing keys across multiple columns."
			);
		};
		col.shortName = "Cols";
		
		var rcolsFn = function(kb:ColStagKeyboard, ?set, ?val) {
			if (set) {
				kb.rcols = val;
				return null;
			} else {
				return kb.rcols ?? kb.cols;
			}
		};
		var rcolsFd = new FancyField("rcols", rcolsFn);
		col = new IntRangeColumn("Right-side columns", rcolsFd);
		col.show = false;
		col.shortName = "ColsR";
		col.onNotes = function(div) {
			div.appendParaTextNode(
				"Sometimes a keyboard has more columns on the right side than on the left. " +
				"This can be handy to imitate a standard 65%/75% layout better, " +
				"or to make space for language-specific keys."
			);
			addImagePara(div, "rcols.png", 450, 150, "Additional columns on Articulation80");
			div.appendParaTextNode(
				"Depending on the keyboard, not all of these might be fully filled with keys."
			);
		};
		addColumn(col);
	}
	
	override function initClusters(kb:ColStagKeyboard) {
		super.initClusters(kb);
		var notes:Element, col:FancyColumn<ColStagKeyboard>, irCol:IntRangeColumn<ColStagKeyboard>;
		
		irCol = new IntRangeColumn("Thumb keys", mgf(kb.thumbKeys));
		irCol.shortName = "#thumb";
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div:Element) {
			div.appendParaTextNode(
				"Keys below the main area that are (mostly) intended to be pressed with a thumb. " +
				"Counted per keyboard half."
			);
			addImagePara(div, "thumb-keys.png", 450, 120, "Thumb keys on a Breeze keyboard");
			div.appendParaTextNode(
				"On wider keyboards thumb keys tend to smoothly transition into a key row"+
				" so we'll assume the keys under the inner-most 4 main area columns to be thumb-accessible:"
			);
			addImagePara(div, "thumb-keys-2.png", 450, 200, "Thumb keys on a Redox keyboard");
		};
		addColumn(irCol);
		
		irCol = new IntRangeColumn("Inner keys", mgf(kb.innerKeys));
		irCol.shortName = "#inner";
		irCol.filterMinDefault = 1;
		irCol.show = false;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"Sometimes keyboards have keys between the two halves that aren't part of the main area, " +
				"but still convenient enough to access."
			);
			addImagePara(div, "inner-keys.png", 450, 200, "Inner keys on a Redox keyboard");
			div.appendParaTextNode(
				"If the inner row is missing keys (such as on hummingbird-type keyboards),"
				+ " this can be negative."
			);
		};
		addColumn(irCol);
		
		mAddColumn(irCol = new IntRangeColumn("Outer keys", kb.outerKeys));
		irCol.shortName = "#outer";
		irCol.filterMinDefault = 1;
		irCol.show = false;
		irCol.onNotes = function(div) {
			div.appendParaTextNode("Sometimes a keyboard has an extra key or two on the outer edges.");
			addImagePara(div, "outer-keys.png", 450, 150, "Outer keys on an Avalanche keyboard");
			div.appendParaTextNode("And if it's missing keys on the outer columns, this can be negative.");
			addImagePara(div, "outer-keys-2.png", 450, 150, "A missing outer key on a Drift keyboard");
		};
		
		mAddColumn(irCol = new IntRangeColumn("Corner keys", kb.cornerKeys));
		irCol.shortName = "#corner";
		irCol.filterMinDefault = 1;
		irCol.show = false;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"If a keyboard has keys in bottom-left/bottom-right corners below the main area, " +
				"this is the number of such keys that are positioned in a convenient row."
			);
			addImagePara(div, "corner-keys.png", 450, 150, "Corner keys on an ErgoNICE keyboard");
			div.appendParaTextNode(
				"Such keys are often used for modifiers (on the left half) or " +
				"65%-style inline arrow key cluster / arrow key row (on the right half)."
			);
			div.appendParaTextNode(
				"If corner keys transition into thumb keys, this is capped at 5."
			);
			addImagePara(div, "corner-keys-2.png", 450, 200, "A continuous bottom row of keys on a Kapl keyboard");
		};
		
		initColNav(kb, true);
		initColNum(kb);
		
		var pinkyStag = new FloatColumn("Pinky stagger", mgf(kb.pinkyStagger));
		pinkyStag.show = false;
		pinkyStag.shortName = "pkStag";
		pinkyStag.sliderStep = "0.05";
		pinkyStag.filterIncludeNullLabel = "Include keyboards without listed stagger";
		pinkyStag.onNotes = function(div) {
			div.appendParaTextNode(
				"Stagger between pinky finger column(s) and the ring finger column, " +
				"measured in key-size units (0.5 is half a key step down)."
			);
		};
		addColumn(pinkyStag);
		
		var splay = new TagColumn("Splay", mgf(kb.splay), SplayBase);
		splay.show = false;
		splay.onNotes = function(div) {
			div.appendParaTextNode(
				"Most keyboards have columns of keys parallel to each other, " +
				"but you can also have them at a slight angle for convenience."
			);
			div.appendParaTextNode(
				'"Optional" usually means that there are two versions of the keyboard - ' +
				"one with parallel columns and one with angled columns."
			);
		};
		splay.filterLabels[SplayBase.PinkyOnly] = "Pinky columns only";
		splay.shortLabels[SplayBase.No] = "-";
		splay.shortLabels[SplayBase.Yes] = "+";
		splay.shortLabels[SplayBase.Optional] = "±";
		splay.shortLabels[SplayBase.PinkyOnly] = "p";
		addColumn(splay);
	}
	override public function initKeyboards():Void {
		ColStagBoards.init(values);
		OrthoBoards.init(values);
		
		var kbs:Array<ColStagKeyboard> = (cast window).keyboardData;
		for (kb in kbs) {
			if (kb is String) {
				document.querySelector("#version").innerText = cast kb;
				continue;
			}
			if (kb == null || !Reflect.isObject(kb)) continue;
			for (col in columns) col.load(kb);
			values.push(kb);
		}
	}
	override public function post():Void {
		for (kb in values) {
			if (kb.stagger == null) kb.stagger = StaggerType.Column;
			if (kb.stagger == Ortho && kb.pinkyStagger == null) kb.pinkyStagger = 0;
			if (kb.caseType == null && kb.assembly != null && kb.assembly.contains(Handwired)) {
				kb.caseType = [Included];
			}
		}
	}
}
