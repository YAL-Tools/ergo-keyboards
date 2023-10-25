package table;
import externs.Tippy;
import externs.TippyOptions;
import js.html.DivElement;
import js.html.Element;
import js.html.URL;
import type.GetSetOn;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class LinkListColumn<KB:Keyboard> extends FancyColumn<KB> {
	public var access:GetSetOn<KB, ValList<String>>;
	public var defaultValue = "";
	public function new(name:String, access:GetSetOn<KB, ValList<String>>) {
		super(name);
		this.access = access;
	}
	override public function matchesFilter(kb:KB):Bool {
		var lines = access(kb);
		return lines != null && lines.length != 0;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var lines = access(kb);
		if (lines == null || lines.length == 0) {
			// OK!
		} else if (lines.length == 1) {
			var link = document.createAnchorElement();
			link.appendTextNode("➜");
			link.href = lines[0];
			out.appendChild(link);
		} else {
			var list = document.createUListElement();
			lines.sort((a, b)->Math.random() < 0.5 ? -1 : 1);
			for (i => href in lines) {
				var item = document.createLIElement();
				var link = document.createAnchorElement();
				link.href = href;
				var url = new URL(href);
				link.appendTextNode(url.hostname);
				item.appendChild(link);
				list.appendChild(item);
			}
			var link = document.createAnchorElement();
			link.appendTextNode("➜");
			link.href = "javascript:void(0)";
			out.appendChild(link);
			
			var opts = new TippyOptions();
			opts.trigger = "click";
			opts.interactive = true;
			opts.appendTo = () -> out;
			opts.content = function(_) return list;
			Tippy.bind(link, opts);
		}
		out.title = [
			kb.name,
			name + " (" + (lines != null ? lines.length : 0) + ")"
		].join("\n");
	}
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var textarea = document.createTextAreaElement();
		textarea.placeholder = "one per line";
		out.appendChild(textarea);
		store.push(function(kb) {
			var text = textarea.value;
			if (StringTools.trim(text) == "") return;
			access(kb, true, text.split("\n"));
		});
		restore.push(function(kb) {
			var arr = access(kb);
			if (arr == null) {
				textarea.value = "";
			} else {
				textarea.value = arr.join("\n");
			}
		});
	}
	override public function save(kb:KB):Void {
		var arr = access(kb);
		if (arr != null && arr.length == 1) {
			arr = cast arr[0];
			access(kb, true, arr);
		}
	}
	override public function load(kb:KB):Void {
		var val = access(kb);
		if (val is String) access(kb, true, cast [val]);
	}
}