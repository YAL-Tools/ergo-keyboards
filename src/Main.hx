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
		LinkListColumn.domainCountries = (cast window).domainCountries;
		LinkListColumn.countryTags = (cast window).countryTags;
		//
		var divFilters:Element = document.querySelectorAuto("#filter");
		var csTable = new ColStagTable();
		csTable.resolveParents();
		csTable.countElement = document.querySelectorAuto("#count");
		csTable.buildFilters(divFilters);
		csTable.buildTable(document.querySelectorAuto("#data"));
		FancyTableEditor.build(csTable,
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
			csTable.baseURL = loc.origin + loc.pathname;
		}
		
		//
		var btClearFilters:InputElement = document.querySelectorAuto("#clear-filters");
		btClearFilters.onclick = function() {
			FancyTableControls.clearFilters(csTable, divFilters);
		}
		
		//
		var cbAutoUpdateURL:InputElement = document.querySelectorAuto("#auto-update-url");
		csTable.canUpdateURL = cbAutoUpdateURL.checked;
		cbAutoUpdateURL.addEventListener("change", function(_) {
			csTable.canUpdateURL = cbAutoUpdateURL.checked;
		});
		
		//
		var btShare:InputElement = document.querySelectorAuto("#copy-share-url");
		FancyTableControls.createShareButton(csTable, btShare);
		
		//
		var shuffler = new FancyTableShuffler<ColStagKeyboard>("");
		if (location.hostname == "localhost") {
			var editorDetails:DetailsElement = document.querySelectorAuto("#editor-outer");
			editorDetails.open = true;
		} else {
			csTable.sortBy(shuffler, false);
		}
		document.querySelectorAuto("#shuffle", InputElement).onclick = function() {
			if (csTable.sortColHead != null) {
				csTable.sortColHead.element.classList.remove("sort-column");
				csTable.sortColHead.element.classList.remove("sort-ascending");
				csTable.sortColHead = null;
			}
			csTable.sortBy(shuffler, false);
			csTable.updateURL();
		}
		csTable.loadFilters(document.location.search);
		console.log("Hello!");
	}
	
}