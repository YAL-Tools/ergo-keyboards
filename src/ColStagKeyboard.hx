package;
import haxe.extern.EitherType;
import type.IntRange;
import type.KeySpacing;
import type.Keyboard;
import type.Software;
import type.SwitchProfile;
import type.ValList;
import type.*;
import type.NumRangeList;

/**
 * @author YellowAfterlife
 */
@:forward abstract ColStagKeyboard(ColStagKeyboardBase)
from ColStagKeyboardBase to ColStagKeyboardBase {
	public function new(name:String, ?parent:EitherType<String, ColStagKeyboard>) {
		this = { name: name };
		if (parent == null) {
			//
		} else if (parent is String) {
			this.parent = parent;
		} else {
			this.parent = (parent:ColStagKeyboard).name;
		}
	}
	public function setMatrix(keys:IntRangeList, cols:IntRange, rows:IntRange) {
		this.keys = keys;
		this.cols = cols;
		this.rows = rows;
	}
	public function setExtras(
		thumbKeys:IntRange, ?innerKeys:IntRange, ?outerKeys:IntRange, ?cornerKeys:IntRange
	) {
		this.thumbKeys = thumbKeys;
		this.innerKeys = innerKeys;
		this.outerKeys = outerKeys;
		this.cornerKeys = cornerKeys;
	}
	public function setHotswap(profile:ValList<SwitchProfile>, ?spacing:KeySpacing) {
		this.hotswap = HotSwap.Yes;
		this.switchProfile = profile;
		if (profile == MX && spacing == null) spacing = KeySpacing.MX;
		this.keySpacing = spacing;
	}
	public function setNotswap(profile:ValList<SwitchProfile>, ?spacing:KeySpacing) {
		this.hotswap = HotSwap.No;
		this.switchProfile = profile;
		if (profile == MX && spacing == null) spacing = KeySpacing.MX;
		this.keySpacing = spacing;
	}
	public function setQMK(?sw:ValList<Software>) {
		this.firmware = Firmware.QMK;
		this.software = sw;
	}
	public function addSKBC() {
		if (this.layoutRef == null) this.layoutRef = [];
		this.layoutRef.push("SKBC");
	}
}
typedef ColStagKeyboardBase = {> Keyboard,
	?cols:IntRange,
	?rows:IntRange,
	
	/** left-side columns */
	?lcols:IntRange,
	/** right-side columns */
	?rcols:IntRange,
	/** middle columns... */
	?mcols:IntRange,
	
	?thumbKeys:IntRange,
	?innerKeys:IntRange,
	?outerKeys:IntRange,
	?cornerKeys:IntRange,
	
	?pinkyStagger:Float,
	?splay:Splay,
};
