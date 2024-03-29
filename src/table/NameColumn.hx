package table;
import externs.Tippy;
import externs.TippyOptions;
import js.html.DivElement;
import js.html.Element;
import js.html.ImageElement;
import js.lib.RegExp;
import type.GetSetOn;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
using tools.HtmlTools;


/**
 * ...
 * @author YellowAfterlife
 */
class NameColumn<KB:Keyboard> extends FancyColumn<KB> {
	public var field:FancyField<KB, String>;
	public function new(name:String, field:FancyField<KB, String>) {
		super(name);
		this.field = field;
		canFilter = false;
		canSort = true;
	}
	override public function matchesFilter(kb:KB):Bool {
		return true;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		if (kb.img != null || kb.notes != null) {
			var srcs:Array<String>;
			if (kb.img != null) {
				var rxLink = new RegExp("^https?://", "");
				srcs = kb.img.map(function(s) {
					if (rxLink.test(s)) {
						return s;
					} else return "img/" + s;
				});
			} else srcs = null;
			
			var link = document.createAnchorElement();
			link.appendTextNode(field.access(kb));
			link.href = srcs != null ? srcs[0] : null;
			link.onclick = function() {
				return false;
			}
			out.appendChild(link);
			
			var opts = new TippyOptions();
			opts.trigger = "click";
			opts.interactive = true;
			opts.maxWidth = 640;
			opts.setLazyContent(function() {
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
			});
			Tippy.bind(link, opts);
		} else {
			out.appendTextNode(field.access(kb));
		}
	}
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		var an = field.access(a).toUpperCase();
		var bn = field.access(b).toUpperCase();
		var sign = an == bn ? 0 : (an < bn ? -1 : 1);
		if (ascending) sign = -sign;
		return sign;
	}
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var fd = document.createInputElement();
		fd.type = "text";
		store.push(function(kb) {
			kb.name = fd.value;
		});
		restore.push(function(kb) {
			fd.value = kb.name;
		});
		fd.placeholder = "Cool Keyboard";
		out.appendChild(fd);
		out.appendLineBreak();
		
		{
			var textarea = document.createTextAreaElement();
			textarea.style.marginTop = "0.25em";
			textarea.placeholder = "one image URL per line";
			out.appendChild(textarea);
			store.push(function(kb) {
				var text = textarea.value;
				if (StringTools.trim(text) == "") return;
				kb.img = text.split("\n");
			});
			restore.push(function(kb) {
				var arr = kb.img;
				if (arr == null) {
					textarea.value = "";
				} else {
					textarea.value = arr.join("\n");
				}
			});
		}
		
		{
			var notes = document.createTextAreaElement();
			notes.style.marginTop = "0.25em";
			notes.placeholder = "One paragraph of notes per line";
			out.appendChild(notes);
			store.push(function(kb) {
				var text = notes.value;
				if (StringTools.trim(text) == "") return;
				kb.notes = text.split("\n");
			});
			restore.push(function(kb) {
				var arr = kb.notes;
				if (arr == null) {
					notes.value = "";
				} else {
					notes.value = arr.join("\n");
				}
			});
		}
	}
	override public function save(kb:KB):Void {
		var arr:Array<String> = kb.img;
		if (arr != null && arr.length == 1) {
			arr = cast arr[0];
			kb.img = arr;
		}
		
		arr = kb.notes;
		if (arr != null && arr.length == 1) {
			arr = cast arr[0];
			kb.notes = arr;
		}
	}
	override public function load(kb:KB):Void {
		if (kb.img is String) kb.img = cast [kb.img];
		if (kb.notes is String) kb.notes = cast [kb.notes];
	}
}
