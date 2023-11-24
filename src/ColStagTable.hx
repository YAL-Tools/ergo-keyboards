package ;
import js.Browser.*;
import type.*;
import js.html.Element;
import table.FancyField;
import table.FloatColumn;
import table.IntRangeColumn;
import table.KeyboardTable;
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
import type.Splay.SplayBase;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class ColStagTable extends KeyboardTable<ColStagKeyboard> {
	function addImagePara(notes:Element, filename:String, width:Int, height:Int, alt:String) {
		var p = document.createParagraphElement();
		p.classList.add("img");
		var img = document.createImageElement();
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
		
		var navCluster = new TagListColumn("Navigation cluster", mgf(kb.navCluster), NavCluster);
		navCluster.onNotes = function(div) {
			div.appendParaTextNode("Arrow keys and such.");
			var ul = div.appendElTextNode("ul", "");
			ul.appendElTextNode("li", '"Arrows" means that there\'s a standard T-shaped cluster.'
				
			);
			ul.appendElTextNode("li", '"Duo" means that there are two of those'
				+ ' (second commonly being used for home/end/pgup/pgdn)'
			);
			ul.appendElTextNode("li", '"Full" means that there\'s an arrow cluster'
				+ ' with a standard 6-key cluster roughly above it.'
			);
			div.appendParaTextNode(
				'Also see "corner keys" for alternative placement ideas'
			);
		}
		navCluster.show = false;
		navCluster.shortName = "nav";
		navCluster.filterTags = [NavCluster.Arrows, NavCluster.Duo, NavCluster.Full];
		navCluster.shortLabels[NavCluster.None] = "";
		addColumn(navCluster);
		
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
		shape.onNotes = function(div) {
			var shapeUL = div.appendElTextNode("ul", "");
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
		};
			
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
		
		initClusters(kb);
	}
	function initSwitch(kb:ColStagKeyboard) {
		addFilterHeader("Switches and keycaps");
		
		var hotswap = new TagListColumn("Hot-swappable switches", mgf(kb.hotswap), HotSwap);
		hotswap.shortName = "hs";
		hotswap.shortLabels[HotSwap.Unspecified] = "";
		hotswap.shortLabels[HotSwap.Yes] = "+";
		hotswap.shortLabels[HotSwap.No] = "-";
		hotswap.onBuildValue = function(out:Element, vals:ValList<HotSwap>, kb) {
			if (vals.contains(HotSwap.Yes)) {
				if (vals.contains(HotSwap.No)) {
					out.appendTextNode(String.fromCharCode(177)); // +-
				} else out.appendTextNode("+");
			} else if (vals.contains(HotSwap.No)) {
				out.appendTextNode("-");
			}
			if (vals.contains(HotSwap.Special)) out.appendTextNode("*");
			return true;
		};
		addColumn(hotswap);
		
		var switchType = new TagListColumn("Switch profile", mgf(kb.switchProfile), SwitchProfile);
		switchType.shortName = "SwP";
		switchType.filterLabels[SwitchProfile.Choc] = "Kailh Choc V1";
		switchType.filterLabels[SwitchProfile.ChocV2] = "Kailh Choc V2";
		switchType.filterLabels[SwitchProfile.GateronLP] = "Gateron low-profile";
		switchType.shortLabels[SwitchProfile.Unknown] = "";
		switchType.shortLabels[SwitchProfile.GateronLP] = "GLP";
		switchType.shortLabels[SwitchProfile.OutemuLP] = "OLP";
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
		
		var colSpacing = new TagListColumn("Key spacing", mgf(kb.keySpacing), KeySpacing);
		colSpacing.shortName = "kSp";
		colSpacing.show = false;
		colSpacing.filterLabels[KeySpacing.MX] = "MX (19mm x 19mm)";
		colSpacing.filterLabels[KeySpacing.MinMX] = "min. MX (16mm x 16mm)";
		colSpacing.filterLabels[KeySpacing.Choc] = "Choc (18mm x 17mm)";
		colSpacing.filterLabels[KeySpacing.CFX] = "CFX (17mm x 17mm)";
		colSpacing.filterLabels[KeySpacing.MinChoc] = "min. Choc (14.5mm x 14.5mm)";
		colSpacing.shortLabels[KeySpacing.Unknown] = "?";
		colSpacing.shortLabels[KeySpacing.MinMX] = "mMX";
		colSpacing.shortLabels[KeySpacing.MinChoc] = "mChoc";
		addColumn(colSpacing);
	}
	function initInputs(kb:ColStagKeyboard) {
		var header = addFilterHeader("Other input devices");
		var noteTotal = new FancyHeaderNote("NB! Counted total rather than per half");
		header.editorNotes.push(noteTotal);
		header.filterNotes.push(noteTotal);
		header.filterNotes.push(new FancyHeaderNote(
			"NB! ZMK + Wireless",
			function(div) {
				div.appendParaTextNode(
					"As of Nov 2023, ZMK firmware has limited support for pointing devices,"
					+ " therefore wireless keyboards with pointing devices typically only support them"
					+ " in (wired) QMK mode."
				);
				div.appendParaTextNode(
					"Please double-check documentation for keyboards to avoid disappointment."
				);
			}
		));
		var col:FancyColumn<ColStagKeyboard>;
		var irCol:IntRangeColumn<ColStagKeyboard>;
		var fCol:FloatColumn<ColStagKeyboard>;
		
		mAddColumn(irCol = new IntRangeColumn("Encoders", kb.encoders));
		irCol.shortName = "#enc";
		irCol.filterMinDefault = 1;
		
		var enct = new TagListColumn("Encoder type", mgf(kb.encoderType), EncoderType);
		enct.show = false;
		enct.shortName = "EncT";
		enct.shortLabels[EncoderType.Unknown] = "";
		enct.shortLabels[EncoderType.Knob] = "K";
		enct.shortLabels[EncoderType.Wheel] = "W";
		addColumn(enct);
		
		mAddColumn(irCol = new IntRangeColumn("Trackballs", kb.trackballs));
		irCol.show = false;
		irCol.filterMinDefault = 1;
		
		mAddColumn(fCol = new FloatColumn("Trackball size", kb.trackballSize));
		fCol.filterName = fCol.name + " (mm)";
		fCol.show = false;
		
		mAddColumn(irCol = new IntRangeColumn("Touchpads", kb.trackpads));
		irCol.show = false;
		irCol.filterMinDefault = 1;
		
		mAddColumn(fCol = new FloatColumn("Touchpad size", kb.trackpadSize));
		fCol.filterName = fCol.name + " (mm)";
		fCol.show = false;
		
		mAddColumn(irCol = new IntRangeColumn("Trackpoints", kb.trackpoints));
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"Those little pointing sticks. Usually found somewhere between the keys."
			);
		}
		irCol.show = false;
		
		mAddColumn(irCol = new IntRangeColumn("D-pads", kb.dpads));
		irCol.show = false;
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div) {
			div.appendTextNode(
				"Due to component diversity, anything that has 2 or more clicky "+
				"directional inputs counts as a dpad."
			);
		}
		
		mAddColumn(col = new IntRangeColumn("D-pad directions", kb.dpadDirs));
		col.show = false;
		col.onNotes = function(div) {
			div.appendTextNode(
				"If it's 3, it's probably a so-called rocker switch."
			);
		}
	}
	function initConveniences(kb:ColStagKeyboard) {
		var header = addFilterHeader("Conveniences");
		var col:FancyColumn<ColStagKeyboard>;
		
		var palm = new TagListColumn("Palm/wrist pads", mgf(kb.wristPads), WristPads);
		palm.show = false;
		palm.shortLabels[WristPads.None] = "";
		palm.shortLabels[WristPads.Integrated] = "+";
		palm.shortLabels[WristPads.Detachable] = "±";
		palm.filterTags = [WristPads.Integrated, WristPads.Detachable];
		palm.onNotes = function(div) {
			div.appendParaTextNode(
				"Palm/wrist pads aren't very common on custom keyboards, but you can always buy them"
				+ " separately, or use any other semi-soft object of your choice"
				+ " (such as a folded little towel or a Purple Squishy)",
				"Some people argue that making your own palm rest is often preferable as you can"
				+ " pick the height/firmness."
			);
		}
		addColumn(palm);
		
		var irCol:IntRangeColumn<ColStagKeyboard>;
		mAddColumn(irCol = new IntRangeColumn("Tilt", kb.tilt));
		irCol.suffix = "°";
		irCol.show = false;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"Measured in degrees, approximately (unless specified by author/manufacturer).",
				"Positive values mean that the back edge of the keyboard is positioned higher than"
				+ " the front edge relative to the surface it's sitting on.",
				"A range usually means that keyboard has a pair (or few) legs on front/back.",
				"Not filled out for keywell keyboards since this doesn't make sense there.",
				"If the keyboard has no legs, you can always add your own - adhesive legs for laptops"
				+ " work perfectly well for keyboards too."
			);
		}
		
		mAddColumn(irCol = new IntRangeColumn("Tenting", kb.tenting));
		irCol.suffix = "°";
		irCol.show = false;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"Some keyboards have an integrated system to raise the middle part of the keyboard"
				+ " to keep palms at a more natural angle - usually either holes for tenting-legs"
				+ " or magnets hidden in the bottom plate."
			);
			addImagePara(div, "high-stakes-tenting.jpg", 450, 244,
				'30mm vs 15mm tenting legs on ErgoHaven\'s K:02'
			);
			div.appendParaTextNode(
				"Measured in degrees, approximately (unless specified by author/manufacturer).",
				"Much like with above, you can always make up for this yourself."
			);
		}
		
		var ctCol = new TagListColumn("Case", mgf(kb.caseType), CaseType);
		ctCol.onNotes = function(div) {
			div.appendParaTextNode(
				"For pre-built/kit keyboards, Included means that it comes with the keyboard.",
				"For open-source keyboards, Included means that case files can be found in the repo.",
				"Third-party means that cases can be found or bought elsewhere.",
			);
		}
		ctCol.shortName = "Case";
		ctCol.shortLabels[CaseType.Unknown] = "";
		ctCol.shortLabels[CaseType.None] = "-";
		ctCol.shortLabels[CaseType.Included] = "+";
		ctCol.shortLabels[CaseType.ThirdParty] = "3p";
		ctCol.filterTags = [CaseType.Included, CaseType.ThirdParty];
		ctCol.show = false;
		addColumn(ctCol);
		
		var xCol = new LinkListColumn("Extras", mgf(kb.extras));
		xCol.onNotes = function(div) {
			div.appendParaTextNode("Cases, tenting kits, and so on");
		}
		xCol.show = false;
		xCol.shortName = "xt";
		addColumn(xCol);
	}
	function initCuriosities(kb:ColStagKeyboard) {
		addFilterHeader("Other curiosities");
		var col:FancyColumn<ColStagKeyboard>;
		
		mAddColumn(col = new IntRangeColumn("Displays", kb.displays));
		col.show = false;
		
		var light = new TagListColumn("Lighting", mgf(kb.lighting), Lighting);
		light.shortLabels[Lighting.Unknown] = "";
		light.shortLabels[Lighting.None] = "-";
		light.show = false;
		addColumn(light);
		
		var fw = new TagListColumn("Firmware", mgf(kb.firmware), Firmware);
		fw.shortLabels[Firmware.Unknown] = "";
		fw.shortLabels[Firmware.Custom] = "*";
		fw.show = false;
		addColumn(fw);
		
		var sw = new TagListColumn("Software", mgf(kb.software), Software);
		sw.show = false;
		addColumn(sw);
		
		var asm = new TagListColumn("Assembly specifics", mgf(kb.assembly), Assembly);
		asm.defaultValue = [];
		asm.onNotes = function(div) {
			div.appendParaTextNode(
				"Assume keyboards to have PCBs unless specified otherwise."
			);
			div.appendParaTextNode(
				"If a keyboard is marked as both PCB and handwire, it has two versions."
			);
		}
		//asm.shortLabels[Assembly.Unspecified] = "";
		asm.shortName = "Assembly";
		asm.show = false;
		addColumn(asm);
	}
	function initLinks(kb:ColStagKeyboard) {
		var header = addFilterHeader("Links");
		header.editorNotes.push(new FancyHeaderNote(
			"Notes on link lists",
		function(el:Element) {
			var p = el.appendParaTextNode("Links can be prefixed with a ");
			p.appendElTextNode("code", "[country code]");
			p.appendTextNode(" to indicate where a keyboard ships from - e.g.");
			
			var url = "https://yal.cc";
			el.appendElTextNode("pre", "[UA] " + url);
			
			p = el.appendParaTextNode("Would display as ");
			p.innerHTML += LinkListColumn.createFlag("UA") + "&#8201;";
			var a = p.appendElTextNode("a", url);
			a.setAttribute("href", url);
			p.appendTextNode(".");
			
			p = el.appendParaTextNode(
				"If a company has multiple regional branches,"
				+ " several codes can be appended one after another (e.g. "
			);
			p.appendElTextNode("code", "[US][DE] https://...");
			p.appendTextNode(").");
			
			p = el.appendParaTextNode("If the designer/company behind the keyboard"
				+ " sells pre-builts/kits themselves OR endorses a specific vendor"
				+ " on the project's page, such vendor links can be prefixed with a ");
			p.appendElTextNode("code", "!");
			p.appendTextNode(
				" to mark them accordingly and display them on top of the shuffled list."
			);
		}));
		var lc:LinkListColumn<ColStagKeyboard>;
		
		mAddColumn(lc = new LinkListColumn("Website", kb.web));
		lc.onNotes = function(div) {
			div.appendParaTextNode(
				"If a keyboard has a separate page/website/post explaining the project motivation/etc."
				+ " that's different from the rest of the links, that goes here."
			);
		}
		lc.shortName = "web";
		lc.canShowSingle = true;
		
		mAddColumn(lc = new LinkListColumn("Open-source", kb.source));
		lc.shortName = "OSH";
		lc.canShowSingle = true;
		
		mAddColumn(lc = new LinkListColumn("Kits", kb.kit));
		lc.shortName = "Kit";
		
		mAddColumn(lc = new LinkListColumn("Pre-built", kb.prebuilt));
		lc.onNotes = function(div:Element):Void {
			div.appendParaTextNode("");
		}
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
		
		ColStagBoards.init(values);
		OrthoBoards.init(values);
		var kbs:Array<ColStagKeyboard> = (cast window).keyboardData;
		for (kb in kbs) {
			if (kb == null || !Reflect.isObject(kb)) continue;
			for (col in columns) col.load(kb);
			values.push(kb);
		}
		for (kb in values) {
			if (kb.stagger == Ortho && kb.pinkyStagger == null) kb.pinkyStagger = 0;
			if (kb.caseType == null && kb.assembly != null && kb.assembly.contains(Handwired)) {
				kb.caseType = [Included];
			}
		}
	}
}
