package table;
import js.html.Element;
import table.FancyColumn;
import table.TagLikeColumnTools;
import type.GetSetOn;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class TagColumn<KB:Keyboard, ET:EnumValue> extends TagColumnBase<KB, ET, ET> {
	public var defaultValue:ET = null;
	public function new(name:String, field:FancyField<KB, ET>, et:Enum<ET>) {
		super(name, field, et);
		defaultValue = et.createByIndex(0);
		this.field = field;
		this.type = et;
	}
	override function getDefaultTag() {
		return defaultValue;
	}
	function getValue(kb:KB) {
		return field.access(kb) ?? defaultValue;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		TagLikeColumnTools.buildSingleValue(this, out, kb);
	}
	
	public var usedValues:Map<ET, Bool> = new Map();
	override public function showInFilters(val:ET):Bool {
		return usedValues.exists(val);
	}
	override public function buildFilter(out:Element):Void {
		for (item in table.values) {
			var val = getValue(item);
			if (val == null) continue;
			if (!usedValues.exists(val)) usedValues[val] = true;
		}
		super.buildFilter(out);
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
	
	override public function getVisibleTagNamesForLegends():Array<String> {
		var visible = new Map();
		var arr = [];
		for (row in table.rows) if (row.show) {
			var val = getValue(row.value);
			if (val == null) continue;
			if (!visible.exists(val)) {
				visible[val] = true;
				arr.push(tagToName(val));
			}
		}
		return arr;
	}
	
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var select = document.createSelectElement();
		var ctrs = [""].concat(Type.getEnumConstructs(type));
		for (ctr in ctrs) {
			var name:String;
			if (ctr != "") {
				var val:ET = Type.createEnum(type, ctr);
				name = filterLabels[val] ?? ctr;
			} else name = "";
			
			var option = document.createOptionElement();
			option.appendTextNode(name);
			option.value = ctr;
			
			select.appendChild(option);
		}
		store.push(function(kb) {
			var val = select.value;
			if (val != "") field.access(kb, true, type.createByName(val));
		});
		restore.push(function(kb) {
			var val = field.access(kb);
			if (val != null) {
				select.value = val.getName();
			} else select.value = "";
		});
		out.appendChild(select);
	}
	
	override public function save(kb:KB):Void {
		var val = field.access(kb);
		if (val != null) field.access(kb, true, cast val.getName());
	}
	override public function load(kb:KB):Void {
		var val = field.access(kb);
		if (val != null) field.access(kb, true, type.createByName(cast val));
	}
}
