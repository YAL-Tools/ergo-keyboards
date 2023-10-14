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
class FancyTableNameColumn<KB:Keyboard> extends FancyTableColumn<KB> {
	public var getter:KB->String;
	public function new(name:String, getter:KB->String) {
		super(name);
		this.getter = getter;
		canFilter = false;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		if (kb.img != null) {
			var src = "img/" + kb.img;
			var link = document.createAnchorElement();
			link.appendTextNode(getter(kb));
			link.href = src;
			link.onclick = function() {
				return false;
			}
			out.appendChild(link);
			
			var opts = new TippyOptions();
			opts.trigger = "click";
			opts.interactive = true;
			opts.maxWidth = 640;
			opts.content = function(_) {
				var img = document.createImageElement();
				img.src = src;
				img.className = "tippy-photo";
				return img;
			}
			Tippy.bind(link, opts);
		} else {
			out.appendTextNode(getter(kb));
		}
	}
}
