package table.tag;

import js.lib.RegExp;
import js.html.Element;
import js.Browser.*;
using StringTools;
using tools.HtmlTools;
import externs.Tippy;
import externs.TippyOptions;

class StringTagColumnWithOther<T> extends StringTagColumn<T> {
	static var rxMidway = new RegExp("^(.+),\\s*\\!(.+)$");
	override function splitTags(str:String):Array<String> {
		if (str.startsWith("!")) return ["Other"];
		var mt = rxMidway.exec(str);
		if (mt != null) {
			var arr = super.splitTags(mt[1]);
			arr.push("Other");
			return arr;
		}
		return super.splitTags(str);
	}
	override function buildValue(out:Element, item:T) {
		var val = field.access(item);
		inline function addOther(text:String) {
			var label = out.appendElTextNode("span", "Other");
			label.setTippyTitle(text);
		}
		if (val != null && val.startsWith("!")) {
			var label = out.appendElTextNode("span", "Other");
		}
		super.buildValue(out, item);
	}
}