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
	override function buildValue(out:Element, item:T) {
		var tags = getValue(item);
		if (tags == null) {
			out.appendTextNode(nullCaption);
			return;
		}
		if (tags.contains(HotSwap.Yes)) {
			if (tags.contains(HotSwap.No)) {
				out.appendTextNode(String.fromCharCode(177)); // +-
			} else out.appendTextNode("+");
		} else if (tags.contains(HotSwap.No)) {
			out.appendTextNode("-");
		}
		if (tags.contains(HotSwap.Special)) out.appendTextNode("*");
		out.title = TagLikeListColumnTools.getValueTip(this, item);
	}
}