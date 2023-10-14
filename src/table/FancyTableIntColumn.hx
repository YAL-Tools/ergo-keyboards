package table;
import js.html.Element;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableNumberColumnBase<KB:Keyboard, NumType:Float> extends FancyTableColumn<KB> {
	public function new(name:String) {
		super(name);
		canSort = true;
	}
	
	public var filterMin:Null<NumType> = null;
	public var filterMax:Null<NumType> = null;
	public var filterIncludeNull = false;
	public var filterIncludeNullLabel:String = null;
	public function parseFilterValue(val:String):NumType {
		return null;
	}
	public function getKnownRange(keyboards:Array<KB>):NumRange<NumType> {
		return null;
	}
	override public function buildFilter(out:Element):Void {
		var knownRange = getKnownRange(table.keyboards);
		if (knownRange != null) {
			out.appendDivTextNode("Available range: " + knownRange.toString());
		}
		for (step in 0 ... 2) {
			var isMin = step == 0;
			inline function get():NumType {
				return isMin ? filterMin : filterMax;
			}
			inline function set(val:NumType):Void {
				if (isMin) filterMin = val; else filterMax = val;
			}
			
			var startVal = get();
			var fd = document.createInputElement();
			fd.type = "number";
			fd.disabled = startVal == null;
			if (startVal != null) fd.value = "" + startVal;
			function setValue(val:Null<NumType>) {
				var old = get();
				if (old != val) {
					set(val);
					table.updateFilters();
				}
			}
			function setFdValue() {
				var val = parseFilterValue(fd.value);
				fd.setAttributeFlag("invalid", val == null);
				setValue(val);
			}
			fd.onchange = function(_) setFdValue();
			fd.onkeydown = function(_) setFdValue();
			fd.onkeyup = function(_) setFdValue();
			
			var cb = document.createCheckboxElement();
			cb.checked = startVal != null;
			cb.onchange = function(_) {
				fd.disabled = !cb.checked;
				if (cb.checked) {
					setFdValue();
				} else {
					setValue(null);
				}
			}
			
			var lb = document.createLabelElement();
			lb.appendChild(cb);
			lb.appendTextNode((isMin ? "min" : "max") + ": ");
			
			var div = document.createDivElement();
			div.appendChild(lb);
			div.appendChild(fd);
			out.appendChild(div);
		}
		if (filterIncludeNullLabel != null) {
			var cb = document.createCheckboxElement();
			cb.checked = filterIncludeNull;
			cb.onchange = function(_) {
				filterIncludeNull = cb.checked;
				table.updateFilters();
			}
			
			var lb = document.createLabelElement();
			lb.appendChild(cb);
			lb.appendTextNode(filterIncludeNullLabel);
			
			var div = document.createDivElement();
			div.appendChild(lb);
			out.appendChild(div);
		}
	}
}
class FancyTableIntColumnBase<KB:Keyboard> extends FancyTableNumberColumnBase<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		if (val == null) return null;
		return Std.parseInt(val);
	}
}
class FancyTableIntColumn<KB:Keyboard> extends FancyTableIntColumnBase<KB> {
	public var getter:KB->Int;
	public var defaultValue = 0;
	public function new(name:String, getter:KB->Int) {
		super(name);
		this.getter = getter;
	}
	override public function getKnownRange(keyboards:Array<KB>):IntRange {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var val = getter(keyboard);
			if (val != null) {
				if (min == null || val < min) min = val;
				if (max == null || val > max) max = val;
			}
		}
		return min != null ? new IntRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var val = getter(kb);
		out.appendTextNode(val != null ? "" + val : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var val = getter(kb);
		if (val == null) {
			if (filterIncludeNull) return true;
			val = defaultValue;
		}
		if (filterMin != null && val < filterMin) return false;
		if (filterMax != null && val > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var av = getter(a) ?? defaultValue;
		var bv = getter(b) ?? defaultValue;
		if (ascending) return av - bv;
		return bv - av;
	}
}
class FancyTableIntListColumn<KB:Keyboard> extends FancyTableIntColumnBase<KB> {
	public var getter:KB->ValList<Int>;
	public var defaultValue:ValList<Int> = [];
	public function new(name:String, getter:KB->ValList<Int>) {
		super(name);
		this.getter = getter;
	}
	override public function getKnownRange(keyboards:Array<KB>):IntRange {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var list = getter(keyboard);
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
		var val = getter(kb);
		out.appendTextNode(val != null && val.length > 0 ? val.join(" ") : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var vals = getter(kb);
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
		var al = getter(a) ?? [];
		var bl = getter(b) ?? [];
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
	public var getter:KB->IntRange;
	public var defaultValue = new IntRange(0, 0);
	public function new(name:String, getter:KB->IntRange) {
		super(name);
		this.getter = getter;
	}
	override public function getKnownRange(keyboards:Array<KB>):IntRange {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var range = getter(keyboard);
			if (range != null) {
				if (min == null || range.min < min) min = range.min;
				if (max == null || range.max > max) max = range.max;
			}
		}
		return min != null ? new IntRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var range = getter(kb);
		out.appendTextNode(range != null ? range.toString() : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var val:IntRange = getter(kb) ?? defaultValue;
		if (filterMin != null && val.max < filterMin) return false;
		if (filterMax != null && val.min > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var ar = getter(a) ?? defaultValue;
		var br = getter(b) ?? defaultValue;
		if (ascending) {
			return ar.min - br.min;
		} else return br.max - ar.max;
	}
}
class FancyTableFloatColumn<KB:Keyboard> extends FancyTableNumberColumnBase<KB, Float> {
	public var getter:KB->Float;
	public var defaultValue = 0.;
	public function new(name:String, getter:KB->Float) {
		super(name);
		this.getter = getter;
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
			var val = getter(keyboard);
			if (val != null) {
				if (min == null || val < min) min = val;
				if (max == null || val > max) max = val;
			}
		}
		return min != null ? new NumRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var val = getter(kb);
		out.appendTextNode(val != null ? "" + val : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var val = getter(kb) ?? defaultValue;
		if (filterMin != null && val < filterMin) return false;
		if (filterMax != null && val > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var av = getter(a) ?? defaultValue;
		var bv = getter(b) ?? defaultValue;
		var sign = av < bv ? -1 : av > bv ? 1 : 0;
		if (!ascending) sign = -sign;
		return sign;
	}
}