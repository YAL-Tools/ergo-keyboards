package table;
import externs.Tippy;
import externs.TippyOptions;
import js.html.DivElement;
import js.html.Element;
import type.GetSetOn;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
using tools.HtmlTools;


/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableNameColumn<KB:Keyboard> extends FancyTableColumn<KB> {
	public var access:GetSetOn<KB, String>;
	public function new(name:String, access:GetSetOn<KB, String>) {
		super(name);
		this.access = access;
		canFilter = false;
		canSort = true;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		if (kb.img != null || kb.notes != null) {
			var srcs = kb.img != null ? kb.img.map(s -> "img/" + s) : null;
			
			var link = document.createAnchorElement();
			link.appendTextNode(access(kb));
			link.href = srcs != null ? srcs[0] : null;
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
				if (srcs != null) for (src in srcs) {
					var img = document.createImageElement();
					img.src = src;
					var p = document.createParagraphElement();
					p.classList.add("img");
					p.appendChild(img);
					div.appendChild(p);
				}
				if (kb.notes != null) for (note in kb.notes) {
					div.appendParaTextNode(note);
				}
				return div;
			}
			Tippy.bind(link, opts);
		} else {
			out.appendTextNode(access(kb));
		}
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var an = access(a).toUpperCase();
		var bn = access(b).toUpperCase();
		var sign = an == bn ? 0 : (an < bn ? -1 : 1);
		if (ascending) sign = -sign;
		return sign;
	}
	override public function buildEditor(out:Element, get:Void->KB):Void {
		
	}
}
