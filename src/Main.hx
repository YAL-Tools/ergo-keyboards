package;

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
	
	static function main() {
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
		if (location.hostname == "localhost") {
			var editorDetails:DetailsElement = document.querySelectorAuto("#editor-outer");
			//editorDetails.open = true;
		}
		var shuffler = new FancyTableShuffler<ColStagKeyboard>("");
		t.sortBy(shuffler, false);
		document.querySelectorAuto("#shuffle", InputElement).onclick = function() {
			if (t.sortColHead != null) {
				t.sortColHead.element.classList.remove("sort-column");
				t.sortColHead.element.classList.remove("sort-ascending");
				t.sortColHead = null;
			}
			t.sortBy(shuffler, false);
		}
	}
	
}