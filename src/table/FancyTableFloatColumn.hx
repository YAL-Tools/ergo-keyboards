package table;
import js.html.Element;
import type.GetSetOn;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableFloatColumn<KB:Keyboard> extends FancyTableNumberColumnBase<KB, Float> {
	public var access:GetSetOn<KB, Float>;
	public var defaultValue = 0.;
	public function new(name:String, access:GetSetOn<KB, Float>) {
		super(name);
		this.access = access;
	}
	override public function parseFilterValue(val:String):Float {
		if (val == null) return null;
		val = StringTools.replace(val, ",", ".");
		var f = Std.parseFloat(val);
		if (Math.isNaN(f)) return null;
		return f;
	}
	override public function getKnownRange(keyboards:Array<KB>):NumRange<Float> {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var val = access(keyboard);
			if (val != null) {
				if (min == null || val < min) min = val;
				if (max == null || val > max) max = val;
			}
		}
		return min != null ? new NumRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var val = access(kb);
		out.appendTextNode(val != null ? "" + val : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var val = access(kb) ?? defaultValue;
		if (filterMin != null && val < filterMin) return false;
		if (filterMax != null && val > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var av = access(a) ?? defaultValue;
		var bv = access(b) ?? defaultValue;
		var sign = av < bv ? -1 : av > bv ? 1 : 0;
		if (!ascending) sign = -sign;
		return sign;
	}
}