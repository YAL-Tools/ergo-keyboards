package table;
import js.html.Element;
import table.FancyTableColumn;
import type.GetSetOn;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableEnumColumn<KB:Keyboard, ET:EnumValue> extends FancyTableColumn<KB> {
	public var filterLabels:Map<ET, String> = new Map();
	public var shortLabels:Map<ET, String> = new Map();
	public var type:Enum<ET>;
	public function new(name:String, et:Enum<ET>) {
		super(name);
		this.type = et;
	}
	
	public var filterTags:Array<ET> = [];
	public var isMulti = false;
	public var filterMode:FancyTableTagFilterMode = AnyOf;
	override public function buildFilter(out:Element):Void {
		var modeSelect = document.createSelectElement();
		for (ctr in FancyTableTagFilterMode.getConstructors()) {
			var val = FancyTableTagFilterMode.createByName(ctr);
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
			filterMode = FancyTableTagFilterMode.createByName(modeSelect.value) ?? AnyOf;
			if (old != filterMode) table.updateFilters();
		}
		out.appendChild(modeSelect);
		for (ctr in Type.getEnumConstructs(type)) {
			var val:ET = Type.createEnum(type, ctr);
			var name = filterLabels[val] ?? ctr;
			
			var cb = document.createCheckboxElement();
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
			
			var lb = document.createLabelElement();
			lb.appendChild(cb);
			lb.appendTextNode(name);
			
			var div = document.createDivElement();
			div.appendChild(lb);
			out.appendChild(div);
		}
	}
}
class FancyTableTagColumn<KB:Keyboard, ET:EnumValue> extends FancyTableEnumColumn<KB, ET> {
	public var access:GetSetOn<KB, ET>;
	public var defaultValue:ET = null;
	public function new(name:String, access:GetSetOn<KB, ET>, et:Enum<ET>) {
		super(name, et);
		defaultValue = et.createByIndex(0);
		this.access = access;
		this.type = et;
	}
	function getValue(kb:KB) {
		return access(kb) ?? defaultValue;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var val = getValue(kb);
		if (val != null) {
			var name = val.getName();
			out.appendTextNode(shortLabels[val] ?? name);
			out.title = [
				kb.name,
				this.name + ":",
				filterLabels[val] ?? name,
			].join("\n");
		} else {
			out.appendTextNode(nullCaption);
		}
	}
	override public function matchesFilter(kb:KB):Bool {
		if (filterTags.length == 0) return true;
		var val = getValue(kb);
		switch (filterMode) {
			case AnyOf: return filterTags.contains(val);
			case NoneOf: return !filterTags.contains(val);
			default: return true;
		}
	}
}
class FancyTableTagListColumn<KB:Keyboard, ET:EnumValue> extends FancyTableEnumColumn<KB, ET> {
	public var access:GetSetOn<KB, ValList<ET>>;
	public var defaultValue:ValList<ET> = null;
	public function new(name:String, access:GetSetOn<KB, ValList<ET>>, et:Enum<ET>) {
		super(name, et);
		defaultValue = et.createByIndex(0);
		this.access = access;
		this.type = et;
	}
	function getValue(kb:KB) {
		return access(kb) ?? defaultValue;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var vals = getValue(kb);
		if (vals != null) {
			var tip = [
				kb.name,// + " ➜ " +
				name + ":",
			];
			for (i => val in vals) {
				if (i > 0) out.appendTextNode(", ");
				var name = val.getName();
				out.appendTextNode(shortLabels[val] ?? name);
				tip.push("· " + (filterLabels[val] ?? name));
			}
			out.title = tip.join("\n");
		} else {
			out.appendTextNode(nullCaption);
		}
	}
	override public function matchesFilter(kb:KB):Bool {
		if (filterTags.length == 0) return true;
		var vals = getValue(kb);
		if (vals == null) {
			vals = defaultValue;
			if (vals == null) vals = [];
		}
		switch (filterMode) {
			case AnyOf:
				for (val in vals) {
					if (filterTags.contains(val)) return true;
				}
				return false;
			case AllOf:
				for (val in vals) {
					if (!filterTags.contains(val)) return false;
				}
				return true;
			case NoneOf:
				for (val in vals) {
					if (filterTags.contains(val)) return false;
				}
				return true;
		}
	}
}
enum FancyTableTagFilterMode {
	AnyOf;
	AllOf;
	NoneOf;
}