package table;
import type.*;
import js.Browser;
import js.html.InputElement;
import table.NumberColumn;
import table.NumberColumnBase;
import type.GetSetOn;
import js.html.Element;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class NumberRangeColumn<KB:Keyboard, NT:Float> extends NumberColumnBase<KB, NT> {
	public var access:GetSetOn<KB, NumRange<NT>>;
	public var defaultValue:NumRange<NT> = cast new NumRange(0, 0);
	public function new(name:String, access:GetSetOn<KB, NumRange<NT>>) {
		super(name);
		this.access = access;
	}
	override public function getKnownRange(keyboards:Array<KB>):NumRange<NT> {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var range = access(keyboard);
			if (range != null) {
				if (min == null || range.min < min) min = range.min;
				if (max == null || range.max > max) max = range.max;
			}
		}
		return min != null ? new NumRange<NT>(min, max) : null;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var range = access(kb);
		out.appendTextNode(range != null ? range.toString() : nullCaption);
	}
	override public function matchesFilter(kb:KB):Bool {
		var val:NumRange<NT> = access(kb) ?? defaultValue;
		if (filterMin != null && val.max < filterMin) return false;
		if (filterMax != null && val.min > filterMax) return false;
		return true;
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var ar = access(a) ?? defaultValue;
		var br = access(b) ?? defaultValue;
		if (ascending) {
			return NumberColumn.compareValues(ar.min, br.min);
		} else return NumberColumn.compareValues(br.max, ar.max);
	}
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var fds:Array<InputElement> = [];
		out.classList.add("range");
		for (i in 0 ... 2) {
			var fd = Browser.document.createInputElement();
			fd.type = "number";
			fd.onchange = function() {
				var val = parseFilterValue(fd.value);
				fd.setAttributeFlag("invalid", fd.value != "" && val == null);
			};
			fd.placeholder = i == 0 ? "min" : "max";
			fds.push(fd);
			out.appendChild(fd);
			if (i == 0) out.appendTextNode(String.fromCharCode(160) + ".." + String.fromCharCode(160));
		}
		store.push(function(kb) {
			var min = parseFilterValue(fds[0].value);
			var max = parseFilterValue(fds[1].value);
			if (min == null && max == null) return;
			if (max == null) max = min; else if (min == null) min = max;
			access(kb, true, new NumRange(min, max));
		});
		restore.push(function(kb) {
			var range = access(kb);
			if (range == null) {
				fds[0].value = "";
				fds[1].value = "";
			} else {
				fds[0].value = "" + range.min;
				fds[1].value = (range.max != range.min ? "" + range.max : "");
			}
		});
	}
	override public function save(kb:KB):Void {
		var val = access(kb);
		if (val != null && val.min == val.max) access(kb, true, cast val.min);
	}
	override public function load(kb:KB):Void {
		var val = access(kb);
		if (val is Float) access(kb, true, new NumRange(cast val, cast val));
	}
}