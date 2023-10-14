package ;
import js.Browser;
import type.*;
import type.Keyboard;
import type.HotSwap;
import tools.FancyTableMacro.*;
import table.FancyTable;
import table.FancyTableColumn;
import table.FancyTableIntColumn;
import table.FancyTableEnumColumn;
import table.*;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class ColStagTable extends FancyTable<ColStagKeyboard> {
	function initGeneral(kb:ColStagKeyboard) {
		var col:FancyTableColumn<ColStagKeyboard>;
		mAddColumn(new FancyTableNameColumn("Name", kb.name));
		
		addFilterHeader("General");
		
		var staggerType = new FancyTableTagColumn("Stagger type", mgf(kb.stagger), StaggerType);
		staggerType.shortName = "Stag";
		staggerType.filterLabels[StaggerType.Column] = "Columnar";
		staggerType.filterLabels[StaggerType.Ortho] = "Ortholinear";
		staggerType.shortLabels[StaggerType.Column] = "Col";
		staggerType.shortLabels[StaggerType.Ortho] = "OL";
		//addColumn(staggerType);
		
		var conType = new FancyTableTagListColumn("Connection", mgf(kb.connection), Connection);
		conType.shortName = "Con";
		conType.shortLabels[Connection.Wired] = "W";
		conType.shortLabels[Connection.Bluetooth] = "BT";
		conType.shortLabels[Connection.Proprietary] = "P";
		addColumn(conType);
		
		mAddColumn(col = new FancyTableIntRangeColumn("Key count", kb.keys));
		col.shortName = "#keys";
		
		mAddColumn(new FancyTableIntColumn("Rows", kb.rows));
		mAddColumn(col = new FancyTableIntColumn("Columns", kb.cols));
		col.shortName = "Cols";
		
		mAddColumn(col = new FancyTableIntRangeColumn("Thumb keys", kb.thumbKeys));
		col.shortName = "#thumb";
		col.notes.appendTextNode("Keys below and in the middle of main area of keyboard.");
		col.notes.appendLineBreak();
		col.notes.appendTextNode("For keyboards with a wide bottom row, the keys under the inner-most 4 columns are considered to be thumb-accessible.");
		col.notes.appendLineBreak();
		col.notes.appendTextNode("For ortholinear keyboards, thumb keys are the ones poking out of the rectangle");
		
		mAddColumn(col = new FancyTableIntRangeColumn("Inner keys", kb.innerKeys));
		col.shortName = "#inner";
		col.show = false;
		col.notes.appendTextNode("Keys located at the edges between keyboard halves.");
		col.notes.appendLineBreak();
		col.notes.appendTextNode("Often used for brackets or other half-common keys.");
		col.notes.appendLineBreak();
		col.notes.appendTextNode("If a keyboard is missing a key on the inner main-area row (such as 'hummingbird' keyboards do), this can be negative.");
		
		mAddColumn(col = new FancyTableIntRangeColumn("Outer keys", kb.outerKeys));
		col.shortName = "#outer";
		col.show = false;
		col.notes.appendTextNode("Sometimes a keyboard has a key or two hanging outside the outer edges.");
		col.notes.appendLineBreak();
		col.notes.appendTextNode("If a keyboard is missing a key on the edge rows, this can be negative.");
		
		mAddColumn(col = new FancyTableIntRangeColumn("Corner keys", kb.cornerKeys));
		col.shortName = "#corner";
		col.show = false;
		col.notes.appendTextNode("If a keyboard has keys in bottom-left/bottom-right corners below the main area, this is a number of such keys that are positioned in a convenient row.");
		col.notes.appendLineBreak();
		col.notes.appendTextNode("Handy for modifiers or 65%-style arrow keys.");
		
		mAddColumn(col = new FancyTableFloatColumn("Pinky stagger", kb.pinkyStagger));
		col.show = false;
		col.shortName = "pkStag";
		col.notes.appendTextNode("Stagger between pinky finger column(s) and the ring finger column, ");
		col.notes.appendLineBreak();
		col.notes.appendTextNode("This is generally rather approximate");
		
		var navCluster = new FancyTableTagColumn("Navigation cluster", mgf(kb.navCluster), NavCluster);
		col.show = false;
		navCluster.shortName = "nav";
		navCluster.shortLabels[NavCluster.None] = "";
		addColumn(navCluster);
	}
	function initSwitch(kb:ColStagKeyboard) {
		addFilterHeader("Switches and keycaps");
		
		var hotswap = new FancyTableTagColumn("Hot-swappable switches", mgf(kb.hotswap), HotSwapBase);
		hotswap.shortName = "hs";
		hotswap.shortLabels[Unspecified] = "";
		hotswap.shortLabels[Yes] = "+";
		hotswap.shortLabels[No] = "-";
		addColumn(hotswap);
		
		var switchType = new FancyTableTagListColumn("Switch profile", mgf(kb.switchProfile), SwitchProfile);
		switchType.shortName = "SwP";
		switchType.filterLabels[SwitchProfile.Choc] = "Kailh Choc V1";
		switchType.filterLabels[SwitchProfile.GateronLP] = "Gateron low-profile";
		switchType.shortLabels[SwitchProfile.GateronLP] = "GLP";
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
		switchKind.shortLabels[SwitchKind.Optic] = "O";
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
	}
}
