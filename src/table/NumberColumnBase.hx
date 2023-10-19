package table;
import js.html.Element;
import type.NumRange;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class NumberColumnBase<KB:Keyboard, NT:Float> extends FancyColumn<KB> {
	public function new(name:String) {
		super(name);
		canSort = true;
	}
	
	public var filterMin:Null<NT> = null;
	public var filterMax:Null<NT> = null;
	public var filterIncludeNull = false;
	public var filterIncludeNullLabel:String = null;
	
	public function parseFilterValue(val:String):NT {
		return null;
	}
	public function getKnownRange(keyboards:Array<KB>):NumRange<NT> {
		return null;
	}
	override public function buildFilter(out:Element):Void {
		var knownRange = getKnownRange(table.keyboards);
		if (knownRange != null) {
			out.appendDivTextNode("Available range: " + knownRange.toString());
		}
		for (step in 0 ... 2) {
			var isMin = step == 0;
			inline function get():NT {
				return isMin ? filterMin : filterMax;
			}
			inline function set(val:NT):Void {
				if (isMin) filterMin = val; else filterMax = val;
			}
			
			var startVal = get();
			var fd = document.createInputElement();
			fd.type = "number";
			fd.disabled = startVal == null;
			if (startVal != null) fd.value = "" + startVal;
			function setValue(val:Null<NT>) {
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