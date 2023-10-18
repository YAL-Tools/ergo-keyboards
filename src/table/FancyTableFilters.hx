package table;
import table.FancyTable;
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
class FancyTableFilters {
	public static function build<KB>(table:FancyTable<KB>, out:Element) {
		var dest:Element = out;
		for (item in table.filterOrder) {
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
}