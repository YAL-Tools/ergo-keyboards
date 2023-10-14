package;

import js.Lib;
import ColStagTable;
import js.html.Element;
using tools.HtmlTools;
import js.Browser.*;

/**
 * ...
 * @author YellowAfterlife
 */
class Main {
	
	static function main() {
		var t = new ColStagTable();
		t.buildFilters(document.querySelectorAuto("#filter"));
		t.buildTable(document.querySelectorAuto("#data"));
	}
	
}