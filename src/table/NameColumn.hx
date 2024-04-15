package table;
import externs.Tippy;
import externs.TippyOptions;
import js.html.DivElement;
import js.html.Element;
import js.html.ImageElement;
import js.html.SelectElement;
import js.lib.RegExp;
import table.StringColumn;
import type.GetSetOn;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
using tools.HtmlTools;


/**
 * ...
 * @author YellowAfterlife
 */
class NameColumn<KB:Keyboard> extends StringColumn<KB> {
	public function new(name:String, field:FancyField<KB, String>) {
		super(name, field);
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
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		super.buildEditor(out, store, restore);
		editorField.placeholder = "Cool Keyboard";
		out.appendLineBreak();
		
		{
			var textarea = document.createTextAreaElement();
			textarea.style.marginTop = "0.25em";
			textarea.placeholder = "One image URL per line";
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
