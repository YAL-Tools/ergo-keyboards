package table;
import externs.Tippy;
import externs.TippyOptions;
import haxe.DynamicAccess;
import js.html.AnchorElement;
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
class LinkListColumn<KB> extends FancyColumn<KB> {
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
	public static function createFlagInner(code:String, title:String) {
		return '<img'
			+ ' src="flags/$code.png"'
			+ ' width="16"'
			+ (title != null ? ' title="' + StringTools.htmlEscape(title, true) + '"' : '')
			+ ' class="flag"'
		+ '/>';
	}
	public static function createFlag(origin:String) {
		var html = countryTags[origin.toUpperCase()];
		if (html == null) {
			var code = origin.toLowerCase();
			return createFlagInner(code, 'Unknown origin "$origin"');
		}
		html = (cast html).replace(rxFlag, function(_, code, title) {
			return createFlagInner(code, title);
		});
		return html;
	}
	function buildPopup(lines:Array<String>, kb:KB) {
		var rows:Array<LinkListRow> = [];
		var usesVariants = false;
		for (i => href in lines) {
			var _href = href;
			var official = href.startsWith("!");
			if (official) href = href.substr(1).ltrim();
			
			var origins = [];
			var vendor:String = null;
			var variant:String = null;
			var alt:String = null;
			for (_ in 0 ... 16) {
				if (!href.startsWith("[")) break;
				var pos = href.indexOf("]");
				if (pos < 0) break;
				var text = href.substring(1, pos);
				href = href.substring(pos + 1).ltrim();
				pos = text.indexOf(":");
				var tag = "";
				if (pos >= 0) {
					tag = text.substring(0, pos);
					text = text.substring(pos + 1);
				}
				switch (tag) {
					case "n", "name": vendor = text;
					case "v", "var", "variant": variant = text; usesVariants = true;
					case "a", "alt": alt = text;
					case "": origins.push(text);
					default: {
						var name = (cast kb).name;
						console.error('Unknown tag "$tag" in "$_href" in "$name"');
					};
				}
			}
			
			{
				var pos = href.indexOf("@");
				if (pos >= 0) {
					alt = href.substring(pos + 1).trim();
					href = href.substring(0, pos).trim();
				}
			}
			
			var url = new URL(href);
			var domain = url.hostname;
			if (domain.startsWith("www.")) domain = domain.substr(4);
			if (domain.startsWith("new.")) domain = domain.substr(4);
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
			
			if (vendor == null) vendor = domain;
			
			var row = rows.filter(row -> row.label == vendor && row.official == official)[0];
			if (row == null) {
				row = new LinkListRow(vendor);
				row.official = official;
				row.origins = origins;
				rows.push(row);
			} else usesVariants = true;
			
			var rowItem = new LinkListRowItem();
			rowItem.url = href;
			rowItem.alt = alt;
			rowItem.label = variant;
			row.items.push(rowItem);
		}
		rows.sort(function(a, b) {
			if (a.official != b.official) {
				return a.official ? -1 : 1;
			}
			return Math.random() < 0.5 ? -1 : 1;
		});
		
		var table = document.createTableElement();
		table.classList.add("links");
		var sep = String.fromCharCode(8201);
		for (row in rows) {
			var tableRow = table.appendElTextNode("tr", "");
			
			var flagCell = tableRow.appendElTextNode("td");
			flagCell.classList.add("flags");
			if (row.official) {
				flagCell.insertAdjacentHTML("beforeend", createFlagInner('star', "Official") + sep);
			}
			for (origin in row.origins) {
				flagCell.insertAdjacentHTML("beforeend", createFlag(origin) + sep);
			}
			
			var multi = row.items.length > 1;
			var cell = tableRow.appendElTextNode("td");
			if (usesVariants) {
				cell.appendTextNode(row.label);
				cell = tableRow.appendElTextNode("td");
				cell.classList.add("variants");
			}
			for (i => rowItem in row.items) {
				if (multi) {
					if (i > 0) cell.appendTextNode("," + sep);
				} else {
					//if (rowItem.label != null) {
					//	item.appendTextNode(rowItem.label + sep);
					//}
				}
				
				var link = document.createAnchorElement();
				link.href = rowItem.url;
				if (multi) {
					link.appendTextNode(rowItem.label ?? ("link" + sep + (1 + i)));
				} else if (usesVariants) {
					link.appendTextNode(rowItem.label ?? "open");
				} else {
					link.appendTextNode(row.label);
				}
				cell.appendChild(link);
				
				if (rowItem.alt != null) {
					var atLink = document.createAnchorElement();
					atLink.href = rowItem.alt;
					atLink.appendTextNode("alt");
					var atSup = document.createElement("span");
					atSup.appendTextNode(sep + "(");
					atSup.appendChild(atLink);
					atSup.appendTextNode(")");
					cell.appendChild(atSup);
				}
			}
			table.appendChild(tableRow);
		}
		return table;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		var lines = field.access(kb);
		var link:AnchorElement = null;
		if (lines == null || lines.length == 0) {
			// OK!
		} else if (lines.length == 1 && canShowSingle && !lines[0].startsWith("[")) {
			link = document.createAnchorElement();
			link.appendTextNode("➜");
			link.href = lines[0];
			out.appendChild(link);
		} else {
			link = document.createAnchorElement();
			link.appendTextNode("➜");
			link.href = "javascript:void(0)";
			out.appendChild(link);
			
			var opts = new TippyOptions();
			opts.maxWidth = 480;
			opts.trigger = "click";
			opts.interactive = true;
			opts.appendTo = () -> out;
			opts.setLazyContent(function() return buildPopup(lines, kb));
			Tippy.bind(link, opts);
		}
		//out.appendTextNode(lines != null ? "" + lines.length : "");
		(link ?? out).title = [
			(cast kb).name,
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
class LinkListRow {
	public var official = false;
	public var items:Array<LinkListRowItem> = [];
	public var label:String;
	public var origins:Array<String> = [];
	public function new(label:String) {
		this.label = label;
	}
}
class LinkListRowItem {
	public var label:String = null;
	public var url:String = null;
	public var alt:String = null;
	public function new() {
		
	}
}