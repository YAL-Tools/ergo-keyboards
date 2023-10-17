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
		canSort = true;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		if (kb.img != null || kb.notes != null) {
			var src = kb.img != null ? "img/" + kb.img : null;
			
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
				var div = document.createDivElement();
				if (src != null) {
					var img = document.createImageElement();
					img.src = src;
					img.className = "tippy-photo";
					div.appendChild(img);
				}
				if (kb.notes != null) for (note in kb.notes) {
					div.appendParaTextNode(note);
				}
				return div;
			}
			Tippy.bind(link, opts);
		} else {
			out.appendTextNode(getter(kb));
		}
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var an = getter(a).toUpperCase();
		var bn = getter(b).toUpperCase();
		var sign = an == bn ? 0 : (an < bn ? -1 : 1);
		if (ascending) sign = -sign;
		return sign;
	}
}
