package table.number;
import type.*;
import haxe.DynamicAccess;
import js.Browser;
import js.html.InputElement;
import table.FancyField;
import table.number.NumberColumn;
import table.number.NumberColumnBase;
import type.GetSetOn;
import js.html.Element;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class NumberRangeColumn<KB:NamedThing, NT:Float> extends NumberColumnBase<KB, NT, NumRange<NT>> {
	public var defaultValue:NumRange<NT> = cast new NumRange(0, 0);
	public function new(name:String, field:FancyField<KB, NumRange<NT>>) {
		super(name);
		this.field = field;
	}
	override public function getKnownRange(keyboards:Array<KB>):NumRange<NT> {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var range = field.access(keyboard);
			if (range != null) {
				if (min == null || range.min < min) min = range.min;
				if (max == null || range.max > max) max = range.max;
			}
		}
		return min != null ? new NumRange<NT>(min, max) : null;
	}
	override public function buildFilter(out:Element):Void {
		filterIncludeNull = false;
		super.buildFilter(out);
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var range = field.access(kb);
		var text = range != null ? range.toString() + suffix : nullCaption;
		var span = out.appendElTextNode("span", text);
		span.setTippyTitle([kb.name, name + ":", text].join("\n"));
	}
	override public function matchesFilter(kb:KB):Bool {
		var val:NumRange<NT> = field.access(kb) ?? defaultValue;
		if (filterMin != null && val.max < filterMin) return false;
		if (filterMax != null && val.min > filterMax) return false;
		return true;
	}
	override public function compareValues(a:KB, b:KB, ascending:Bool):Int {
		var ar = field.access(a) ?? defaultValue;
		var br = field.access(b) ?? defaultValue;
		if (ascending) {
			return NumberColumn.compareNumbers(ar.min, br.min);
		} else return NumberColumn.compareNumbers(br.max, ar.max);
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
			field.access(kb, true, new NumRange(min, max));
		});
		restore.push(function(kb) {
			var range = field.access(kb);
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
		var val = field.access(kb);
		if (val != null && val.min == val.max) field.access(kb, true, cast val.min);
	}
	override public function load(kb:KB):Void {
		var val = field.access(kb);
		if (val is Array) {
			var arr:Array<NT> = cast val;
			field.access(kb, true, new NumRange(arr[0], arr[1]));
		}
		else if (val is Float) {
			var num:NT = cast val;
			field.access(kb, true, new NumRange(num, num));
		}
	}
}