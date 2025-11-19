package;
import tools.Symbols;
import type.Availability.AvailabilityColumn;
import haxe.Constraints.Function;
import haxe.Json;
import js.html.Element;
import table.*;
import table.number.*;
import table.tag.*;
import table.FancyColumn;
import table.FancyField;
import table.FancyTable;
import table.LinkListColumn;
import table.NameColumn;
import table.ParentColumn;
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
		if (kb.img == null && parent.img != null) {
			kb.img = parent.img.copy();
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
		
		conType.shortLabels[Connection.WiredHalf] = "W+BT";
		conType.filterLabels[Connection.WiredHalf] = "Wired+BT";
		conType.filterNotes[Connection.WiredHalf] = (
			"For ZMK keyboards, one half can be connected to the computer (and communicate over USB)"
			+ " while the other half talks to it over air"
		);
		
		conType.shortLabels[Connection.Bluetooth] = "BT";
		
		conType.shortLabels[Connection.Wireless] = "P";
		conType.filterLabels[Connection.Wireless] = "Other wireless";
		conType.filterNotes[Connection.Wireless] = "2.4GHz dongles and alike";
		
		conType.shortLabels[Connection.BluetoothWithCable] = "BTw";
		conType.filterLabels[Connection.BluetoothWithCable] = "BT with cable";
		conType.filterNotes[Connection.BluetoothWithCable] = (
			"Means that the keyboard connects to the computer over Bluetooth,"
			+ " but the halves talk to each other over wire"
		);
		
		conType.shortLabels[Connection.WirelessWithCable] = "Pw";
		conType.filterLabels[Connection.WirelessWithCable] = "Other with cable";
		conType.filterNotes[Connection.WirelessWithCable] = (
			"Same as \"" + conType.filterLabels[Connection.BluetoothWithCable] + "\", but for 2.4GHz/etc."
		);
		
		conType.filterTags = [Bluetooth, Wireless, BluetoothWithCable, WirelessWithCable];
		conType.columnCount = 2;
		conType.onNotes = function(div, fe) {
			conType.appendFilterNotes(div, fe);
		};
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
					+ ' (second commonly being used for Home/End/PgUp/PgDn)');
			}
			ul.appendElTextNode("li",
				'"Full" means that there\'s an arrow cluster'
				+ ' with a standard 6/9-key cluster roughly above it.'
			);
			if (corner) div.appendParaTextNode(
				'Also see "corner keys" for alternative placement ideas'
			);
		}
		navCluster.shortName = "nav";
		navCluster.filterTags = [Arrows, Inline, Duo, Full];
		navCluster.shortLabels[NavCluster.None] = "";
		addColumn(navCluster);
	}
	function initColNum(kb:KB) {
		var numpad = new TagListColumn("Numpad", mgf(kb.numpad), Numpad);
		numpad.columnCount = 2;
		numpad.onNotes = function(div) {
			var p = div.appendParaTextNode("");
			p.appendElTextNode("b", "Mini");
			p.appendTextNode(" means that it has the digit keys, but not a full set.");
		}
		addColumn(numpad);
	}
	
	public var colShape:TagListColumn<KB, Shape>;
	function initGeneral(kb:KB) {
		var col:FancyColumn<KB>;
		
		addFilterHeader("General");
		mAddColumn(col = new NameColumn("Name & photo", kb.name));
		col.show = true;
		
		mAddColumn(col = new ParentColumn("Parent", kb.parent));
		col.onEditorNotes = (out) -> {
			out.appendParaTextNode(
				"Inherits any missing fields (except lists of links) from the specified keyboard.",
				"This is not shown in user interface and primarily exists for distinct variations of the same design",
				"Load the definition of Sofle Choc Wireless for an example."
			);
		}
		
		var shape = new TagListColumn("Shape", mgf(kb.shape), Shape);
		shape.columnCount = 2;
		//
		shape.shortLabels[Shape.Monoblock] = "Mono";
		shape.shortLabels[Shape.Unibody] = "Uni";
		shape.shortLabels[Shape.Keywell] = "KW";
		shape.shortLabels[Shape.Half] = "½";
		shape.shortLabels[Shape.Special] = "*";
		//
		shape.filterNotes[Shape.Monoblock] = (
			"A single-piece keyboard with no gaps, the usual.\n"+
			"There are a couple of these here that are interesting in some way."
		);
		shape.filterNotes[Shape.Unibody] = "A single-piece keyboard with some sort of a gap in the middle.";
		shape.filterNotes[Shape.Split] = (
			"A keyboard consisting of two or more physical pieces "+
			"that are connected together with a cable or wirelessly."
		);
		shape.filterNotes[Shape.Half] = (
			"Keypads and alike, some work may be necessary to combine two of these."
		);
		shape.filterNotes[Shape.Special] = (
			"Something interesting - folding keyboards, layered keyboards, and so on."
		);
		//
		shape.onNotes = function(div, fe) {
			shape.appendFilterNotes(div, fe);
		};
		addColumn(shape);
		colShape = shape;
		
		var staggerType = new TagListColumn("Stagger type", mgf(kb.stagger), StaggerType);
		staggerType.shortName = "Stag";
		staggerType.columnCount = 2;
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
		
		var hotswap = new HotSwapColumn("Hot-swappable switches", mgf(kb.hotswap), HotSwap);
		hotswap.shortName = "hs";
		hotswap.shortLabels[HotSwap.Unspecified] = "";
		hotswap.shortLabels[HotSwap.Yes] = "+";
		hotswap.shortLabels[HotSwap.No] = "-";
		hotswap.columnCount = 2;
		hotswap.filterTags = [Yes];
		
		var switchType = new SwitchProfileColumn("Switch profile", mgf(kb.switchProfile), SwitchProfile);
		switchType.shortName = "SwP";
		//
		switchType.filterLabels[SwitchProfile.AnyHP] = "High-profile";
		switchType.filterLabels[SwitchProfile.AnyLP] = "Low-profile";
		switchType.filterLabels[SwitchProfile.AnyMechanical] = "Mechanical";
		switchType.filterLabels[SwitchProfile.AnySimple] = "Non-mechanical";
		switchType.filterLabels[SwitchProfile.Choc] = "Kailh Choc V1";
		switchType.filterLabels[SwitchProfile.ChocV2] = "Kailh Choc V2";
		switchType.filterLabels[SwitchProfile.ChocMini] = "Kailh Choc Mini";
		switchType.filterLabels[SwitchProfile.KXSwitch] = "Kailh X-Switch";
		switchType.filterLabels[SwitchProfile.GateronLP] = "Gateron LP";
		switchType.filterLabels[SwitchProfile.Topre] = "Electrocapacitive";
		switchType.filterLabels[SwitchProfile.HallEffect] = "Hall Effect";
		//
		switchType.shortLabels[SwitchProfile.Unknown] = "";
		switchType.shortLabels[SwitchProfile.KXSwitch] = "KX";
		switchType.shortLabels[SwitchProfile.ChocMini] = "mChoc";
		switchType.shortLabels[SwitchProfile.GateronLP] = "GLP";
		switchType.shortLabels[SwitchProfile.OutemuLP] = "OLP";
		switchType.shortLabels[SwitchProfile.CherryULP] = "CULP";
		switchType.shortLabels[SwitchProfile.Optical] = "Opt";
		switchType.shortLabels[SwitchProfile.Topre] = "EC";
		switchType.shortLabels[SwitchProfile.HallEffect] = "HE";
		//
		switchType.hideInEditor[SwitchProfile.AnyHP] = true;
		switchType.hideInEditor[SwitchProfile.AnyLP] = true;
		switchType.hideInEditor[SwitchProfile.AnyMechanical] = true;
		switchType.hideInEditor[SwitchProfile.AnySimple] = true;
		//
		switchType.columnCount = 2;
		
		var keySpacing = new TagListColumn("Key spacing", mgf(kb.keySpacing), KeySpacing);
		keySpacing.shortName = "kSp";
		keySpacing.filterLabels[KeySpacing.MX] = "MX (19mm x 19mm)";
		keySpacing.filterLabels[KeySpacing.MinMX] = "min. MX (16mm x 16mm)";
		keySpacing.filterLabels[KeySpacing.Choc] = "Choc (18mm x 17mm)";
		keySpacing.filterLabels[KeySpacing.CFX] = "CFX (17mm x 17mm)";
		keySpacing.filterLabels[KeySpacing.MinChoc] = "min. Choc (14.5mm x 14.5mm)";
		keySpacing.shortLabels[KeySpacing.Unknown] = "?";
		keySpacing.shortLabels[KeySpacing.MinMX] = "mMX";
		keySpacing.shortLabels[KeySpacing.MinChoc] = "mChoc";
		
		var inf = new FuncColumn("Switch summary", kb, function(out, item) {
			var short = [];
			var long = [item.name];
			
			//
			var hs = hotswap.getShortValue(item);
			if (hs != null) {
				short.push(hs);
				long.push(TagLikeListColumnTools.getValueTip(hotswap, item, false));
			}
			
			//
			var swp = item.switchProfile;
			if (swp != null) {
				var more = swp.length > 3;
				if (more) swp = swp.slice(0, 3);
				var sws = swp.map(function(sp) {
					return switchType.shortLabels[sp] ?? sp.getName();
				});
				if (more) sws.push("+");
				short.push(sws.join("," + Symbols.hairSpace));
				long.push(TagLikeListColumnTools.getValueTip(switchType, item, false));
			}
			
			//
			if (item.keySpacing != null) {
				long.push(TagLikeListColumnTools.getValueTip(keySpacing, item, false));
			}
			
			return { text: short.join(" "), tip: long.join("\n") };
		});
		inf.showInFilter = true;
		inf.shortName = "Switches";
		inf.show = true;
		
		addColumns(inf, hotswap, switchType, keySpacing);
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
		var source = lc;
		
		mAddColumn(lc = new LinkListColumn("Kits", kb.kit));
		lc.shortName = "Kit";
		lc.onNotes = function(div:Element) {
			div.appendParaTextNode("A keyboard sold in a state that requires soldering.");
			div.appendParaTextNode("A kit typically consists a PCB, case,"
				+ " and components (controllers, sockets, switches)"
				+ ", but PCBs are also considered to be kits here");
		}
		var kit = lc;
		
		mAddColumn(lc = new LinkListColumn("Pre-built", kb.prebuilt));
		lc.onNotes = function(div:Element):Void {
			div.appendParaTextNode("A keyboard sold in a state that does not require soldering.");
			div.appendParaTextNode("This includes pre-soldered keyboards"
				+ " (that you only need to put your switches/keycaps onto)"
				+ " and fully built keyboards."
			);
		}
		lc.shortName = "PB";
		var prebuilt = lc;
		
		mAddColumn(lc = new LinkListColumn("Build guide (WIP)", kb.buildGuide));
		lc.onNotes = function(div:Element):Void {
			div.appendParaTextNode(
				"If the keyboard has a semi-detailed guide for making one yourself from"
				+" kit or source files, this links to that."
			);
		}
		lc.shortName = "BG";
		lc.canShowSingle = true;
		var buildGuide = lc;
		
		mAddColumn(lc = new LinkListColumn("Layout ref", kb.layoutRef));
		lc.onNotes = function(div:Element):Void {
			div.appendParaTextNode("If there's a PDF/etc. that you can print"
				+ " to check how your fingers would rest on the keyboard,"
				+ " this links to that.");
			div.appendParaTextNode("For open-source keyboards with PCBs,"
				+ " you may also print the .kicad_pcb file from KiCad.");
		}
		lc.shortName = "LR";
		lc.canShowSingle = true;
		var layoutRef = lc;
		
		//
		function avail_has(list:ValList<String>) {
			return list != null && list.length > 0;
		}
		var avail_fd = new FancyField("availability", function(obj:KB, ?set, ?val) {
			if (set) return null;
			var result = [];
			if (avail_has(obj.source)) result.push(Availability.OpenSource);
			if (avail_has(obj.kit)) result.push(Availability.Kit);
			if (avail_has(obj.prebuilt)) result.push(Availability.PreBuilt);
			if (avail_has(obj.buildGuide)) result.push(Availability.BuildGuide);
			if (avail_has(obj.layoutRef)) result.push(Availability.LayoutRef);
			return result;
		});
		var avail = new AvailabilityColumn("Availability", avail_fd, Availability);
		avail.shortName = "Links";
		avail.onBuildValue = function(out, item) {
			var first = true;
			inline function add(links:ValList<String>, col, short) {
				if (avail_has(links)) {
					if (first) {
						first = false;
					} else out.appendTextNode(", ");
					col.buildValueExt(out, item, short);
				}
			}
			add(item.source, source, "Src");
			add(item.kit, kit, "Kit");
			add(item.prebuilt, prebuilt, "PB");
			add(item.buildGuide, buildGuide, "BG");
			add(item.layoutRef, layoutRef, "LR");
		}
		avail.show = true;
		avail.filterTags = [Kit, PreBuilt];
		avail.canEdit = false;
		addColumn(avail);
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
		addColumn(pds);
		
		mAddColumn(irCol = new IntRangeColumn("Trackballs", kb.trackballs));
		irCol.filterMinDefault = 1;
		
		mAddColumn(fCol = new FloatColumn("Trackball size", kb.trackballSize));
		fCol.filterName = fCol.name + " (mm)";
		
		mAddColumn(irCol = new IntRangeColumn("Touchpads", kb.trackpads));
		irCol.filterMinDefault = 1;
		
		mAddColumn(fCol = new FloatColumn("Touchpad size", kb.trackpadSize));
		fCol.filterName = fCol.name + " (mm)";
		
		mAddColumn(irCol = new IntRangeColumn("Trackpoints", kb.trackpoints));
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"Those little pointing sticks. Usually found somewhere between the keys."
			);
		}
		
		mAddColumn(irCol = new IntRangeColumn("Joysticks", kb.joysticks));
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"Like on a game controller!"
			);
		}
		
		mAddColumn(irCol = new IntRangeColumn("Push-buttons", kb.dpads));
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"[Typically] smaller buttons that aren't regular switches.",
				"Generally good for one-off actions and less good for typing.",
			);
		}
		
		mAddColumn(irCol = new IntRangeColumn("2-way swiches", kb.rockerSwitches));
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				'Also called "rocker switches"',
				"Usually these can also be pressed down for a third action."
			);
		}
		
		mAddColumn(irCol = new IntRangeColumn("4-way switches", kb.dpads));
		irCol.filterMinDefault = 1;
		irCol.onNotes = function(div) {
			div.appendParaTextNode(
				"D-pads and alike.",
				"Some can also be clicked for a 5th action.",
				"The click usually takes 200-300g force, so don't count on it.",
			);
		}
	}
	function initConveniences(kb:KB) {
		var header = addFilterHeader("Conveniences");
		var col:FancyColumn<KB>;
		
		var palm = new TagListColumn("Palm/wrist pads", mgf(kb.wristPads), WristPads);
		palm.shortName = "Pads";
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
		
		var tkCol = new TagListColumn("Tenting", mgf(kb.tenting), Tenting);
		tkCol.columnCount = 2;
		addColumn(tkCol);
		
		/*var irCol:IntRangeColumn<KB>;
		mAddColumn(irCol = new IntRangeColumn("Tilt", kb.tilt));
		irCol.suffix = "°";
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
		}*/
		
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
		addColumn(ctCol);
		
		var xCol = new LinkListColumn("Extras", mgf(kb.extras));
		xCol.onNotes = function(div) {
			div.appendParaTextNode("Cases, tenting kits, and so on");
		}
		xCol.shortName = "+";
		addColumn(xCol);
	}
	function initCuriosities(kb:KB) {
		addFilterHeader("Other curiosities");
		var col:FancyColumn<KB>;
		
		var displays = mAddColumn(new IntRangeColumn("Displays", kb.displays));
		displays.filterMinDefault = 1;
		
		var light = new TagListColumn("Lighting", mgf(kb.lighting), Lighting);
		light.defaultValue = [Lighting.RGB, Lighting.Simple];
		light.shortLabels[Lighting.Unknown] = "";
		light.shortLabels[Lighting.None] = "-";
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
		addColumn(fw);
		
		var sw = new TagListColumn("Software", mgf(kb.software), Software);
		sw.columnCount = 2;
		addColumn(sw);
		
		var asm = new TagListColumn("Assembly specifics", mgf(kb.assembly), Assembly);
		asm.defaultValue = [];
		asm.columnCount = 2;
		asm.filterNotes[PCB] = ("A little less work to build from scratch,"
			+ " but you have to order PCB(s) from somewhere."
		);
		asm.filterNotes[Handwired] = ("A little more work to build from scratch,"
			+ " but reduces the material list to readily available components and a 3d-printed case."
			+ "\nSome keyboards have separate PCB/handwire versions."
		);
		asm.filterLabels[Diodeless] = "Diodeless (WIP)";
		asm.filterNotes[Diodeless] = (
			"Means that the keyboard doesn't use diodes, which is a little less soldering."
			+ "\nRecent split keyboards under 42 keys are typically diodeless."
		);
		asm.filterLabels[Reversible] = "Reversible (WIP)";
		asm.filterNotes[Reversible] = (
			"A keyboard consists of two or more identical PCBs/cases."
			+ "\nMinimum order quantity for PCBs is usually 5,"
			+ " so this reduces the number of extra boards you end up with."
		);
		asm.filterLabels[Parametric] = "Parametric (WIP)";
		asm.filterNotes[Parametric] = (
			"Case and/or PCB are generated using a script"
			+ " that allows to adjust key positions/count to some extent"
		);
		asm.onNotes = function(div, fe) {
			asm.appendFilterNotes(div, fe);
		}
		asm.shortName = "Assembly";
		addColumn(asm);
	}
	function initControllers(kb:KB) {
		addFilterHeader("Controllers");
		inline function addHidden(col:FancyColumn<KB>) {
			addColumn(col);
		}
		
		var nCol = new IntRangeColumn("Count", mgf(kb.ctlCount));
		addHidden(nCol);
		
		var ctlCol:ControllerColumn<KB>;
		
		ctlCol = new ControllerColumn("Footprint", mgf(kb.ctlFootprint), null);
		ctlCol.columnCount = 2;
		addHidden(ctlCol);
		
		nCol = new IntRangeColumn("Pin Count", mgf(kb.ctlPinCount));
		addHidden(nCol);
		
		ctlCol = new ControllerColumn("Controller", mgf(kb.ctlName), null);
		ctlCol.columnCount = 2;
		addHidden(ctlCol);
	}
	public function getInits():KeyboardTableInitList<KB> {
		return [
			new KeyboardTableInit("general", initGeneral),
			new KeyboardTableInit("clusters", initClusters),
			new KeyboardTableInit("switch", initSwitch),
			new KeyboardTableInit("inputs", initInputs),
			new KeyboardTableInit("curios", initCuriosities),
			new KeyboardTableInit("controller", initControllers),
			new KeyboardTableInit("conveniences", initConveniences),
			new KeyboardTableInit("links", initLinks),
		];
	}
	public function resolveParents() {
		for (kb in values) resolveParent(kb);
	}
	public function initKeyboards() {
		
	}
	public var rawKeyboards:Array<KB> = [];
	public function post() {
		rawKeyboards = values.map(function(kb) {
			return cast tools.ValueTools.copy(kb);
		});
		resolveParents();
		for (kb in values) {
			if (kb.assembly == null) {
				kb.assembly = [];
			} else if (kb.assembly is String) {
				kb.assembly = [cast kb.assembly];
			}
			
			if (kb.assembly.contains(Handwired)) {
				// a handwired keyboard is a case on its own
				if (kb.caseType == null) kb.caseType = [Included];
				// usually not hot-swappable unless you're crafty
				if (kb.hotswap == null) kb.hotswap = [No];
			} else if (!kb.assembly.contains(PCB)) {
				// PCB if not said otherwise
				kb.assembly.unshift(PCB);
			}
			
			// Cherry Ultra Low Profile is not hot-swappable
			if (kb.hotswap == null && kb.switchProfile.safeContains(CherryULP)) {
				kb.hotswap = [No];
			}
			
			// ZMK splits can't currently be used in double-wired mode:
			if (kb.firmware != null
				&& kb.firmware.length == 1
				&& kb.firmware[0] == ZMK
				&& kb.shape != null
				&& kb.shape.contains(Split)
			) {
				if (kb.connection == null) {
					kb.connection = [Bluetooth];
				} else {
					kb.connection.remove(Wired);
					if (!kb.connection.contains(WiredHalf)) {
						kb.connection.push(WiredHalf);
					}
				}
			}
			
			//
			if (kb.switchProfile != null
				&& kb.switchProfile.contains(MX)
				&& (kb.keySpacing == null || kb.keySpacing.length == 0)
			) kb.keySpacing = [MX];
			
			if (kb.layoutRef != null) for (i => lr in kb.layoutRef) if (lr == "SKBC") {
				kb.layoutRef[i] = "[n:splitKbCompare] https://jhelvy.github.io/splitKbCompare/";
			}
		}
	}
	override function loadTest(kb:KB) {
		resolveParent(kb);
		super.loadTest(kb);
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
