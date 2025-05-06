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
		var forties = document.body.classList.contains("forties");
		if (row || forties) {
			kbTable = cast new RowStagTable(forties);
		} else kbTable = cast new ColStagTable();
		KeyboardPage.main(kbTable);
		
		var dynWindow = cast window;
		if (forties) {
			ToDoList.set(dynWindow.fortiesTODOs);
		} else if (row) {
			ToDoList.set(dynWindow.rowStagTODOs);
		} else {
			ToDoList.set(dynWindow.keyboardTODOs);
		}
	}
	
}