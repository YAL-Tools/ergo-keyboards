package ;
import js.Browser;
import type.*;
import js.html.Element;
import table.IntRangeColumn;
import table.TagColumn;
import table.TagListColumn;
import type.Keyboard;
import type.HotSwap;
import tools.FancyTableMacro.*;
import table.FancyTable;
import table.FancyColumn;
import table.TagColumnBase;
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
		var notes:Element, col:FancyColumn<ColStagKeyboard>;
		
		col = new IntRangeColumn("Thumb keys", mgf(kb.thumbKeys));
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
		
		col = new IntRangeColumn("Inner keys", mgf(kb.innerKeys));
		col.shortName = "#inner";
		col.show = false;
		col.notes.appendParaTextNode(
			"Sometimes keyboards have keys between the two halves that aren't part of the main area, " +
			"but still convenient enough to access."
		);
		addImagePara(col.notes, "inner-keys.png", 450, 200, "Inner keys on a Redox keyboard");
		addColumn(col);
		
		mAddColumn(col = new IntRangeColumn("Outer keys", kb.outerKeys));
		col.shortName = "#outer";
		col.show = false;
		col.notes.appendParaTextNode("Sometimes a keyboard has an extra key or two on the outer edges.");
		addImagePara(col.notes, "outer-keys.png", 450, 150, "Outer keys on an Avalanche keyboard");
		col.notes.appendParaTextNode("And if it's missing keys on the outer columns, this can be negative.");
		addImagePara(col.notes, "outer-keys-2.png", 450, 150, "A missing outer key on a Drift keyboard");
		
		mAddColumn(col = new IntRangeColumn("Corner keys", kb.cornerKeys));
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
		
		var navCluster = new TagColumn("Navigation cluster", mgf(kb.navCluster), NavCluster);
		col.show = false;
		navCluster.shortName = "nav";
		navCluster.shortLabels[NavCluster.None] = "";
		addColumn(navCluster);
		
		mAddColumn(col = new FloatColumn("Pinky stagger", kb.pinkyStagger));
		col.show = false;
		col.shortName = "pkStag";
		col.notes.appendParaTextNode(
			"Stagger between pinky finger column(s) and the ring finger column, " +
			"measured in key-size units (0.5 is half a key step down)."
		);
		
		var splay = new TagColumn("Splay", mgf(kb.splay), SplayBase);
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
		var col:FancyColumn<ColStagKeyboard>;
		mAddColumn(col = new NameColumn("Name & photo", kb.name));
		
		addFilterHeader("General");
		
		var shape = new TagListColumn("Shape", mgf(kb.shape), Shape);
		shape.show = false;
		shape.shortLabels[Shape.Monoblock] = "Mono";
		shape.shortLabels[Shape.Unibody] = "Uni";
		shape.shortLabels[Shape.Keywell] = "KW";
		shape.shortLabels[Shape.Special] = "*";
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
		shapeUL.appendElTextNode("li",
			"Special means something interesting - folding keyboards, layered keyboards, and so on."
		);
			
		addColumn(shape);
		
		var staggerType = new TagColumn("Stagger type", mgf(kb.stagger), StaggerType);
		staggerType.show = false;
		staggerType.shortName = "Stag";
		staggerType.filterLabels[StaggerType.Column] = "Columnar";
		staggerType.filterLabels[StaggerType.Ortho] = "Ortholinear";
		staggerType.shortLabels[StaggerType.Column] = "Col";
		staggerType.shortLabels[StaggerType.Ortho] = "OL";
		addColumn(staggerType);
		
		var conType = new TagListColumn("Connection", mgf(kb.connection), Connection);
		conType.shortName = "Con";
		conType.shortLabels[Connection.Wired] = "W";
		conType.shortLabels[Connection.Bluetooth] = "BT";
		conType.shortLabels[Connection.Wireless] = "P";
		conType.filterLabels[Connection.Wireless] = "Proprietary/other wireless";
		addColumn(conType);
		
		mAddColumn(col = new IntRangeColumn("Key count", kb.keys));
		col.shortName = "#keys";
		
		mAddColumn(col = new IntRangeColumn("Rows", kb.rows));
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
		
		mAddColumn(col = new IntRangeColumn("Columns", kb.cols));
		col.notes.appendParaTextNode(
			"If your language has more letters than English, you may want a ≥6-column keyboard " +
			"to avoid holding down an extra key to type some of them."
		);
		addImagePara(col.notes, "sofle.png", 684, 210, "Cyrillic letters occupying most of a Sofle keyboard");
		
		
		col.shortName = "Cols";
		
		col = new IntRangeColumn("Right-side columns", function(kb:ColStagKeyboard, ?set, ?val) {
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
		
		var hotswap = new TagColumn("Hot-swappable switches", mgf(kb.hotswap), HotSwapBase);
		hotswap.shortName = "hs";
		hotswap.shortLabels[HotSwapBase.Unspecified] = "";
		hotswap.shortLabels[HotSwapBase.Yes] = "+";
		hotswap.shortLabels[HotSwapBase.No] = "-";
		addColumn(hotswap);
		
		var switchType = new TagListColumn("Switch profile", mgf(kb.switchProfile), SwitchProfile);
		switchType.shortName = "SwP";
		switchType.filterLabels[SwitchProfile.Choc] = "Kailh Choc V1";
		switchType.filterLabels[SwitchProfile.ChocV2] = "Kailh Choc V2";
		switchType.filterLabels[SwitchProfile.GateronLP] = "Gateron low-profile";
		switchType.shortLabels[SwitchProfile.Unknown] = "";
		switchType.shortLabels[SwitchProfile.GateronLP] = "GLP";
		switchType.shortLabels[SwitchProfile.CherryULP] = "CULP";
		switchType.shortLabels[SwitchProfile.Optical] = "Opt";
		addColumn(switchType);
		
		var switchForce = new IntListColumn(
			"Switch actuation force (if not hotswap)", mgf(kb.switchForce));
		switchForce.shortName = "gf";
		switchForce.nullCaption = "*";
		switchForce.filterIncludeNullLabel = "Include keyboards with hotswap switches";
		//addColumn(switchForce);
		
		var switchKind = new TagListColumn(
			"Switch feel (if not hotswap)", mgf(kb.switchKind), SwitchKind);
		switchKind.defaultValue = null;
		switchKind.shortName = "SwF";
		switchKind.shortLabels[SwitchKind.Linear] = "L";
		switchKind.shortLabels[SwitchKind.Tactile] = "T";
		switchKind.shortLabels[SwitchKind.Clicky] = "C";
		switchKind.shortLabels[SwitchKind.Other] = "#";
		switchKind.nullCaption = "*";
		//addColumn(switchKind);
		
		var colSpacing = new TagColumn("Key spacing", mgf(kb.keySpacing), KeySpacing);
		colSpacing.shortName = "kSp";
		colSpacing.show = false;
		colSpacing.filterLabels[KeySpacing.MX] = "MX (19mm x 19mm)";
		colSpacing.filterLabels[KeySpacing.Choc] = "Choc (18mm x 17mm)";
		colSpacing.filterLabels[KeySpacing.CFX] = "CFX (17mm x 17mm)";
		colSpacing.shortLabels[KeySpacing.Unknown] = "?";
		addColumn(colSpacing);
	}
	function initInputs(kb:ColStagKeyboard) {
		addFilterHeader("Other input devices");
		var col:FancyColumn<ColStagKeyboard>;
		
		mAddColumn(col = new IntRangeColumn("Encoders", kb.encoders));
		col.shortName = "#enc";
		var enct = new TagListColumn("Encoder type", mgf(kb.encoderType), EncoderType);
		enct.show = false;
		enct.shortName = "EncT";
		enct.shortLabels[EncoderType.Unknown] = "";
		enct.shortLabels[EncoderType.Knob] = "K";
		enct.shortLabels[EncoderType.Wheel] = "W";
		addColumn(enct);
		
		mAddColumn(col = new IntRangeColumn("Trackballs", kb.trackballs));
		col.show = false;
		mAddColumn(col = new FloatColumn("Trackball size", kb.trackballSize));
		col.filterName = col.name + " (mm)";
		col.show = false;
		
		mAddColumn(col = new IntRangeColumn("Touchpads", kb.trackpads));
		col.show = false;
		mAddColumn(col = new FloatColumn("Touchpad size", kb.trackpadSize));
		col.filterName = col.name + " (mm)";
		col.show = false;
		
		mAddColumn(col = new IntRangeColumn("Trackpoints", kb.trackpoints));
		col.notes.appendParaTextNode("Those little pointing sticks. Usually found somewhere between the keys.");
		col.show = false;
		
		mAddColumn(col = new IntRangeColumn("D-pads", kb.dpads));
		col.show = false;
		col.notes.appendTextNode(
			"Due to component diversity, anything that has 2 or more clicky "+
			"directional inputs counts as a dpad."
		);
		mAddColumn(col = new IntRangeColumn("D-pad directions", kb.dpadDirs));
		col.show = false;
		col.notes.appendTextNode(
			"If it's 3, it's probably a so-called rocker switch."
		);
	}
	function initConveniences(kb:ColStagKeyboard) {
		addFilterHeader("Conveniences");
		var col:FancyColumn<ColStagKeyboard>;
		
		var palm = new TagColumn("Palm/wrist pads", mgf(kb.wristPads), WristPads);
		palm.show = false;
		palm.shortLabels[WristPads.None] = "";
		palm.shortLabels[WristPads.Integrated] = "+";
		palm.shortLabels[WristPads.Detachable] = "±";
		palm.notes.appendParaTextNode(
			"Palm/wrist pads aren't very common on custom keyboards, but you can always buy them"
			+ " separately, or use any other semi-soft object of your choice"
			+ " (such as a folded little towel or a Purple Squishy)",
			"Some people argue that making your own palm rest is often preferable as you can"
			+ " pick the height/firmness."
		);
		addColumn(palm);
		
		var irCol:IntRangeColumn<ColStagKeyboard>;
		mAddColumn(irCol = new IntRangeColumn("Tilt", kb.tilt));
		irCol.suffix = "°";
		irCol.show = false;
		irCol.notes.appendParaTextNode(
			"Measured in degrees, approximately (unless specified by author/manufacturer).",
			"Positive values mean that the back edge of the keyboard is positioned higher than"
			+ " the front edge relative to the surface it's sitting on.",
			"A range usually means that keyboard has a pair (or few) legs on front/back.",
			"Not filled out for keywell keyboards since this doesn't make sense there.",
			"If the keyboard has no legs, you can always add your own - adhesive legs for laptops"
			+ " work perfectly well for keyboards too."
		);
		
		mAddColumn(irCol = new IntRangeColumn("Tenting", kb.tenting));
		irCol.suffix = "°";
		irCol.show = false;
		irCol.notes.appendParaTextNode(
			"Some keyboards have an integrated system to raise the middle part of the keyboard"
			+ " to keep palms at a more natural angle - usually either holes for tenting-legs"
			+ " or magnets hidden in the bottom plate."
		);
		addImagePara(irCol.notes, "high-stakes-tenting.jpg", 450, 244,
			'30mm vs 15mm tenting legs on ErgoHaven\'s K:02'
		);
		irCol.notes.appendParaTextNode(
			"Measured in degrees, approximately (unless specified by author/manufacturer).",
			"Much like with above, you can always make up for this yourself."
		);
		
		var ctCol = new TagListColumn("Case", mgf(kb.caseType), CaseType);
		ctCol.notes.appendParaTextNode(
			"For pre-built/kit keyboards, Included means that it comes with the keyboard.",
			"For open-source keyboards, Included means that case files can be found in the repo.",
			"Third-party means that cases can be found or bought elsewhere.",
		);
		ctCol.shortName = "Case";
		ctCol.shortLabels[CaseType.Unknown] = "";
		ctCol.shortLabels[CaseType.None] = "-";
		ctCol.shortLabels[CaseType.Included] = "+";
		ctCol.shortLabels[CaseType.ThirdParty] = "3p";
		ctCol.show = false;
		addColumn(ctCol);
		
		var xCol = new LinkListColumn("Extras", mgf(kb.extras));
		xCol.notes.appendParaTextNode("Cases, tenting kits, and so on");
		xCol.show = false;
		xCol.shortName = "xt";
		addColumn(xCol);
	}
	function initCuriosities(kb:ColStagKeyboard) {
		addFilterHeader("Other curiosities");
		var col:FancyColumn<ColStagKeyboard>;
		
		mAddColumn(col = new IntRangeColumn("Displays", kb.displays));
		col.show = false;
		
		var fw = new TagListColumn("Firmware", mgf(kb.firmware), Firmware);
		fw.shortLabels[Firmware.Unknown] = "";
		fw.shortLabels[Firmware.Custom] = "";
		fw.show = false;
		addColumn(fw);
		
		var sw = new TagListColumn("Software", mgf(kb.software), Software);
		sw.show = false;
		addColumn(sw);
		
		var asm = new TagListColumn("Assembly specifics", mgf(kb.assembly), Assembly);
		asm.defaultValue = [];
		asm.notes.appendParaTextNode(
			"Assume keyboards to have PCBs unless specified otherwise."
		);
		asm.notes.appendParaTextNode(
			"If a keyboard is marked as both PCB and handwire, it has two versions."
		);
		//asm.shortLabels[Assembly.Unspecified] = "";
		asm.shortName = "Assembly";
		asm.show = false;
		addColumn(asm);
	}
	function initLinks(kb:ColStagKeyboard) {
		addFilterHeader("Links");
		var lc:LinkListColumn<ColStagKeyboard>;
		
		mAddColumn(lc = new LinkListColumn("Website", kb.web));
		lc.shortName = "web";
		
		mAddColumn(lc = new LinkListColumn("Open-source", kb.source));
		lc.shortName = "OSH";
		
		mAddColumn(lc = new LinkListColumn("Kits", kb.kit));
		lc.shortName = "Kit";
		
		mAddColumn(lc = new LinkListColumn("Pre-built", kb.prebuilt));
		lc.shortName = "PB";
	}
	public function new() {
		super();
		
		var kb:ColStagKeyboard = null;
		initGeneral(kb);
		initSwitch(kb);
		initInputs(kb);
		initCuriosities(kb);
		initConveniences(kb);
		initLinks(kb);
		
		var col:FancyColumn<ColStagKeyboard>;
		
		ColStagBoards.init(keyboards);
		OrthoBoards.init(keyboards);
		var kbs:Array<ColStagKeyboard> = (cast Browser.window).keyboardData;
		for (kb in kbs) {
			if (kb == null || !Reflect.isObject(kb)) continue;
			for (col in columns) col.load(kb);
			keyboards.push(kb);
		}
	}
}
