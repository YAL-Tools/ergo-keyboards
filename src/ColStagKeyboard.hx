package;
import type.IntRange;
import type.KeySpacing;
import type.Keyboard;
import type.Software;
import type.SwitchProfile;
import type.ValList;
import type.*;

/**
 * @author YellowAfterlife
 */
@:forward abstract ColStagKeyboard(ColStagKeyboardBase)
from ColStagKeyboardBase to ColStagKeyboardBase {
	public inline function new(name:String) {
		this = { name: name };
	}
	public function setMatrix(keys:IntRange, cols:IntRange, rows:IntRange) {
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
		this.hotswap = true;
		this.switchProfile = profile;
		if (profile == MX && spacing == null) spacing = MX;
		this.keySpacing = spacing;
	}
	public function setQMK(?sw:ValList<Software>) {
		this.firmware = Firmware.QMK;
		this.software = sw;
	}
}
typedef ColStagKeyboardBase = {> Keyboard,
	?cols:IntRange,
	?rows:IntRange,
	/** right-side columns */
	?rcols:Int,
	?thumbKeys:IntRange,
	?innerKeys:IntRange,
	?outerKeys:IntRange,
	?cornerKeys:IntRange,
	
	?pinkyStagger:Float,
	?splay:Splay,
};
