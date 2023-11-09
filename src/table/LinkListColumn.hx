package table;
import externs.Tippy;
import externs.TippyOptions;
import haxe.DynamicAccess;
import js.html.DivElement;
import js.html.Element;
import js.html.URL;
import js.lib.RegExp;
import type.GetSetOn;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;
using StringTools;

/**
 * ...
 * @author YellowAfterlife
 */
class LinkListColumn<KB:Keyboard> extends FancyColumn<KB> {
	public static var domainCountries:DynamicAccess<String> = new DynamicAccess();
	public static var countryTags:DynamicAccess<String> = new DynamicAccess();
	public var canShowSingle = false;
	public var field:FancyField<KB, ValList<String>>;
	override public function getId():String {
		return field.name;
	}
	
	public var defaultValue = "";
	public function new(name:String, field:FancyField<KB, ValList<String>>) {
		super(name);
		this.field = field;
	}
	override public function matchesFilter(kb:KB):Bool {
		var lines = field.access(kb);
		return lines != null && lines.length != 0;
	}
	static var rxFlag = new RegExp("\\[flag:\\s*(\\w+)(?:\\|(.+?))\\]", "g");
	static var rxAt = new RegExp("(.+?)\\s*@\\s*(https?://.+)");
	public static function createFlag(origin:String) {
		var html = countryTags[origin.toUpperCase()];
		if (html == null) {
			var code = origin.toLowerCase();
			var bit = '<img src="flags/$code.png"';
			var title = 'Unknown origin "$origin"';
			if (title != null) bit += ' title="' + StringTools.htmlEscape(title, true) + '"';
			return bit + ' class="flag" />';
		}
		html = (cast html).replace(rxFlag, function(_, code, title) {
			var bit = '<img src="flags/$code.png"';
			if (title != null) bit += ' title="$title"';
			return bit + ' class="flag" />';
		});
		return html;
	}
	function buildPopup(lines:Array<String>) {
		var list = document.createUListElement();
		lines.sort(function(a, b) {
			if (StringTools.startsWith(a, "!")) return -1;
			if (StringTools.startsWith(b, "!")) return 1;
			return Math.random() < 0.5 ? -1 : 1;
		});
		for (i => href in lines) {
			var item = document.createLIElement();
			var link = document.createAnchorElement();
			var official = href.startsWith("!");
			if (official) href = href.substr(1).ltrim();
			
			var origins = [];
			for (_ in 0 ... 16) {
				if (!href.startsWith("[")) break;
				var pos = href.indexOf("]");
				if (pos < 0) break;
				if (href.charAt(pos + 1) == "(") break;
				origins.push(href.substring(1, pos));
				href = href.substring(pos + 1);
			}
			
			var url = new URL(href);
			var domain = url.hostname;
			if (domain.startsWith("www.")) domain = domain.substr(4);
			if (origins.length == 0) {
				var origin = domainCountries[domain];
				if (origin == null) {
					var parts = domain.split(".");
					if (parts.length >= 3) origin = domainCountries[parts.slice(1).join(".")];
				}
				if (origin == null) {
					var pos = domain.lastIndexOf(".");
					if (pos >= 0) {
						origin = domain.substring(pos + 1).toUpperCase();
						if (countryTags[origin] == null) origin = null;
					}
				}
				if (origin != null) origins.push(origin);
			}
			
			if (official) {
				item.innerHTML += '<img src="flags/star.png" title="Official" class="flag" >&#8201;';
			}
			for (origin in origins) {
				var html = createFlag(origin);
				item.innerHTML += html + "&#8201;";
			}
			link.href = href;
			link.appendTextNode(domain);
			item.appendChild(link);
			list.appendChild(item);
		}
		return list;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var lines = field.access(kb);
		if (lines == null || lines.length == 0) {
			// OK!
		} else if (lines.length == 1 && canShowSingle) {
			var link = document.createAnchorElement();
			link.appendTextNode("➜");
			link.href = lines[0];
			out.appendChild(link);
		} else {
			var link = document.createAnchorElement();
			link.appendTextNode("➜");
			link.href = "javascript:void(0)";
			out.appendChild(link);
			
			var opts = new TippyOptions();
			opts.trigger = "click";
			opts.interactive = true;
			opts.appendTo = () -> out;
			opts.setLazyContent(function() return buildPopup(lines));
			Tippy.bind(link, opts);
		}
		out.title = [
			kb.name,
			name + " (" + (lines != null ? lines.length : 0) + ")"
		].join("\n");
	}
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var textarea = document.createTextAreaElement();
		textarea.placeholder = [
			"One URL per line"
		].join("\n");
		out.appendChild(textarea);
		store.push(function(kb) {
			var text = textarea.value;
			if (StringTools.trim(text) == "") return;
			field.access(kb, true, text.split("\n"));
		});
		restore.push(function(kb) {
			var arr = field.access(kb);
			if (arr == null) {
				textarea.value = "";
			} else {
				textarea.value = arr.join("\n");
			}
		});
	}
	override public function save(kb:KB):Void {
		var arr = field.access(kb);
		if (arr != null && arr.length == 1) {
			arr = cast arr[0];
			field.access(kb, true, arr);
		}
	}
	override public function load(kb:KB):Void {
		var val = field.access(kb);
		if (val is String) field.access(kb, true, cast [val]);
	}
	override public function saveFilterParams(obj:DynamicAccess<String>):Void {
		if (filterCheckbox.checked) {
			obj[field.name] = "";
		}
	}
	override public function loadFilterParams(obj:DynamicAccess<String>):Bool {
		return obj[field.name] != null;
	}
}