package table ;
import externs.Tippy;
import externs.TippyOptions;
import js.html.Element;
import js.html.TableCellElement;
import js.html.TableRowElement;
import table.FancyColumn;
import table.FancyTableEditor;
import table.FancyRow;
import type.IntRange;
import type.Keyboard;
using tools.HtmlTools;
import js.Browser.*;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTable<KB:Keyboard> {
	public var columns:Array<FancyColumn<KB>> = [];
	public var filterOrder:Array<FancyTableFilterOrder<KB>> = [];
	public var keyboards:Array<KB> = [];
	public var header:FancyRow<KB> = null;
	public var rows:Array<FancyRow<KB>> = [];
	public var countElement:Element = null;
	public var testRow:FancyRow<KB> = null;
	public var outElement:Element = null;
	
	public function new() {
		
	}
	public function addColumn(col:FancyColumn<KB>) {
		col.table = this;
		columns.push(col);
		filterOrder.push(Column(col));
	}
	public function addFilterHeader(text:String) {
		filterOrder.push(Header(text));
	}
	public function buildFilters(out:Element) {
		FancyTableFilters.build(this, out);
	}
	
	public function sortBy(sortColumn:FancyColumn<KB>, ascending:Bool) {
		var sortRows = rows.copy();
		sortRows.sort(function(a, b) {
			return sortColumn.compareKeyboards(a.keyboard, b.keyboard, ascending);
		});
		sortRows.reverse();
		for (row in sortRows) header.element.after(row.element);
	}
	public var sortColHead:FancyTableHeaderCell<KB> = null;
	public var sortAscending:Bool = false;
	public function createRow(keyboard:KB) {
		var row = new FancyRow(keyboard);
		for (column in columns) {
			var cell = new FancyTableCell(column);
			cell.element.setDisplayFlag(column.show);
			column.buildValue(cell.element, keyboard);
			row.cells.push(cell);
			row.element.appendChild(cell.element);
		}
		return row;
	}
	public function buildTable(out:Element) {
		outElement = out;
		header = new FancyRow(null);
		for (column in columns) {
			var cell = new FancyTableHeaderCell(column);
			cell.element.setDisplayFlag(column.show);
			if (column.shortName != null) {
				cell.element.appendTextNode(column.shortName);
				cell.element.title = column.name;
			} else {
				cell.element.appendTextNode(column.name);
			}
			if (column.canSort) {
				cell.element.classList.add("can-sort");
				var sfx = "Can sort";
				if (cell.element.title != null) {
					cell.element.title += "\n" + sfx;
				} else cell.element.title = sfx;
				cell.element.onclick = function(_) {
					if (sortColHead != cell) {
						if (sortColHead != null) {
							sortColHead.element.classList.remove("sort-column");
							sortColHead.element.classList.remove("sort-ascending");
						}
						sortAscending = false;
						sortColHead = cell;
						sortColHead.element.classList.add("sort-column");
					} else {
						sortAscending = !sortAscending;
						sortColHead.element.classList.setTokenFlag("sort-ascending", sortAscending);
					}
					sortBy(sortColHead.column, sortAscending);
				}
			}
			header.cells.push(cell);
			header.element.appendChild(cell.element);
		}
		out.appendChild(header.element);
		//
		for (keyboard in keyboards) {
			var row = createRow(keyboard);
			rows.push(row);
			out.appendChild(row.element);
		}
		if (countElement != null) countElement.innerText = "" + keyboards.length;
	}
	public function updateFilters() {
		var found = 0;
		for (row in rows) {
			var keyboard = row.keyboard;
			var show = true;
			for (column in columns) if (column.wantFilter) {
				if (column.matchesFilter(keyboard)) continue;
				show = false;
				break;
			}
			row.element.setDisplayFlag(show);
			if (show) found++;
		}
		if (countElement != null) countElement.innerText = "" + found;
	}
	public function loadTest(kb:KB) {
		if (testRow != null) {
			testRow.element.parentElement.removeChild(testRow.element);
			keyboards.remove(testRow.keyboard);
		}
		for (col in columns) col.load(kb);
		testRow = createRow(kb);
		outElement.appendChild(testRow.element);
		rows.push(testRow);
	}
}
enum FancyTableFilterOrder<KB:Keyboard> {
	Column(col:FancyColumn<KB>);
	Header(text:String);
}