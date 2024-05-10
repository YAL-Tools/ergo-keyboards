package table.tag;
import js.html.Element;
using StringTools;

/**
 * ...
 * @author YellowAfterlife
 */
class StringTagColumn<T> extends StringTagColumnBase<T, String> {
	public function new(name:String, field:FancyField<T, String>, tags:Array<String>) {
		super(name, field, tags);
	}
	
	override public function matchesFilter(item:T):Bool {
		if (filterTags.length == 0) return true;
		var val = getValue(item);
		switch (filterMode) {
			case AnyOf: return filterTags.contains(val);
			case NoneOf: return !filterTags.contains(val);
			default: return true;
		}
	}
	
	function splitTags(str:String) {
		var vals;
		if (separator != null) {
			vals = str.split(separator);
			vals = vals.map(s -> s.trim());
		} else vals = [str];
		return vals;
	}
	override function buildFilter(out:Element) {
		if (tags == null) {
			tags = [];
			var found = new Map();
			for (item in table.values) {
				var str = field.access(item);
				if (str == null) continue;
				var vals = splitTags(str);
				for (val in vals) {
					var vlq = val.toLowerCase();
					if (found.exists(vlq)) continue;
					found[vlq] = true;
					tags.push(val);
				}
			}
		}
		super.buildFilter(out);
	}
	
	override public function buildValue(out:Element, item:T):Void {
		TagLikeColumnTools.buildSingleValue(this, out, item);
	}
}