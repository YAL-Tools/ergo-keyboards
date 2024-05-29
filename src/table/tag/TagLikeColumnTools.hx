package table.tag;
import js.html.Element;
import table.tag.TagColumnBase;
import type.ValList;
import table.tag.TagLikeColumnBase;
import js.Browser.*;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class TagLikeColumnTools {
	static function getName(val:Any):String {
		if (val is Array) {
			return (val:Array<Any>)[0];
		} else {
			return (cast val).name;
		}
	}
	public static function buildSingleValue<T, ET>(
		self:TagLikeColumnBase<T, ET, ET>, out:Element, item:T
	):Void {
		var val:ET = self.getValue(item);
		if (val != null) {
			var name = self.tagToName(val);
			out.appendElTextNode("span", self.getShortLabel(val));
			out.title = [
				getName(item),
				self.name + ":",
				self.getFilterLabel(val),
			].join("\n");
		} else {
			out.appendElTextNode("span", self.nullCaption);
		}
	}
	
	public static function buildUsedValues<T, ET>(
		column:TagLikeColumnBase<T, ET, ET>,
		usedValues:Map<ET, Bool>
	) {
		for (item in column.table.values) {
			var val = column.getValue(item);
			if (val == null) continue;
			if (!usedValues.exists(val)) usedValues[val] = true;
		}
	}
	
	public static function matchesFilters<T, ET>(
		column:TagLikeColumnBase<T, ET, ET>, item:T
	) {
		if (column.filterTags.length == 0) return true;
		var val = column.getValue(item);
		switch (column.filterMode) {
			case AnyOf: return column.tagsContain(column.filterTags, val);
			case NoneOf: return !column.tagsContain(column.filterTags, val);
			default: return true;
		}
	}
	
	public static function buildEditor<T, ET>(
		column:TagLikeColumnBase<T, ET, ET>, out:Element,
		store:Array<T->Void>, restore:Array<T->Void>
	) {
		var select = document.createSelectElement();
		// "" is here for "default" selection
		var ctrs = [""].concat(column.getTagNames());
		select.size = ctrs.length;
		for (ctr in ctrs) {
			var name:String;
			if (ctr != "") {
				var val:ET = column.nameToTag(ctr);
				name = column.getFilterLabel(val);
			} else name = "";
			
			var option = document.createOptionElement();
			option.appendTextNode(name);
			option.value = ctr;
			
			select.appendChild(option);
		}
		store.push(function(kb) {
			var name = select.value;
			if (name != "") {
				column.field.access(kb, true, column.nameToTag(name));
			}
		});
		restore.push(function(kb) {
			var tag = column.field.access(kb);
			if (tag != null) {
				select.value = column.tagToName(tag);
			} else select.value = "";
		});
		out.appendChild(select);
	}
	
	public static function save<T, ET>(
		column:TagLikeColumnBase<T, ET, ET>, item:T
	) {
		var val = column.field.access(item);
		if (val == null) return;
		column.field.access(item, true, cast column.tagToName(val));
	}
	
	public static function load<T, ET>(
		column:TagLikeColumnBase<T, ET, ET>, item:T
	) {
		var val = column.field.access(item);
		if (val == null) return;
		column.field.access(item, true, column.nameToTag(cast val));
	}
	
	public static function getVisibleTagNamesForLegends<T, ET>(
		column:TagLikeColumnBase<T, ET, ET>
	) {
		var visible = [];
		var arr = [];
		for (row in column.table.rows) if (row.show) {
			var val = column.getValue(row.value);
			if (val == null) continue;
			if (!visible.contains(val)) {
				visible.push(val);
				arr.push(column.tagToName(val));
			}
		}
		return arr;
	}
}