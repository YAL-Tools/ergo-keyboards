package table;
import haxe.DynamicAccess;
import js.html.Element;
import js.html.InputElement;
import js.html.SelectElement;
import table.FancyColumn;
import type.GetSetOn;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class TagColumnBase<KB:Keyboard, ET:EnumValue, FT> extends FancyColumn<KB> {
	public var field:FancyField<KB, FT>;
	override public function getId():String {
		return field.name;
	}
	
	public var filterLabels:Map<ET, String> = new Map();
	public var shortLabels:Map<ET, String> = new Map();
	public var type:Enum<ET>;
	public function new(name:String, et:Enum<ET>) {
		super(name);
		this.type = et;
	}
	
	public var filterTags:Array<ET> = [];
	public var filterCheckboxes:Array<InputElement> = [];
	public var isMulti = false;
	
	public var filterMode:TagFilterMode = AnyOf;
	public var filterModeSelect:SelectElement = null;
	override public function buildFilter(out:Element):Void {
		var modeSelect = document.createSelectElement();
		for (ctr in TagFilterMode.getConstructors()) {
			var val = TagFilterMode.createByName(ctr);
			var name = switch (val) {
				case AnyOf: "Any of these";
				case AllOf: if (!isMulti) continue; "All of these";
				case NoneOf: "None of these";
			}
			var opt = document.createOptionElement();
			opt.value = ctr;
			opt.appendTextNode(name);
			if (val == AnyOf) opt.selected = true;
			modeSelect.appendChild(opt);
		}
		modeSelect.onchange = function(_) {
			var old = filterMode;
			filterMode = TagFilterMode.createByName(modeSelect.value) ?? AnyOf;
			if (old != filterMode) table.updateFilters();
		}
		filterModeSelect = modeSelect;
		out.appendChild(modeSelect);
		
		for (ctr in Type.getEnumConstructs(type)) {
			var val:ET = Type.createEnum(type, ctr);
			var name = filterLabels[val] ?? ctr;
			
			var cb = document.createCheckboxElement();
			cb.checked = filterTags.contains(val);
			cb.id = field.name + "-" + val.getName();
			cb.onchange = function(_) {
				if (cb.checked) {
					if (!filterTags.contains(val)) {
						filterTags.push(val);
						table.updateFilters();
					}
				} else {
					if (filterTags.remove(val)) {
						table.updateFilters();
					}
				}
			}
			filterCheckboxes.push(cb);
			
			var lb = document.createLabelElement();
			lb.appendChild(cb);
			lb.appendTextNode(name);
			
			var div = document.createDivElement();
			div.appendChild(lb);
			out.appendChild(div);
		}
	}
	override public function saveFilterParams(obj:DynamicAccess<String>):Void {
		var name = field.name;
		if (filterMode != AnyOf) {
			obj[name + "-mode"] = filterMode.getName();
		}
		var list = filterTags.map(t->t.getName());
		if (list.length > 0) obj[name] = list.join("~");
	}
	override public function loadFilterParams(obj:DynamicAccess<String>):Bool {
		var name = field.name;
		var mode = obj[name + "-mode"];
		var ret = false;
		if (mode != null) try {
			filterMode = TagFilterMode.createByName(mode);
			filterModeSelect.value = mode;
			filterModeSelect.triggerChange();
			ret = true;
		} catch (x:Dynamic) {
			console.error("Invalid filter mode " + mode + " for " + name);
		}
		
		var listStr = obj[name];
		if (listStr != null) {
			var list = listStr.split("~");
			for (cb in filterCheckboxes) {
				cb.checked = false;
				cb.triggerChange();
			}
			for (item in list) {
				var cb = filterCheckboxes.filter(cb->cb.id == name + "-" + item)[0];
				if (cb != null) {
					cb.checked = true;
					cb.triggerChange();
					ret = true;
				}
			}
		}
		return ret;
	}
}