package ;
import js.Browser;
import js.html.Element;
import js.lib.RegExp;
using tools.HtmlTools;
using StringTools;

/**
 * ...
 * @author YellowAfterlife
 */
class ToDoList {
	public static var element:Element;
	public static function set(text:String) {
		text = StringTools.trim(text);
		var rxAfterText = new RegExp("^(.+?)\\s*(https?://.*)");
		var rxURL = new RegExp("^(https?://\\S+)\\s*(.*)");
		var rxLinkSuffix = new RegExp("^.+/(.+?)(?:/)?(?:\\?.*)?$");
		var rxEraseEnd = new RegExp("^(.+)[-_](?:keyboard|kbd|kit|pcb)$", "i");
		element.innerHTML = "";
		for (line in text.split("\n")) {
			line = line.trim();
			if (line == "") continue;
			
			var mt = rxURL.exec(line);
			var label:String = null;
			if (mt == null) { // hopefully "label http://" 
				mt = rxAfterText.exec(line);
				if (mt == null) {
					label = line;
				} else {
					label = mt[1];
					line = mt[2];
					mt = rxURL.exec(line);
				}
			} else { // starts with a link
				var smt = rxLinkSuffix.exec(mt[1]);
				if (smt == null) continue;
				label = smt[1];
				for (i in 0 ... 16) {
					smt = rxEraseEnd.exec(label);
					if (smt == null) break;
					label = smt[1];
				}
			}
			var li = Browser.document.createLIElement();
			if (mt != null) {
				var a = Browser.document.createAnchorElement();
				a.appendTextNode(label);
				a.href = mt[1];
				li.appendChild(a);
				
				line = mt[2];
				for (i in 2 ... 16) {
					mt = rxURL.exec(line);
					if (mt == null) break;
					a = Browser.document.createAnchorElement();
					a.href = mt[1];
					line = mt[2];
					li.appendTextNode(" · ");
					a.appendTextNode("link " + i);
					li.appendChild(a);
				}
			} else {
				li.appendTextNode(label);
			}
			element.appendChild(li);
		}
	}
}