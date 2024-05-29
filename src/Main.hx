package;

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

/**
 * ...
 * @author YellowAfterlife
 */
class Main {
	static function main() {
		LinkListColumn.domainCountries = (cast window).domainCountries;
		LinkListColumn.countryTags = (cast window).countryTags;
		
		var kbTable:KeyboardTable<Keyboard>;
		var row = document.body.classList.contains("rowstag");
		if (row) {
			kbTable = cast new RowStagTable();
		} else kbTable = cast new ColStagTable();
		KeyboardPage.main(kbTable);
		
		ToDoList.element = document.querySelectorAuto("#todo");
		ToDoList.set(row
			? (cast window).rowStagTODOs
			: (cast window).keyboardTODOs
		);
	}
	
}