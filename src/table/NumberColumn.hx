package table;
import type.*;
import js.Browser;
import js.html.Element;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class NumberColumn<KB:Keyboard, NT:Float> extends NumberColumnBase<KB, NT> {
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
	
	public var access:GetSetOn<KB,NT>;
	public var defaultValue:NT = cast 0;
	public function new(name:String, access:GetSetOn<KB,NT>) {
		super(name);
		this.access = access;
	}
	override public function getKnownRange(keyboards:Array<KB>):NumRange<NT> {
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
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var fd = Browser.document.createInputElement();
		fd.type = "number";
		fd.onchange = function() {
			var val = parseFilterValue(fd.value);
			fd.setAttributeFlag("invalid", fd.value != "" && val == null);
		}
		out.appendChild(fd);
		store.push(function(kb) {
			var val = parseFilterValue(fd.value);
			if (val != null) access(kb, true, val);
		});
		restore.push(function(kb) {
			var val = access(kb);
			fd.value = val != null ? "" + val : "";
		});
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
		if (ascending) return compareValues(av, bv);
		return compareValues(bv, av);
	}
}