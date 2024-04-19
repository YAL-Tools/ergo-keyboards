package table.number;
import type.*;
import haxe.DynamicAccess;
import js.Browser;
import js.html.Element;
import table.FancyField;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class NumberColumn<VT, NT:Float> extends NumberColumnBase<VT, NT, NT> {
	public static function parseIntValue(val:String):Int {
		if (val == null) return null;
		return Std.parseInt(val);
	}
	public static function parseFloatValue(val:String):Float {
		if (val == null) return null;
		val = StringTools.replace(val, ",", ".");
		var f = Std.parseFloat(val);
		if (Math.isNaN(f)) return null;
		return f;
	}
	public static function compareValues<NT:Float>(a:NT, b:NT) {
		if (a < b) return -1;
		if (a > b) return 1;
		return 0;
	}
	
	public var defaultValue:NT = cast 0;
	public function new(name:String, field:FancyField<VT, NT>) {
		super(name);
		this.field = field;
	}
	override public function getKnownRange(keyboards:Array<VT>):NumRange<NT> {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var val = field.access(keyboard);
			if (val == null || !Math.isFinite(val)) continue;
			if (min == null || val < min) min = val;
			if (max == null || val > max) max = val;
		}
		return min != null ? new NumRange(min, max) : null;
	}
	override public function buildValue(out:Element, kb:VT):Void {
		var val = field.access(kb);
		out.appendTextNode(val != null ? "" + val : nullCaption);
	}
	override public function buildEditor(out:Element, store:Array<VT->Void>, restore:Array<VT->Void>):Void {
		var fd = Browser.document.createInputElement();
		fd.type = "number";
		fd.onchange = function() {
			var val = parseFilterValue(fd.value);
			fd.setAttributeFlag("invalid", fd.value != "" && val == null);
		}
		out.appendChild(fd);
		store.push(function(kb) {
			var val = parseFilterValue(fd.value);
			if (val != null) field.access(kb, true, val);
		});
		restore.push(function(kb) {
			var val = field.access(kb);
			fd.value = val != null ? "" + val : "";
		});
	}
	override public function matchesFilter(kb:VT):Bool {
		var val = field.access(kb);
		if (val == null) {
			if (filterIncludeNull) return true;
			val = defaultValue;
		}
		if (filterMin != null && val < filterMin) return false;
		if (filterMax != null && val > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:VT, b:VT, ascending:Bool):Int {
		var av = field.access(a) ?? defaultValue;
		var bv = field.access(b) ?? defaultValue;
		if (ascending) return compareValues(av, bv);
		return compareValues(bv, av);
	}
}