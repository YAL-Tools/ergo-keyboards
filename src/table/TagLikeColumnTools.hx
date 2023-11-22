package table;
import js.html.Element;
import table.TagColumnBase;
import type.ValList;
import table.TagLikeColumnBase;
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
	static function getValue<T, ET:TagLikeColumnBaseTC, FT>(self:TagLikeColumnBase<T, ET, FT>, item:T):ET {
		return (cast self.field.access(item)) ?? self.getDefaultTag();
	}
	public static function buildSingleValue<T, ET:TagLikeColumnBaseTC, FT>(self:TagLikeColumnBase<T, ET, FT>, out:Element, item:T):Void {
		var val = getValue(self, item);
		if (val != null) {
			var name = self.tagToName(val);
			out.appendTextNode(self.getShortLabel(val) ?? name);
			out.title = [
				getName(item),
				self.name + ":",
				self.getFilterLabel(val) ?? name,
			].join("\n");
		} else {
			out.appendTextNode(self.nullCaption);
		}
	}
}