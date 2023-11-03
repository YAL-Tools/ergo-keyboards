package table;
import type.*;
import js.html.Element;
import table.NumberColumn;
import type.NumRange;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class NumberListColumn<KB:Keyboard, NT:Float> extends NumberColumnBase<KB, NT, ValList<NT>> {
	public var defaultValue:ValList<NT> = [];
	public function new(name:String, field:FancyField<KB, ValList<NT>>) {
		super(name);
		this.field = field;
	}
	override public function getKnownRange(keyboards:Array<KB>):NumRange<NT> {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var list = field.access(keyboard);
			if (list != null) {
				for (val in list) {
					if (min == null || val < min) min = val;
					if (max == null || val > max) max = val;
				}
			}
		}
		return min != null ? new NumRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var val = field.access(kb);
		out.appendTextNode(val != null && val.length > 0 ? val.join(" ") : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var vals = field.access(kb);
		if (vals == null) {
			if (filterIncludeNull) return true;
			vals = defaultValue;
		}
		for (val in vals) {
			if (filterMin != null && val < filterMin) continue;
			if (filterMax != null && val > filterMax) continue;
			return true;
		}
		return filterMin == null && filterMax == null;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var al = field.access(a) ?? [];
		var bl = field.access(b) ?? [];
		var am = null;
		var bm = null;
		if (ascending) {
			for (v in al) if (am == null || v < am) am = v;
			for (v in bl) if (bm == null || v < bm) bm = v;
			if (am == null) return bm == null ? 0 : -1;
			if (bm == null) return 1;
			return NumberColumn.compareValues(am, bm);
		} else {
			for (v in al) if (am == null || v > am) am = v;
			for (v in bl) if (bm == null || v > bm) bm = v;
			if (am == null) return bm == null ? 0 : 1;
			if (bm == null) return -1;
			return NumberColumn.compareValues(bm, am);
		}
	}
}