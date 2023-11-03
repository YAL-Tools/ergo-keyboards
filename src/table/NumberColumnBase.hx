package table;
import haxe.DynamicAccess;
import js.html.Element;
import js.html.InputElement;
import type.NumRange;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class NumberColumnBase<KB:Keyboard, NT:Float, FT> extends FancyColumn<KB> {
	public var field:FancyField<KB, FT>;
	override public function getId():String {
		return field.name;
	}
	
	public function new(name:String) {
		super(name);
		canSort = true;
	}
	
	public var filterMin:Null<NT> = null;
	public var filterMinField:InputElement = null;
	public var filterMinCheckbox:InputElement = null;
	
	public var filterMax:Null<NT> = null;
	public var filterMaxField:InputElement = null;
	public var filterMaxCheckbox:InputElement = null;
	
	public var filterIncludeNull:Bool = false;
	public var filterIncludeNullLabel:String = null;
	public var filterIncludeNullCheckbox:InputElement = null;
	
	public var suffix:String = "";
	
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
			if (isMin) {
				fd.id = field.name + "-min";
				filterMinField = fd;
			} else {
				fd.id = field.name + "-max";
				filterMaxField = fd;
			}
			fd.type = "number";
			if (knownRange != null) {
				fd.value = "" + (isMin ? knownRange.min : knownRange.max);
			}
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
			if (isMin) {
				filterMinCheckbox = cb;
				cb.id = field.name + "-min-cb";
			} else {
				filterMaxCheckbox = cb;
				cb.id = field.name + "-max-cb";
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
			cb.id = field.name + "-null-cb";
			cb.onchange = function(_) {
				filterIncludeNull = cb.checked;
				table.updateFilters();
			}
			filterIncludeNullCheckbox = cb;
			
			var lb = document.createLabelElement();
			lb.appendChild(cb);
			lb.appendTextNode(filterIncludeNullLabel);
			
			var div = document.createDivElement();
			div.appendChild(lb);
			out.appendChild(div);
		}
	}
	override public function saveFilterParams(out:DynamicAccess<String>):Void {
		if (filterMin != null && filterMax != null) {
			out[field.name] = filterMin + "~" + filterMax;
		} else {
			if (filterMin != null) out[field.name + "-min"] = "" + filterMin;
			if (filterMax != null) out[field.name + "-max"] = "" + filterMax;
		}
		if (filterIncludeNullLabel != null && filterIncludeNull) {
			out[field.name + "-null"] = "";
		}
	}
	override public function loadFilterParams(obj:DynamicAccess<String>):Bool {
		var ret = false, val:String;
		
		val = obj[field.name];
		if (val != null) do {
			ret = true;
			var pos = val.indexOf("~");
			if (pos < 0) continue;
			
			filterMinCheckbox.checked = true;
			filterMinCheckbox.triggerChange();
			filterMinField.value = val.substring(0, pos);
			filterMinField.triggerChange();
			
			filterMaxCheckbox.checked = true;
			filterMaxCheckbox.triggerChange();
			filterMaxField.value = val.substring(pos + 1);
			filterMaxField.triggerChange();
		} while (false);
		
		val = obj[field.name + "-min"];
		if (val != null) {
			ret = true;
			filterMinCheckbox.checked = true;
			filterMinCheckbox.triggerChange();
			filterMinField.value = val;
			filterMinField.triggerChange();
		}
		
		val = obj[field.name + "-max"];
		if (val != null) {
			ret = true;
			filterMaxCheckbox.checked = true;
			filterMaxCheckbox.triggerChange();
			filterMaxField.value = val;
			filterMaxField.triggerChange();
		}
		
		val = obj[field.name + "-null"];
		if (val != null) {
			ret = true;
			filterIncludeNullCheckbox.checked = true;
			filterIncludeNullCheckbox.triggerChange();
		}
		
		return ret;
	}
}