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
class FancyTableIntColumnBase<KB:Keyboard> extends FancyTableNumberColumnBase<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		if (val == null) return null;
		return Std.parseInt(val);
	}
}
class FancyTableIntColumn<KB:Keyboard> extends FancyTableIntColumnBase<KB> {
	public var access:GetSetOn<KB,Int>;
	public var defaultValue = 0;
	public function new(name:String, access:GetSetOn<KB,Int>) {
		super(name);
		this.access = access;
	}
	override public function getKnownRange(keyboards:Array<KB>):IntRange {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var val = access(keyboard);
			if (val != null) {
				if (min == null || val < min) min = val;
				if (max == null || val > max) max = val;
			}
		}
		return min != null ? new IntRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var val = access(kb);
		out.appendTextNode(val != null ? "" + val : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var val = access(kb);
		if (val == null) {
			if (filterIncludeNull) return true;
			val = defaultValue;
		}
		if (filterMin != null && val < filterMin) return false;
		if (filterMax != null && val > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var av = access(a) ?? defaultValue;
		var bv = access(b) ?? defaultValue;
		if (ascending) return av - bv;
		return bv - av;
	}
}
class FancyTableIntListColumn<KB:Keyboard> extends FancyTableIntColumnBase<KB> {
	public var access:GetSetOn<KB, ValList<Int>>;
	public var defaultValue:ValList<Int> = [];
	public function new(name:String, access:GetSetOn<KB, ValList<Int>>) {
		super(name);
		this.access = access;
	}
	override public function getKnownRange(keyboards:Array<KB>):IntRange {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var list = access(keyboard);
			if (list != null) {
				for (val in list) {
					if (min == null || val < min) min = val;
					if (max == null || val > max) max = val;
				}
			}
		}
		return min != null ? new IntRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var val = access(kb);
		out.appendTextNode(val != null && val.length > 0 ? val.join(" ") : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var vals = access(kb);
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
		var al = access(a) ?? [];
		var bl = access(b) ?? [];
		var am = null;
		var bm = null;
		if (ascending) {
			for (v in al) if (am == null || v < am) am = v;
			for (v in bl) if (bm == null || v < bm) bm = v;
			if (am == null) return bm == null ? 0 : -1;
			if (bm == null) return 1;
			return am - bm;
		} else {
			for (v in al) if (am == null || v > am) am = v;
			for (v in bl) if (bm == null || v > bm) bm = v;
			if (am == null) return bm == null ? 0 : 1;
			if (bm == null) return -1;
			return bm - am;
		}
	}
}
class FancyTableIntRangeColumn<KB:Keyboard> extends FancyTableIntColumnBase<KB> {
	public var access:GetSetOn<KB, IntRange>;
	public var defaultValue = new IntRange(0, 0);
	public function new(name:String, access:GetSetOn<KB, IntRange>) {
		super(name);
		this.access = access;
	}
	override public function getKnownRange(keyboards:Array<KB>):IntRange {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var range = access(keyboard);
			if (range != null) {
				if (min == null || range.min < min) min = range.min;
				if (max == null || range.max > max) max = range.max;
			}
		}
		return min != null ? new IntRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var range = access(kb);
		out.appendTextNode(range != null ? range.toString() : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var val:IntRange = access(kb) ?? defaultValue;
		if (filterMin != null && val.max < filterMin) return false;
		if (filterMax != null && val.min > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var ar = access(a) ?? defaultValue;
		var br = access(b) ?? defaultValue;
		if (ascending) {
			return ar.min - br.min;
		} else return br.max - ar.max;
	}
}
