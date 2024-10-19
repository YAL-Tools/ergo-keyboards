package table.number;
import type.*;
import haxe.DynamicAccess;
import js.Browser;
import js.html.InputElement;
import js.html.TextAreaElement;
import js.lib.RegExp;
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
class NumberRangeListColumn<KB:NamedThing, NT:Float> extends NumberColumnBase<KB, NT, NumRangeList<NT>> {
	public var defaultValue:Array<NumRange<NT>> = [];
	public function new(name:String, field:FancyField<KB, NumRangeList<NT>>) {
		super(name);
		this.field = field;
	}
	override public function getKnownRange(keyboards:Array<KB>):NumRange<NT> {
		var min = null, max = null;
		for (keyboard in keyboards) {
			var ranges = field.access(keyboard);
			if (ranges != null) for (range in ranges) {
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
		var vals:NumRangeList<NT> = field.access(kb) ?? defaultValue;
		for (val in vals) {
			if (filterMin != null && val.max < filterMin) continue;
			if (filterMax != null && val.min > filterMax) continue;
			return true;
		}
		return false;
	}
	override public function compareValues(a:KB, b:KB, ascending:Bool):Int {
		var ar = field.access(a) ?? defaultValue;
		var br = field.access(b) ?? defaultValue;
		var av:NT, bv:NT;
		if (ascending) {
			av = ar.calcMin();
			bv = br.calcMin();
			if (av == null) {
				return bv == null ? 0 : -1;
			} else if (bv == null) return 1;
			return NumberColumn.compareNumbers(av, bv);
		} else {
			av = ar.calcMax();
			bv = br.calcMax();
			if (av == null) {
				return bv == null ? 0 : -1;
			} else if (bv == null) return 1;
			return NumberColumn.compareNumbers(bv, av);
		}
	}
	static var rxRange = new RegExp("^(.+?)(-|\\.{2,3})(.+?)$");
	static var parseLinesError:String = null;
	function parseLines(text:String):NumRangeList<NT> {
		inline function error(msg:String) {
			parseLinesError = msg;
			return null;
		}
		var lines = StringTools.trim(text).split("\n");
		var ranges = [];
		for (line in lines) {
			line = StringTools.trim(line);
			if (line == "") continue;
			var mt = rxRange.exec(line);
			if (mt != null) {
				var a = parseFilterValue(mt[1]);
				if (a == null) return error('Invalid "from" in "$line"');
				var b = parseFilterValue(mt[3]);
				if (b == null) return error('Invalid "to" in "$line"');
				ranges.push(new NumRange(a, b));
			} else {
				var v = parseFilterValue(line);
				if (v == null) return error('Invalid value in "$line"');
				ranges.push(NumRange.fromValue(v));
			}
		}
		return ranges;
	}
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var fd:TextAreaElement = Browser.document.createTextAreaElement();
		fd.rows = 3;
		fd.placeholder = [
			"One value/range per line, e.g.",
			"42",
			"42..44",
		].join("\n");
		fd.onchange = function() {
			var ranges = parseLines(fd.value);
			fd.setAttributeFlag("invalid", ranges == null);
			if (ranges == null) {
				fd.title = parseLinesError;
			} else {
				fd.removeAttribute("title");
			}
		}
		out.appendChild(fd);
		store.push(function(kb) {
			var ranges = parseLines(fd.value);
			if (ranges == null || ranges.length == 0) return;
			field.access(kb, true, ranges);
		});
		restore.push(function(kb) {
			var ranges = field.access(kb);
			if (ranges == null || ranges.length == 0) {
				fd.value = "";
			} else {
				fd.value = ranges.map(r -> r.toString()).join("\n");
			}
		});
	}
	override public function save(kb:KB):Void {
		var ranges = field.access(kb);
		if (ranges != null) {
			if (ranges.length == 1) {
				var first = ranges[0];
				if (first is Array) {
					
				} else if (first.min == first.max) {
					field.access(kb, true, cast first.min);
				} else {
					field.access(kb, true, cast first);
				}
			} else {
				var changed = false;
				for (i in 0 ... ranges.length) {
					var range = ranges[i];
					if (range is Array) {
						//
					} else if (range.min == range.max) {
						if (!changed) {
							changed = true;
							ranges = ranges.copy();
							field.access(kb, true, ranges);
						}
						ranges[i] = cast [range.min];
					}
				}
			}
		}
	}
	override public function load(kb:KB):Void {
		var val = field.access(kb);
		if (val is Array) {
			if (val.length == 2 && val[0] is Float && val[1] is Float) {
				// [1, 2] (backwards compatibility)
				var vala:Array<NT> = cast val;
				field.access(kb, true, [new NumRange(vala[0], vala[1])]);
			}
			else for (i => sub in val) {
				if (sub is Array) {
					// [..., [1, 2], ...]
					var suba:Array<NT> = cast sub;
					if (suba.length >= 2) {
						val[i] = new NumRange(suba[0], suba[1]);
					} else {
						val[i] = NumRange.fromValue(suba[0]);
					}
				} else if (sub is Float) {
					// [..., 3, ...]
					val[i] = NumRange.fromValue((cast sub:NT));
				}
			}
		}
		else if (Reflect.isObject(val)) {
			field.access(kb, true, [cast val]);
		}
		else if (val is Float) {
			// `1`
			var num:NT = cast val;
			field.access(kb, true, [new NumRange(num, num)]);
		}
	}
}