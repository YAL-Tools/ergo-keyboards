package ;
import js.Browser;
import type.*;
import js.html.Element;
import type.Keyboard;
import type.HotSwap;
import tools.FancyTableMacro.*;
import table.FancyTable;
import table.FancyTableColumn;
import table.FancyTableIntColumn;
import table.FancyTableEnumColumn;
import table.*;
import type.Splay.SplayBase;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class ColStagTable extends FancyTable<ColStagKeyboard> {
	function addImagePara(notes:Element, filename:String, width:Int, height:Int, alt:String) {
		var p = Browser.document.createParagraphElement();
		p.classList.add("img");
		var img = Browser.document.createImageElement();
		img.src = "help/" + filename;
		img.alt = alt;
		img.width = width;
		img.height = height;
		p.appendChild(img);
		p.appendLineBreak();
		p.appendTextNode(alt);
		notes.appendChild(p);
		return img;
	}
	function initClusters(kb:ColStagKeyboard) {
		addFilterHeader("Key clusters and specifics");
		var notes:Element, col:FancyTableColumn<ColStagKeyboard>;
		
		col = new FancyTableIntRangeColumn("Thumb keys", mgf(kb.thumbKeys));
		col.shortName = "#thumb";
		col.notes.appendParaTextNode(
			"Keys below the main area that are (mostly) intended to be pressed with a thumb. " +
			"Counted per keyboard half."
		);
		addImagePara(col.notes, "thumb-keys.png", 450, 120, "Thumb keys on a Breeze keyboard");
		col.notes.appendParaTextNode(
			"On wider keyboards thumb keys tend to smoothly transition into a key row"+
			" so we'll assume the keys under the inner-most 4 main area columns to be thumb-accessible:"
		);
		addImagePara(col.notes, "thumb-keys-2.png", 450, 200, "Thumb keys on a Redox keyboard");
		addColumn(col);
		
		col = new FancyTableIntRangeColumn("Inner keys", mgf(kb.innerKeys));
		col.shortName = "#inner";
		col.show = false;
		col.notes.appendParaTextNode(
			"Sometimes keyboards have keys between the two halves that aren't part of the main area, " +
			"but still convenient enough to access."
		);
		addImagePara(col.notes, "inner-keys.png", 450, 200, "Inner keys on a Redox keyboard");
		addColumn(col);
		
		mAddColumn(col = new FancyTableIntRangeColumn("Outer keys", kb.outerKeys));
		col.shortName = "#outer";
		col.show = false;
		col.notes.appendParaTextNode("Sometimes a keyboard has an extra key or two on the outer edges.");
		addImagePara(col.notes, "outer-keys.png", 450, 150, "Outer keys on an Avalanche keyboard");
		col.notes.appendParaTextNode("And if it's missing keys on the outer columns, this can be negative.");
		addImagePara(col.notes, "outer-keys-2.png", 450, 150, "A missing outer key on a Drift keyboard");
		
		mAddColumn(col = new FancyTableIntRangeColumn("Corner keys", kb.cornerKeys));
		col.shortName = "#corner";
		col.show = false;
		col.notes.appendParaTextNode(
			"If a keyboard has keys in bottom-left/bottom-right corners below the main area, " +
			"this is the number of such keys that are positioned in a convenient row."
		);
		addImagePara(col.notes, "corner-keys.png", 450, 150, "Corner keys on an ErgoNICE keyboard");
		col.notes.appendParaTextNode(
			"Such keys are often used for modifiers (on the left half) or " +
			"65%-style inline arrow key cluster / arrow key row (on the right half)."
		);
		col.notes.appendParaTextNode(
			"If corner keys transition into thumb keys, this is capped at 5."
		);
		addImagePara(col.notes, "corner-keys-2.png", 450, 200, "A continuous bottom row of keys on a Kapl keyboard");
		
		var navCluster = new FancyTableTagColumn("Navigation cluster", mgf(kb.navCluster), NavCluster);
		col.show = false;
		navCluster.shortName = "nav";
		navCluster.shortLabels[NavCluster.None] = "";
		addColumn(navCluster);
		
		mAddColumn(col = new FancyTableFloatColumn("Pinky stagger", kb.pinkyStagger));
		col.show = false;
		col.shortName = "pkStag";
		col.notes.appendParaTextNode(
			"Stagger between pinky finger column(s) and the ring finger column, " +
			"measured in key-size units (0.5 is half a key step down)."
		);
		
		var splay = new FancyTableTagColumn("Splay", mgf(kb.splay), SplayBase);
		splay.show = false;
		splay.notes.appendParaTextNode(
			"Most keyboards have columns of keys parallel to each other, " +
			"but you can also have them at a slight angle for convenience."
		);
		splay.notes.appendParaTextNode(
			'"Optional" usually means that there are two versions of the keyboard - ' +
			"one with parallel columns and one with angled columns."
		);
		splay.filterLabels[SplayBase.PinkyOnly] = "Pinky columns only";
		splay.shortLabels[SplayBase.No] = "-";
		splay.shortLabels[SplayBase.Yes] = "+";
		splay.shortLabels[SplayBase.Optional] = "±";
		splay.shortLabels[SplayBase.PinkyOnly] = "p";
		addColumn(splay);
	}
	
	function initGeneral(kb:ColStagKeyboard) {
		var col:FancyTableColumn<ColStagKeyboard>;
		mAddColumn(col = new FancyTableNameColumn("Name & photo", kb.name));
		
		addFilterHeader("General");
		
		var shape = new FancyTableTagColumn("Shape", mgf(kb.shape), Shape);
		shape.show = false;
		shape.shortLabels[Shape.Monoblock] = "Mono";
		shape.shortLabels[Shape.Unibody] = "Uni";
		var shapeUL = shape.notes.appendElTextNode("ul", "");
		shapeUL.appendElTextNode("li",
			"Monoblock means a single-piece keyboard with no gaps, "+
			"such as with common non-ergonomic keyboards."
		);
		shapeUL.appendElTextNode("li",
			"Unibody means a single-piece keyboard with " +
			"some sort of a gap in the middle of it."
		);
		shapeUL.appendElTextNode("li",
			"Split means a keyboard consisting of two or more physical pieces that are connected " +
			"together with a cable or wirelessly."
		);
			
		addColumn(shape);
		
		var staggerType = new FancyTableTagColumn("Stagger type", mgf(kb.stagger), StaggerType);
		staggerType.show = false;
		staggerType.shortName = "Stag";
		staggerType.filterLabels[StaggerType.Column] = "Columnar";
		staggerType.filterLabels[StaggerType.Ortho] = "Ortholinear";
		staggerType.shortLabels[StaggerType.Column] = "Col";
		staggerType.shortLabels[StaggerType.Ortho] = "OL";
		addColumn(staggerType);
		
		var conType = new FancyTableTagListColumn("Connection", mgf(kb.connection), Connection);
		conType.shortName = "Con";
		conType.shortLabels[Connection.Wired] = "W";
		conType.shortLabels[Connection.Bluetooth] = "BT";
		conType.shortLabels[Connection.Wireless] = "P";
		conType.filterLabels[Connection.Wireless] = "Proprietary/other wireless";
		addColumn(conType);
		
		mAddColumn(col = new FancyTableIntRangeColumn("Key count", kb.keys));
		col.shortName = "#keys";
		
		mAddColumn(col = new FancyTableIntRangeColumn("Rows", kb.rows));
		col.notes.appendParaTextNode(
			"The number of rows in a keyboard's main area, " +
			"not counting thumb rows or extension columns."
		);
		addImagePara(col.notes, "matrix.png", 450, 250, "Key matrix on a Redox keyboard");
		col.notes.appendParaTextNode(
			"4th row is typically used for digits and 5th row is typically used for F-keys " +
			"or media controls, but don't let anyone tell you what to do - most of these " +
			"keyboards are reprogrammable."
		);
		
		mAddColumn(col = new FancyTableIntRangeColumn("Columns", kb.cols));
		col.notes.appendParaTextNode(
			"If your language has more letters than English, you may want a ≥6-column keyboard " +
			"to avoid holding down an extra key to type some of them."
		);
		addImagePara(col.notes, "sofle.png", 684, 210, "Cyrillic letters occupying most of a Sofle keyboard");
		
		
		col.shortName = "Cols";
		
		col = new FancyTableIntRangeColumn("Right-side columns", function(kb:ColStagKeyboard, ?set, ?val) {
			if (set) {
				kb.rcols = val;
				return null;
			} else {
				return kb.rcols ?? kb.cols;
			}
		});
		col.show = false;
		col.shortName = "ColsR";
		col.notes.appendParaTextNode(
			"Sometimes a keyboard has more columns on the right side than on the left. " +
			"This can be handy to imitate a standard 65%/75% layout better, " +
			"or to make space for language-specific keys."
		);
		addImagePara(col.notes, "rcols.png", 450, 150, "Additional columns on Articulation80");
		col.notes.appendParaTextNode(
			"Depending on the keyboard, not all of these might be fully filled with keys."
		);
		addColumn(col);
		
		initClusters(kb);
	}
	function initSwitch(kb:ColStagKeyboard) {
		addFilterHeader("Switches and keycaps");
		
		var hotswap = new FancyTableTagColumn("Hot-swappable switches", mgf(kb.hotswap), HotSwapBase);
		hotswap.shortName = "hs";
		hotswap.shortLabels[HotSwapBase.Unspecified] = "";
		hotswap.shortLabels[HotSwapBase.Yes] = "+";
		hotswap.shortLabels[HotSwapBase.No] = "-";
		addColumn(hotswap);
		
		var switchType = new FancyTableTagListColumn("Switch profile", mgf(kb.switchProfile), SwitchProfile);
		switchType.shortName = "SwP";
		switchType.filterLabels[SwitchProfile.Choc] = "Kailh Choc V1";
		switchType.filterLabels[SwitchProfile.GateronLP] = "Gateron low-profile";
		switchType.shortLabels[SwitchProfile.GateronLP] = "GLP";
		switchType.shortLabels[SwitchProfile.Optical] = "Opt";
		addColumn(switchType);
		
		var switchForce = new FancyTableIntListColumn(
			"Switch actuation force (if not hotswap)", mgf(kb.switchForce));
		switchForce.shortName = "gf";
		switchForce.nullCaption = "*";
		switchForce.filterIncludeNullLabel = "Include keyboards with hotswap switches";
		addColumn(switchForce);
		
		var switchKind = new FancyTableTagListColumn(
			"Switch feel (if not hotswap)", mgf(kb.switchKind), SwitchKind);
		switchKind.defaultValue = null;
		switchKind.shortName = "SwF";
		switchKind.shortLabels[SwitchKind.Linear] = "L";
		switchKind.shortLabels[SwitchKind.Tactile] = "T";
		switchKind.shortLabels[SwitchKind.Clicky] = "C";
		switchKind.shortLabels[SwitchKind.Other] = "#";
		switchKind.nullCaption = "*";
		addColumn(switchKind);
		
		var colSpacing = new FancyTableTagColumn("Key spacing", mgf(kb.keySpacing), KeySpacing);
		colSpacing.shortName = "kSp";
		colSpacing.show = false;
		colSpacing.filterLabels[KeySpacing.MX] = "MX (19mm x 19mm)";
		colSpacing.filterLabels[KeySpacing.Choc] = "Choc (18mm x 17mm)";
		colSpacing.filterLabels[KeySpacing.CFX] = "CFX (17mm x 17mm)";
		colSpacing.shortLabels[KeySpacing.Unknown] = "?";
		addColumn(colSpacing);
	}
	function initCuriosities(kb:ColStagKeyboard) {
		addFilterHeader("Other curiosities");
		var col:FancyTableColumn<ColStagKeyboard>;
		mAddColumn(col = new FancyTableIntRangeColumn("Encoders", kb.knobs));
		col.shortName = "Knobs";
		mAddColumn(col = new FancyTableIntRangeColumn("Trackballs", kb.trackballs));
		col.show = false;
		mAddColumn(col = new FancyTableIntRangeColumn("Trackpads", kb.trackpads));
		col.show = false;
		mAddColumn(col = new FancyTableIntRangeColumn("Displays", kb.displays));
		col.show = false;
		
		var asm = new FancyTableTagListColumn("Assembly specifics", mgf(kb.assembly), Assembly);
		asm.defaultValue = [];
		//asm.shortLabels[Assembly.Unspecified] = "";
		asm.shortName = "Assembly";
		asm.show = false;
		addColumn(asm);
	}
	function initLinks(kb:ColStagKeyboard) {
		addFilterHeader("Links");
		var lc:FancyTableLinkListColumn<ColStagKeyboard>;
		
		mAddColumn(lc = new FancyTableLinkListColumn("Website", kb.web));
		lc.shortName = "web";
		
		mAddColumn(lc = new FancyTableLinkListColumn("Open-source", kb.source));
		lc.shortName = "OSH";
		
		mAddColumn(lc = new FancyTableLinkListColumn("Kits", kb.kit));
		lc.shortName = "Kit";
		
		mAddColumn(lc = new FancyTableLinkListColumn("Pre-built", kb.prebuilt));
		lc.shortName = "PB";
	}
	public function new() {
		super();
		
		var kb:ColStagKeyboard = null;
		initGeneral(kb);
		initSwitch(kb);
		initCuriosities(kb);
		initLinks(kb);
		var col:FancyTableColumn<ColStagKeyboard>;
		
		ColStagBoards.init(keyboards);
		OrthoBoards.init(keyboards);
	}
}
