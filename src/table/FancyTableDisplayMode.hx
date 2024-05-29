package table;
import externs.Tippy;
import externs.TippyOptions;
import js.html.ImageElement;
import type.NamedThing;
using tools.HtmlTools;
import js.Browser.*;

class FancyTableDisplayMode {
	public static function set<T:NamedThing>(table:FancyTable<T>, flags:Int) {
		if (table.displayFlags == flags) return;
		var hadImages = table.displayFlags & 1 != 0;
		table.displayFlags = flags;
		var showImages = (flags & 1) != 0;
		//
		var gallery = (flags & 2) != 0;
		table.outElement.classList.setTokenFlag("gallery", gallery);
		//
		if (showImages == hadImages) return;
		
		for (row in table.rows) {
			var cell = row.cells[0];
			if (!showImages) {
				for (img in cell.element.querySelectorAllAutoArr("a.preview", ImageElement)) {
					img.remove();
				}
				for (img in cell.element.querySelectorAllAutoArr("br.preview", ImageElement)) {
					img.remove();
				}
				continue;
			}
			//
			for (src in row.value.img) {
				var small = "img-small/" + haxe.io.Path.withExtension(src, "webp");
				var img = document.createImageElement();
				img.src = small;
				img.classList.add("small");
				var a = document.createAnchorElement();
				a.href = "img/" + src;
				a.target = "_blank";
				a.classList.add("preview");
				a.appendChild(img);
				//
				var opts = new TippyOptions();
				opts.trigger = "click";
				opts.interactive = true;
				opts.maxWidth = 658;
				opts.placement = "top-start";
				opts.appendTo = () -> cell.element;
				opts.setLazyContent(function() {
					var div = document.createDivElement();
					var img = document.createImageElement();
					img.src = "img/" + src;
					var p = document.createParagraphElement();
					p.classList.add("img");
					p.appendChild(img);
					div.appendChild(p);
					return div;
				});
				a.onclick = () -> false;
				Tippy.bind(img, opts);
				//
				var br = document.createBRElement();
				br.classList.add("preview");
				cell.element.appendChild(br);
				//
				cell.element.appendChild(a);
			}
		}
	}
}