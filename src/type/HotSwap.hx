package type;

import table.tag.TagLikeListColumnTools;
import js.html.Element;
import table.tag.TagListColumn;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
enum HotSwap {
	Unspecified;
	No;
	Yes;
	Special;
}
class HotSwapColumn<T> extends TagListColumn<T, HotSwap> {
	public function getShortValue(item:T) {
		var tags = getValue(item);
		if (tags == null) return null;
		
		var out = "";
		if (tags.contains(HotSwap.Yes)) {
			if (tags.contains(HotSwap.No)) {
				out = String.fromCharCode(177); // +-
			} else out = "+";
		} else if (tags.contains(HotSwap.No)) {
			out = "-";
		}
		if (tags.contains(HotSwap.Special)) out += "*";
		return out;
	}
	override function buildValue(out:Element, item:T) {
		var short = getShortValue(item);
		if (short == null) {
			out.appendTextNode(nullCaption);
			return;
		}
		out.appendTextNode(short);
		out.setTippyTitle(TagLikeListColumnTools.getValueTip(this, item));
	}
}