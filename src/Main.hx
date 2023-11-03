package;

import externs.Tippy;
import externs.TippyOptions;
import js.Lib;
import ColStagTable;
import js.html.DetailsElement;
import js.html.Element;
import js.html.InputElement;
import table.FancyTableShuffler;
import table.*;
using tools.HtmlTools;
import js.Browser.*;

/**
 * ...
 * @author YellowAfterlife
 */
class Main {
	public static var baseURL:String = "https://yal-tools.github.io/ergo-keyboards/";
	static function main() {
		//
		var t = new ColStagTable();
		t.countElement = document.querySelectorAuto("#count");
		t.buildFilters(document.querySelectorAuto("#filter"));
		t.buildTable(document.querySelectorAuto("#data"));
		table.FancyTableEditor.build(t,
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
			t.baseURL = loc.origin + loc.pathname;
		}
		//
		var cbAutoUpdateURL:InputElement = document.querySelectorAuto("#auto-update-url");
		t.canUpdateURL = cbAutoUpdateURL.checked;
		cbAutoUpdateURL.addEventListener("change", function(_) {
			t.canUpdateURL = cbAutoUpdateURL.checked;
		});
		//
		var btShare:InputElement = document.querySelectorAuto("#copy-share-url");
		var shareOpt = new TippyOptions();
		shareOpt.trigger = "manual";
		shareOpt.content = "Copied!";
		var shareTippy = Tippy.bind(btShare, shareOpt);
		var shareTippyHide:Int = 0;
		
		btShare.onclick = function() {
			var search = t.saveFilters();
			var url = t.baseURL + search;
			function fallback() {
				window.prompt("Failed to copy - here's your link:", url);
			}
			try {
				navigator.clipboard.writeText(url).catchError(function(e) {
					console.error("Failed to copy", e);
					fallback();
				}).then(function(_) {
					shareTippy.show();
					if (shareTippyHide != 0) {
						window.clearTimeout(shareTippyHide);
					}
					shareTippyHide = window.setTimeout(function() {
						shareTippyHide = 0;
						shareTippy.hide();
					}, 1200);
				});
			} catch (x:Dynamic) {
				console.error("Failed to copy", x);
				fallback();
			}
		}
		//
		var shuffler = new FancyTableShuffler<ColStagKeyboard>("");
		if (location.hostname == "localhost") {
			var editorDetails:DetailsElement = document.querySelectorAuto("#editor-outer");
			//editorDetails.open = true;
		} else {
			t.sortBy(shuffler, false);
		}
		document.querySelectorAuto("#shuffle", InputElement).onclick = function() {
			if (t.sortColHead != null) {
				t.sortColHead.element.classList.remove("sort-column");
				t.sortColHead.element.classList.remove("sort-ascending");
				t.sortColHead = null;
			}
			t.sortBy(shuffler, false);
			t.updateURL();
		}
		t.loadFilters(document.location.search);
	}
	
}