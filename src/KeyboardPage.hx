package ;

import externs.Tippy;
import externs.TippyOptions;
import js.Lib;
import ColStagTable;
import js.html.DetailsElement;
import js.html.Element;
import js.html.ImageElement;
import js.html.InputElement;
import table.FancyTableShuffler;
import table.*;
using tools.HtmlTools;
import js.Browser.*;
import type.Keyboard;
import type.NamedThing;

/**
 * ...
 * @author YellowAfterlife
 */
class KeyboardPage {
	public static var baseURL:String = "https://yal-tools.github.io/ergo-keyboards/";
	public static function main<T:NamedThing>(kbTable:FancyTable<T>){
		tools.HaxeBugs.ref();
		//
		var divFilters:Element = document.querySelectorAuto("#filter");
		kbTable.countElement = document.querySelectorAuto("#count");
		kbTable.buildFilters(divFilters);
		kbTable.buildTable(document.querySelectorAuto("#data"));
		FancyTableEditor.build(kbTable,
			document.querySelectorAuto("#editor"),
			document.querySelectorAuto("#editor-load"),
			document.querySelectorAuto("#editor-reset"),
			document.querySelectorAuto("#editor-build"),
			document.querySelectorAuto("#editor-test"),
			document.querySelectorAuto("#editor-output")
		);
		//
		var loc = document.location;
		if (loc.protocol != "file:") {
			kbTable.baseURL = loc.origin + loc.pathname;
		}
		
		//
		var btClearFilters:InputElement = document.querySelectorAuto("#clear-filters");
		btClearFilters.onclick = function() {
			FancyTableControls.clearFilters(kbTable, divFilters);
		}
		
		//
		var cbAutoUpdateURL:InputElement = document.querySelectorAuto("#auto-update-url");
		kbTable.canUpdateURL = cbAutoUpdateURL.checked;
		cbAutoUpdateURL.addEventListener("change", function(_) {
			kbTable.canUpdateURL = cbAutoUpdateURL.checked;
		});
		
		//
		var btShare:InputElement = document.querySelectorAuto("#copy-share-url");
		FancyTableControls.createShareButton(kbTable, btShare);
		
		//
		var shuffler = new FancyTableShuffler<T>("");
		if (location.hostname == "localhost") {
			var editorDetails:DetailsElement = document.querySelectorAuto("#editor-outer");
			editorDetails.open = true;
		} else {
			kbTable.sortBy(shuffler, false);
		}
		document.querySelectorAuto("#shuffle", InputElement).onclick = function() {
			if (kbTable.sortColHead != null) {
				kbTable.sortColHead.element.classList.remove("sort-column");
				kbTable.sortColHead.element.classList.remove("sort-ascending");
				kbTable.sortColHead = null;
			}
			kbTable.sortBy(shuffler, false);
			kbTable.updateURL();
		}
		//
		var showImg = false;
		var showImgCb:InputElement = document.querySelectorAuto("#show-images");
		showImgCb.onchange = function() {
			if (showImgCb.checked == showImg) return;
			showImg = showImgCb.checked;
			for (row in kbTable.rows) {
				var cell = row.cells[0];
				if (!showImg) {
					for (img in cell.element.querySelectorAllAutoArr("a.preview", ImageElement)) {
						img.remove();
					}
					for (img in cell.element.querySelectorAllAutoArr("br.preview", ImageElement)) {
						img.remove();
					}
					continue;
				}
				if (showImg) for (src in row.value.img) {
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
		//
		document.querySelectorAuto("#copy-md", InputElement).onclick = function() {
			var md = FancyTableToMD.run(kbTable);
			navigator.clipboard.writeText(md);
		}
		//
		kbTable.loadFilters(document.location.search);
		console.log("Hello!");
	}
}