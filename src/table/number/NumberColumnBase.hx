package table.number;
import js.html.KeyboardEvent;
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
class NumberColumnBase<VT, NT:Float, FT> extends FancyColumn<VT> {
	public var field:FancyField<VT, FT>;
	override public function getId():String {
		return field.name;
	}
	
	public function new(name:String) {
		super(name);
		canSort = true;
	}
	
	public var filterMin:Null<NT> = null;
	public var filterMinDefault:Null<NT> = null;
	public var filterMinField:InputElement = null;
	public var filterMinSlider:InputElement = null;
	public var filterMinCheckbox:InputElement = null;
	
	public var filterMax:Null<NT> = null;
	public var filterMaxDefault:Null<NT> = null;
	public var filterMaxField:InputElement = null;
	public var filterMaxSlider:InputElement = null;
	public var filterMaxCheckbox:InputElement = null;
	
	public var filterIncludeNull:Bool = false;
	public var filterIncludeNullLabel:String = null;
	public var filterIncludeNullCheckbox:InputElement = null;
	
	public var suffix:String = "";
	public var sliderStep:Float = 1;
	
	public function parseFilterValue(val:String):NT {
		return null;
	}
	public function getKnownRange(keyboards:Array<VT>):NumRange<NT> {
		return null;
	}
	override public function buildFilter(out:Element):Void {
		out.classList.add("number");
		var knownRange = getKnownRange(table.values);
		if (knownRange != null) {
			out.appendDivTextNode("Available range: " + knownRange.toString());
		}
		var setValues = [];
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
			var slider = document.createInputElement();
			slider.type = "range";
			
			if (isMin) {
				fd.id = field.name + "-min";
				slider.id = field.name + "-min-slider";
				filterMinField = fd;
				filterMinSlider = slider;
			} else {
				fd.id = field.name + "-max";
				slider.id = field.name + "-max-slider";
				filterMaxField = fd;
				filterMaxSlider = slider;
			}
			
			fd.type = "number";
			if (knownRange != null) {
				var val:String;
				if (isMin) {
					val = "" + (filterMinDefault ?? knownRange.min);
				} else {
					val = "" + (filterMaxDefault ?? knownRange.max);
				}
				fd.value = val;
				fd.addEventListener("keydown", function(e:KeyboardEvent) {
					var delta = switch (e.code) {
						case "ArrowUp": 1;
						case "ArrowDown": -1;
						default: return;
					}
					fd.valueAsNumber += delta * sliderStep;
					e.preventDefault();
				});
				slider.value = val;
				slider.step = Std.string(sliderStep);
				
				slider.min = "" + knownRange.min;
				slider.max = "" + knownRange.max;
			}
			slider.disabled = fd.disabled = startVal == null;
			if (startVal != null) {
				slider.value = fd.value = "" + startVal;
			}
			
			// kind { 0: field, 1: slider, -1: force all }
			var enforceTimeout = -1;
			function setValue(val:Null<NT>, kind:Int) {
				var old = get();
				if (old != val) {
					if (val != null) {
						if (kind != 0) fd.value = "" + val;
						if (kind != 1) slider.value = "" + val;
					}
					set(val);
					if (val != null && kind != -1) {
						if (enforceTimeout != -1) window.clearTimeout(enforceTimeout);
						enforceTimeout = window.setTimeout(function() {
							if (isMin) {
								if (filterMax != null && filterMax < filterMin) setValues[1](val, -1);
							} else {
								if (filterMin != null && filterMin > filterMax) setValues[0](val, -1);
							}
						}, 1000);
					}
					table.updateFilters();
				}
			}
			setValues[step] = setValue;
			function setFdValue(?soft:Bool) {
				var val = parseFilterValue(fd.value);
				fd.setAttributeFlag("invalid", val == null);
				if (soft && val != null) {
					if (isMin) {
						if (filterMax != null && val > filterMax) {
							setValue(filterMax, -1);
							return;
						}
					} else {
						if (filterMin != null && val < filterMin) {
							setValue(filterMin, -1);
							return;
						}
					}
				}
				setValue(val, 0);
			}
			var sliderTimeout = -1;
			function setSliderValue() {
				if (sliderTimeout != -1) window.clearTimeout(sliderTimeout);
				fd.value = slider.value;
				sliderTimeout = window.setTimeout(function() {
					sliderTimeout = -1;
					var val = parseFilterValue(slider.value);
					fd.setAttributeFlag("invalid", val == null);
					setValue(val, 1);
				}, 250);
			}
			fd.addEventListener("change", function(_) setFdValue());
			fd.addEventListener("keydown", function(_) setFdValue());
			fd.addEventListener("keyup", function(_) setFdValue());
			
			slider.addEventListener("change", function(_) setSliderValue());
			slider.addEventListener("input", function(_) setSliderValue());
			
			var cb = document.createCheckboxElement();
			cb.checked = startVal != null;
			cb.onchange = function(_) {
				fd.disabled = !cb.checked;
				slider.disabled = fd.disabled;
				if (cb.checked) {
					setFdValue(true);
				} else {
					setValue(null, -1);
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
			div.classList.add("numrow");
			div.appendChild(lb);
			div.appendChild(fd);
			div.appendChild(slider);
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
		if (val != null) {
			ret = true;
			var pos = val.indexOf("~");
			var minv:String, maxv:String;
			if (pos >= 0) {
				minv = val.substring(0, pos);
				maxv = val.substring(pos + 1);
			} else {
				minv = val;
				maxv = val;
			}
			
			filterMinCheckbox.checked = true;
			filterMinCheckbox.triggerChange();
			filterMinField.value = minv;
			filterMinField.triggerChange();
			
			filterMaxCheckbox.checked = true;
			filterMaxCheckbox.triggerChange();
			filterMaxField.value = maxv;
			filterMaxField.triggerChange();
		} else {
			val = obj[field.name + "-min"];
			filterMinCheckbox.checked = val != null;
			filterMinCheckbox.triggerChange();
			if (val != null) {
				ret = true;
				filterMinField.value = val;
				filterMinField.triggerChange();
			}
			
			val = obj[field.name + "-max"];
			filterMaxCheckbox.checked = val != null;
			filterMaxCheckbox.triggerChange();
			if (val != null) {
				ret = true;
				filterMaxField.value = val;
				filterMaxField.triggerChange();
			}
		}
		
		if (filterIncludeNullCheckbox != null) {
			val = obj[field.name + "-null"];
			filterIncludeNullCheckbox.checked = val != null;
			filterIncludeNullCheckbox.triggerChange();
			if (val != null) {
				ret = true;
			}
		}
		
		return ret;
	}
}