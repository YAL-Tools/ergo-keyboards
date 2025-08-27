package table.tag;
import table.tag.TagLikeColumnBase;
import js.html.Element;
import js.Browser.*;
using tools.HtmlTools;

class TagLikeListColumnTools {
	
	public static function matchesFilter<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>, item:T
	) {
		var filterTags = column.filterTags;
		if (filterTags.length == 0) return true;
		var vals = column.field.access(item) ?? column.defaultValue ?? [];
		switch (column.filterMode) {
			case AnyOf:
				for (val in filterTags) {
					if (column.tagsContain(vals, val)) return true;
				}
				return false;
			case AllOf:
				for (val in filterTags) {
					if (!column.tagsContain(vals, val)) return false;
				}
				return true;
			case NoneOf:
				for (val in filterTags) {
					if (column.tagsContain(vals, val)) return false;
				}
				return true;
		}
	}
	
	public static function getValueTip<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>, item:T, header = true
	) {
		var tags = column.getValue(item);
		var lines = [column.name + ":"];
		// really need to require items to have a name sometime
		if (header) {
			var itemName = (cast item).name;
			if (itemName != null) lines.unshift(itemName);
		}
		for (tag in tags) {
			lines.push(tools.Symbols.listDot + " " + column.getFilterLabel(tag));
		}
		return lines.join("\n");
	}
	public static function buildValue<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>, out:Element, item:T
	) {
		var tags = column.getValue(item);
		if (tags == null) {
			out.appendTextNode(column.nullCaption);
			return;
		}
		for (i => tag in tags) {
			if (i > 0) out.appendTextNode(", ");
			var span = out.appendElTextNode("span", column.getShortLabel(tag));
			var notes = column.getShortNotes(item, tag);
			if (notes != null) {
				FancyTableFilters.addNotesFor(function(ne) {
					ne.appendTextNode(notes);
				}, span, false);
			}
		}
		out.setTippyTitle(getValueTip(column, item));
	}
	
	public static function buildUsedValues<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>,
		usedValues:Map<ET, Bool>
	) {
		for (item in column.table.values) {
			var vals = column.getValue(item);
			if (vals == null) continue;
			for (val in vals) {
				if (usedValues.exists(val)) continue;
				usedValues[val] = true;
			}
		}
	}
	
	public static function getVisibleTagNamesForLegends<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>
	) {
		var visible = [];
		var arr = [];
		for (row in column.table.rows) if (row.show) {
			var vals = column.getValue(row.value);
			if (vals == null) continue;
			for (val in vals) if (!visible.contains(val)) {
				visible.push(val);
				arr.push(column.tagToName(val));
			}
		}
		return arr;
	}
	
	public static function save<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>, item:T
	) {
		var arr = column.field.access(item);
		if (arr == null) return;
		var names = arr.map(val -> column.tagToName(val));
		if (names.length == 1) names = cast names[0];
		column.field.access(item, true, cast names);
	}
	
	public static function load<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>, item:T
	) {
		var names:Array<String> = cast column.field.access(item);
		if (names == null) return;
		// "one" -> ["one"]
		if (!(names is Array)) names = cast [names];
		var tags = [];
		for (name in names) {
			if (name is Bool) {
				name = cast ((cast name:Bool) ? "Yes" : "No");
			}
			tags.push(column.nameToTag(name));
		}
		column.field.access(item, true, tags);
	}
	
	public static function buildEditor<T, ET>(
		column:TagLikeColumnBase<T, ET, Array<ET>>,
		out:Element,
		store:Array<T->Void>,
		restore:Array<T->Void>
	) {
		var optCtr = out.appendElTextNode("div");
		optCtr.classList.add("tag-options");
		optCtr.setAttribute("column-count", "" + column.columnCount);
		for (ctr in column.getTagNames()) {
			var val:ET = column.nameToTag(ctr);
			if (!column.showInEditor(val)) continue;
			var name = column.getFilterLabel(val);
			
			var cb = document.createCheckboxElement();
			store.push(function(kb) {
				if (!cb.checked) return;
				var arr = column.field.access(kb);
				if (arr == null) {
					arr = [];
					column.field.access(kb, true, arr);
				}
				arr.push(val);
			});
			restore.push(function(kb) {
				var arr = column.field.access(kb);
				cb.checked = arr != null && arr.contains(val);
			});
			var label = document.createLabelElement();
			var row = document.createDivElement();
			label.appendChild(cb);
			label.appendTextNode(name);
			row.appendChild(label);
			optCtr.appendChild(row);
		}
	}
}