package table;
import type.Keyboard;
import type.*;
import js.html.Element;
using tools.HtmlTools;
import js.Browser.document;

/**
 * ...
 * @author YellowAfterlife
 */
class TagListColumn<KB:Keyboard, ET:EnumValue> extends TagColumnBase<KB, ET, ValList<ET>> {
	public var defaultValue:ValList<ET> = null;
	public var onBuildValue:(out:Element, vals:ValList<ET>, kb:KB)->Bool;
	public function new(name:String, field:FancyField<KB, ValList<ET>>, et:Enum<ET>) {
		super(name, field, et);
		defaultValue = et.createByIndex(0);
		this.field = field;
		this.type = et;
	}
	function getValue(kb:KB) {
		return field.access(kb) ?? defaultValue;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var vals = getValue(kb);
		if (vals != null) {
			var tip = [
				kb.name,// + " ➜ " +
				name + ":",
			];
			var addElements = true;
			if (onBuildValue != null && onBuildValue(out, vals, kb)) {
				addElements = false;
			}
			for (i => val in vals) {
				if (i > 0 && addElements) out.appendTextNode(", ");
				var name = val.getName();
				if (addElements) {
					out.appendTextNode(shortLabels[val] ?? name);
				}
				tip.push("· " + (filterLabels[val] ?? name));
			}
			out.title = tip.join("\n");
		} else {
			out.appendTextNode(nullCaption);
		}
	}
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		for (ctr in Type.getEnumConstructs(type)) {
			var val:ET = Type.createEnum(type, ctr);
			var name = filterLabels[val] ?? ctr;
			
			var cb = document.createCheckboxElement();
			store.push(function(kb) {
				if (!cb.checked) return;
				var arr = field.access(kb);
				if (arr == null) {
					arr = [];
					field.access(kb, true, arr);
				}
				arr.push(val);
			});
			restore.push(function(kb) {
				var arr = field.access(kb);
				cb.checked = arr != null && arr.contains(val);
			});
			var label = document.createLabelElement();
			var row = document.createDivElement();
			label.appendChild(cb);
			label.appendTextNode(name);
			row.appendChild(label);
			out.appendChild(row);
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
	override public function save(kb:KB):Void {
		var arr = field.access(kb);
		if (arr != null) {
			var names = arr.map(e -> e.getName());
			if (names.length == 1) {
				names = cast names[0];
			}
			field.access(kb, true, cast names);
		}
	}
	override public function load(kb:KB):Void {
		var names = field.access(kb);
		if (names != null) {
			if (names is String) names = cast [names];
			var arr = names.map(e -> type.createByName(cast e));
			field.access(kb, true, arr);
		}
	}
}