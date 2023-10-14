package table;
import externs.Tippy;
import externs.TippyOptions;
import js.html.DivElement;
import js.html.Element;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableLinkListColumn<KB:Keyboard> extends FancyTableColumn<KB> {
	public var getter:KB->ValList<String>;
	public var defaultValue = "";
	public function new(name:String, getter:KB->ValList<String>) {
		super(name);
		this.getter = getter;
	}
	override public function matchesFilter(kb:KB):Bool {
		var lines = getter(kb);
		return lines != null && lines.length != 0;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var lines = getter(kb);
		if (lines == null || lines.length == 0) {
			// OK!
		} else if (lines.length == 1) {
			var link = document.createAnchorElement();
			link.appendTextNode("➜");
			link.href = lines[0];
			out.appendChild(link);
		} else {
			for (i => lines in lines) {
				
			}
		}
	}
}