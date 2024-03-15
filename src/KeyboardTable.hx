package;
import haxe.Constraints.Function;
import js.html.Element;
import table.FancyColumn;
import table.FancyField;
import table.FancyTable;
import table.FloatColumn;
import table.IntListColumn;
import table.IntRangeColumn;
import table.LinkListColumn;
import table.NameColumn;
import table.TagColumn;
import table.TagListColumn;
import type.Assembly;
import type.CaseType;
import type.*;
import type.EncoderType;
import type.Firmware;
import type.HotSwap;
import type.KeySpacing;
import type.Keyboard;
import js.Browser.*;
import js.lib.Object;
import type.Lighting;
import type.Shape;
import type.Software;
import type.SwitchKind;
import type.SwitchProfile;
import type.ValList;
import tools.FancyTableMacro.*;
import type.WristPads;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class KeyboardTable<KB:Keyboard> extends FancyTable<KB> {
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
	
	public function resolveParent(kb:KB) {
		var parentName = kb.parent;
		if (parentName == null) return;
		kb.parent = null;
		
		var parent = values.filter(ikb -> ikb.name == parentName)[0];
		if (parent == null) {
			console.error('Unknown parent "$parentName" in "${kb.name}"');
			return;
		}
		resolveParent(parent);
		
		// don't copy link lists to children:
		var tmp = Reflect.copy(parent);
		for (col in columns) if (col is LinkListColumn) {
			var llc:LinkListColumn<KB> = cast col;
			var llCurr = llc.field.access(kb);
			if (llCurr != null && llCurr is Array) {
				if (llCurr.remove("inherit")) {
					var llParent = llc.field.access(tmp);
					var k = llParent.length;
					while (--k >= 0) llCurr.unshift(llParent[k]);
				}
			}
			llc.field.access(tmp, true, null);
		}
		
		for (key in Object.keys(tmp)) {
			var val = Reflect.field(tmp, key);
			if (val == null) continue;
			if (Reflect.field(kb, key) != null) continue;
			Reflect.setField(kb, key, val);
		}
	}
	
	function initColConnection(kb:KB) {
		var conType = new TagListColumn("Connection", mgf(kb.connection), Connection);
		conType.shortName = "Con";
		conType.shortLabels[Connection.Wired] = "W";
		conType.shortLabels[Connection.Bluetooth] = "BT";
		conType.shortLabels[Connection.Wireless] = "P";
		conType.filterLabels[Connection.Wireless] = "Other wireless";
		conType.columnCount = 2;
		addColumn(conType);
	}
	function initColNav(kb:KB, corner:Bool) {
		var navCluster = new TagListColumn("Navigation cluster", mgf(kb.navCluster), NavCluster);
		navCluster.columnCount = 2;
		navCluster.onNotes = function(div) {
			div.appendParaTextNode("Arrow keys and such.");
			var ul = div.appendElTextNode("ul", "");
			var li:Element;
			ul.appendElTextNode("li",
				'"Arrows" means that there\'s a standard T-shaped cluster.'
			);
			if (navCluster.usedValues.exists(NavCluster.Inline)) {
				li = ul.appendElTextNode("li");
				li.appendElTextNode("b", "Inline");
				li.appendTextNode(" means a 65%/75% corner with arrow keys and a column of keys"
					+ " to be used as PgUp/PgDn/Home/End");
			}
			if (navCluster.usedValues.exists(NavCluster.Duo)) {
				li = ul.appendElTextNode("li");
				li.appendElTextNode("b", "Duo");
				li.appendTextNode(" means that there are two of those"
					+ ' (second commonly being used for home/end/pgup/pgdn)');
			}
			ul.appendElTextNode("li",
				'"Full" means that there\'s an arrow cluster'
				+ ' with a standard 6/9-key cluster roughly above it.'
			);
			if (corner) div.appendParaTextNode(
				'Also see "corner keys" for alternative placement ideas'
			);
		}
		navCluster.show = false;
		navCluster.shortName = "nav";
		navCluster.filterTags = [NavCluster.Arrows, NavCluster.Duo, NavCluster.Full];
		navCluster.shortLabels[NavCluster.None] = "";
		addColumn(navCluster);
	}
	function initColNum(kb:KB) {
		var numpad = new TagListColumn("Numpad", mgf(kb.numpad), Numpad);
		numpad.show = false;
		numpad.columnCount = 2;
		numpad.onNotes = function(div) {
			var p = div.appendParaTextNode("");
			p.appendElTextNode("b", "Mini");
			p.appendTextNode(" means that it has the digit keys, but not a full set.");
		}
		addColumn(numpad);
	}
	
	function initGeneral(kb:KB) {
		var col:FancyColumn<KB>;
		mAddColumn(col = new NameColumn("Name & photo", kb.name));
		
		addFilterHeader("General");
		
		var shape = new TagListColumn("Shape", mgf(kb.shape), Shape);
		shape.show = false;
		shape.shortLabels[Shape.Monoblock] = "Mono";
		shape.shortLabels[Shape.Unibody] = "Uni";
		shape.shortLabels[Shape.Keywell] = "KW";
		shape.shortLabels[Shape.Half] = "½";
		shape.shortLabels[Shape.Special] = "*";
		shape.columnCount = 2;
		shape.onNotes = function(div) {
			var shapeUL = div.appendElTextNode("ul", "");
			if (shape.usedValues.exists(Shape.Monoblock)) shapeUL.appendElTextNode("li",
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
			if (shape.usedValues.exists(Shape.Half)) shapeUL.appendElTextNode("li",
				"Half means that it's a keypad/etc. and some work might be necessary to combine two of these"
			);
			if (shape.usedValues.exists(Shape.Special)) shapeUL.appendElTextNode("li",
				"Special means something interesting - folding keyboards, layered keyboards, and so on."
			);
		};
		addColumn(shape);
		
		var staggerType = new TagListColumn("Stagger type", mgf(kb.stagger), StaggerType);
		staggerType.show = false;
		staggerType.shortName = "Stag";
		staggerType.filterLabels[StaggerType.Column] = "Columnar";
		staggerType.filterLabels[StaggerType.Ortho] = "Ortholinear";
		staggerType.shortLabels[StaggerType.Column] = "Col";
		staggerType.shortLabels[StaggerType.Ortho] = "OL";
		addColumn(staggerType);
	}
	function initClusters(kb:KB) {
		addFilterHeader("Key clusters and specifics");
	}
	
	function initSwitch(kb:KB) {
		addFilterHeader("Switches and keycaps");
		
		var hotswap = new TagListColumn("Hot-swappable switches", mgf(kb.hotswap), HotSwap);
		hotswap.shortName = "hs";
		hotswap.shortLabels[HotSwap.Unspecified] = "";
		hotswap.shortLabels[HotSwap.Yes] = "+";
		hotswap.shortLabels[HotSwap.No] = "-";
		hotswap.columnCount = 2;
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
		switchType.filterLabels[SwitchProfile.GateronLP] = "Gateron LP";
		switchType.shortLabels[SwitchProfile.Unknown] = "";
		switchType.shortLabels[SwitchProfile.GateronLP] = "GLP";
		switchType.shortLabels[SwitchProfile.OutemuLP] = "OLP";
		switchType.shortLabels[SwitchProfile.CherryULP] = "CULP";
		switchType.shortLabels[SwitchProfile.Optical] = "Opt";
		switchType.columnCount = 2;
		addColumn(switchType);
		
		/*var switchForce = new IntListColumn(
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
		//addColumn(switchKind);*/
		
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
	function initLinks(kb:KB) {
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
		var lc:LinkListColumn<KB>;
		
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
		lc.onNotes = function(div:Element) {
			div.appendParaTextNode("A keyboard sold in a state that requires soldering.");
			div.appendParaTextNode("A kit typically consists a PCB, case,"
				+ " and components (controllers, sockets, switches)"
				+ ", but PCBs are also considered to be kits here");
		}
		
		mAddColumn(lc = new LinkListColumn("Pre-built", kb.prebuilt));
		lc.onNotes = function(div:Element):Void {
			div.appendParaTextNode("A keyboard sold in a state that does not require soldering.");
			div.appendParaTextNode("This includes pre-soldered keyboards"
				+ " (that you only need to put your switches/keycaps onto)"
				+ " and fully built keyboards."
			);
		}
		lc.shortName = "PB";
		
		var avail_fd = new FancyField("availability", function(obj:KB, ?set, ?val) {
			if (set) return null;
			function has(list:ValList<String>) {
				return list != null && list.length > 0;
			}
			var result = [];
			if (has(obj.source)) result.push(Availability.OpenSource);
			if (has(obj.kit)) result.push(Availability.Kit);
			if (has(obj.prebuilt)) result.push(Availability.PreBuilt);
			return result;
		});
		var avail = new TagListColumn("Availability", avail_fd, Availability);
		avail.shortLabels[Availability.OpenSource] = "O";
		avail.shortLabels[Availability.Kit] = "K";
		avail.shortLabels[Availability.PreBuilt] = "PB";
		avail.canEdit = false;
		avail.show = false;
		addColumn(avail);
		
		mAddColumn(lc = new LinkListColumn("Layout ref", kb.layoutRef));
		lc.show = false;
		lc.onNotes = function(div:Element):Void {
			div.appendParaTextNode("If there's a PDF/etc. that you can print"
				+ " to check how your fingers would rest on the keyboard,"
				+ " this links to that.");
			div.appendParaTextNode("For open-source keyboards with PCBs,"
				+ " you may also print the .kicad_pcb file from KiCad.");
		}
		lc.shortName = "LR";
	}
	function initInputs(kb:KB) {
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
		var col:FancyColumn<KB>;
		var irCol:IntRangeColumn<KB>;
		var fCol:FloatColumn<KB>;
		
		mAddColumn(irCol = new IntRangeColumn("Encoders", kb.encoders));
		irCol.shortName = "#enc";
		irCol.filterMinDefault = 1;
		
		var enct = new TagListColumn("Encoder type", mgf(kb.encoderType), EncoderType);
		enct.show = false;
		enct.columnCount = 2;
		enct.shortName = "EncT";
		enct.shortLabels[EncoderType.Unknown] = "";
		enct.shortLabels[EncoderType.Knob] = "K";
		enct.shortLabels[EncoderType.Wheel] = "W";
		addColumn(enct);
		
		var pds_fd = new FancyField("pointingDevices", function(kb:KB, ?set, ?val) {
			if (set) {
				kb.pointingDevices = val;
				return null;
			}
			var range:IntRange = kb.pointingDevices;
			if (range != null) return range;
			function add(item:IntRange) {
				if (item == null) return;
				if (range == null) {
					range = new IntRange(item.min, item.max);
				} else {
					range.min += item.min;
					range.max += item.max;
				}
			}
			add(kb.trackballs);
			add(kb.trackpads);
			add(kb.trackpoints);
			return range;
		});
		var pds = new IntRangeColumn("Pointing devices", pds_fd);
		pds.onNotes = function(div) {
			div.appendParaTextNode("By default, this adds up all pointing device types.");
		};
		pds.shortName = "PDs";
		pds.filterMinDefault = 1;
		pds.show = false;
		addColumn(pds);
		
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
	function initConveniences(kb:KB) {
		var header = addFilterHeader("Conveniences");
		var col:FancyColumn<KB>;
		
		var palm = new TagListColumn("Palm/wrist pads", mgf(kb.wristPads), WristPads);
		palm.show = false;
		palm.shortLabels[WristPads.None] = "";
		palm.shortLabels[WristPads.Integrated] = "+";
		palm.shortLabels[WristPads.Detachable] = "±";
		palm.columnCount = 2;
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
		
		var irCol:IntRangeColumn<KB>;
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
		ctCol.columnCount = 2;
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
	function initCuriosities(kb:KB) {
		addFilterHeader("Other curiosities");
		var col:FancyColumn<KB>;
		
		mAddColumn(col = new IntRangeColumn("Displays", kb.displays));
		col.show = false;
		
		var light = new TagListColumn("Lighting", mgf(kb.lighting), Lighting);
		light.shortLabels[Lighting.Unknown] = "";
		light.shortLabels[Lighting.None] = "-";
		light.show = false;
		light.columnCount = 2;
		addColumn(light);
		
		var fw = new TagListColumn("Firmware", mgf(kb.firmware), Firmware);
		fw.onNotes = function(div) {
			div.appendParaTextNode("Mostly determines your ability to use open-source configurators to customize the keyboard.");
			if (fw.usedValues.exists(Firmware.Simple)) {
				var p = div.appendParaTextNode("");
				p.appendElTextNode("b", "Simple");
				p.appendTextNode(" means that firmware is non-re-flashable and cannot be configured.");
			}
		}
		fw.shortLabels[Firmware.Unknown] = "";
		fw.shortLabels[Firmware.Custom] = "*";
		fw.columnCount = 2;
		fw.show = false;
		addColumn(fw);
		
		var sw = new TagListColumn("Software", mgf(kb.software), Software);
		sw.show = false;
		sw.columnCount = 2;
		addColumn(sw);
		
		var asm = new TagListColumn("Assembly specifics", mgf(kb.assembly), Assembly);
		asm.defaultValue = [];
		asm.columnCount = 2;
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
	public function getInits():KeyboardTableInitList<KB> {
		return [
			new KeyboardTableInit("general", initGeneral),
			new KeyboardTableInit("clusters", initClusters),
			new KeyboardTableInit("switch", initSwitch),
			new KeyboardTableInit("inputs", initInputs),
			new KeyboardTableInit("curios", initCuriosities),
			new KeyboardTableInit("conveniences", initConveniences),
			new KeyboardTableInit("links", initLinks),
		];
	}
	public function resolveParents() {
		for (kb in values) resolveParent(kb);
	}
	public function initKeyboards() {
		
	}
	public function post() {
		resolveParents();
		for (kb in values) {
			if (kb.assembly == null) {
				kb.assembly = [PCB];
			} else if (kb.assembly.contains(Handwired)) {
				if (kb.caseType == null) kb.caseType = [Included];
				if (kb.hotswap == null) kb.hotswap = [No];
			}
			if (kb.hotswap == null && kb.switchProfile.safeContains(CherryULP)) {
				kb.hotswap = [No];
			}
			if (kb.layoutRef != null) for (i => lr in kb.layoutRef) {
				if (lr == "SKBC") kb.layoutRef[i] = "[n:splitKbCompare] https://jhelvy.github.io/splitKbCompare/";
			}
		}
	}
	public function new() {
		super();
		var inits = getInits();
		for (init in inits) init.fn(null);
		initKeyboards();
		post();
	}
}
class KeyboardTableInit<KB> {
	public var id:String;
	public var fn:KB->Void;
	public function new(id:String, fn:KB->Void) {
		this.id = id;
		this.fn = fn;
	}
}
@:forward
abstract KeyboardTableInitList<KB>(Array<KeyboardTableInit<KB>>) from Array<KeyboardTableInit<KB>> {
	public function new() this = [];
	public function insertAfter(id:String, el:KeyboardTableInit<KB>) {
		for (i => q in this) {
			if (q.id == id) {
				this.insert(i + 1, el);
				return;
			}
		}
		throw "Couldn't find \"" + id + "\"";
	}
	public function insertBefore(id:String, el:KeyboardTableInit<KB>) {
		for (i => q in this) {
			if (q.id == id) {
				this.insert(i, el);
				return;
			}
		}
		throw "Couldn't find \"" + id + "\"";
	}
}
