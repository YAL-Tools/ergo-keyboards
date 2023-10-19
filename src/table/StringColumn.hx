package table;
import externs.Tippy;
import externs.TippyOptions;
import js.html.DivElement;
import js.html.Element;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class StringColumn<KB:Keyboard> extends FancyColumn<KB> {
	public var getter:KB->String;
	public function new(name:String, getter:KB->String) {
		super(name);
		this.getter = getter;
		canFilter = false;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		out.appendTextNode(getter(kb));
	}
}
