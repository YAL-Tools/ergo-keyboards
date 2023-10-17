package table ;
import externs.Tippy;
import externs.TippyOptions;
import js.html.Element;
import js.html.TableCellElement;
import js.html.TableRowElement;
import table.FancyTableColumn;
import table.FancyTableRow;
import type.IntRange;
import type.Keyboard;
using tools.HtmlTools;
import js.Browser.*;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTable<KB:Keyboard> {
	public var columns:Array<FancyTableColumn<KB>> = [];
	public var filterOrder:Array<FancyTableFilterOrder<KB>> = [];
	public var keyboards:Array<KB> = [];
	public var header:FancyTableRow<KB> = null;
	public var rows:Array<FancyTableRow<KB>> = [];
	public var countElement:Element = null;
	public function new() {
		
	}
	public function addColumn(col:FancyTableColumn<KB>) {
		col.table = this;
		columns.push(col);
		filterOrder.push(Column(col));
	}
	public function addFilterHeader(text:String) {
		filterOrder.push(Header(text));
	}
	public function buildFilters(out:Element) {
		var dest:Element = out;
		for (item in filterOrder) {
			var column = switch (item) {
				case Header(text):
					var details = document.createDetailsElement();
					details.open = true;
					var summary = document.createElement("summary");
					summary.appendTextNode(text);
					details.appendChild(summary);
					out.appendChild(details);
					dest = details;
					continue;
				case Column(col): col;
			}
			var tr = document.createDivElement();
			tr.classList.add("item");
			
			var cbShow = document.createInputElement();
			cbShow.type = "checkbox";
			cbShow.checked = column.show;
			cbShow.onchange = function(_) {
				column.show = !column.show;
				for (cell in header.cells.filter(c -> c.column == column)) {
					cell.element.setDisplayFlag(column.show);
				}
				for (row in rows) {
					for (cell in row.cells.filter(c -> c.column == column)) {
						cell.element.setDisplayFlag(column.show);
					}
				}
			}
			tr.appendChild(cbShow);
			
			var divFilters = document.createDivElement();
			column.buildFilter(divFilters);
			divFilters.setDisplayFlag(false);
			divFilters.classList.add("filters");
			
			var cbFilter = document.createInputElement();
			cbFilter.type = "checkbox";
			cbFilter.checked = false;
			cbFilter.disabled = !column.canFilter; //divFilters.children.length == 0;
			cbFilter.onchange = function(_) {
				column.wantFilter = cbFilter.checked;
				divFilters.setDisplayFlag(cbFilter.checked);
				updateFilters();
			}
			tr.appendChild(cbFilter);
			
			var meta = document.createDivElement();
			meta.classList.add("name");
			
			var colName = column.filterName ?? column.name;
			var colNameEl = document.createSpanElement();
			colNameEl.appendTextNode(colName);
			colNameEl.classList.add("column-name");
			
			if (column.notes.childNodes.length > 0) {
				colNameEl.classList.add("has-notes");
				colNameEl.title = "(click to view notes)";
				var opts = new TippyOptions();
				opts.trigger = "click";
				opts.interactive = true;
				opts.appendTo = () -> meta;
				opts.maxWidth = 480;
				opts.content = function(_) return column.notes;
				Tippy.bind(colNameEl, opts);
			}
			meta.appendChild(colNameEl);
			meta.appendChild(divFilters);
			tr.appendChild(meta);
			
			dest.appendChild(tr);
		}
	}
	
	public function sortBy(sortColumn:FancyTableColumn<KB>, ascending:Bool) {
		var sortRows = rows.copy();
		sortRows.sort(function(a, b) {
			return sortColumn.compareKeyboards(a.keyboard, b.keyboard, ascending);
		});
		sortRows.reverse();
		for (row in sortRows) header.element.after(row.element);
	}
	public var sortColHead:FancyTableHeaderCell<KB> = null;
	public var sortAscending:Bool = false;
	public function buildTable(out:Element) {
		header = new FancyTableRow(null);
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
			var row = new FancyTableRow(keyboard);
			for (column in columns) {
				var cell = new FancyTableCell(column);
				cell.element.setDisplayFlag(column.show);
				column.buildValue(cell.element, keyboard);
				row.cells.push(cell);
				row.element.appendChild(cell.element);
			}
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
}
enum FancyTableFilterOrder<KB:Keyboard> {
	Column(col:FancyTableColumn<KB>);
	Header(text:String);
}