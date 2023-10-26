package table;
import table.FancyTable;
import externs.Tippy;
import externs.TippyOptions;
import js.html.Element;
import js.html.TableCellElement;
import js.html.TableRowElement;
import table.FancyColumn;
import table.FancyRow;
import type.IntRange;
import type.Keyboard;
using tools.HtmlTools;
import js.Browser.*;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableFilters {
	public static function addNotes<KB:Keyboard>(column:FancyColumn<KB>, el:Element) {
		if (column.notes.childNodes.length > 0) {
			el.classList.add("has-notes");
			el.title = "(click to view notes)";
			var opts = new TippyOptions();
			opts.trigger = "click";
			opts.interactive = true;
			opts.appendTo = () -> el.parentElement;
			opts.maxWidth = 480;
			var notes:Element = cast column.notes.cloneNode(true);
			opts.content = function(_) return notes;
			Tippy.bind(el, opts);
		}
	}
	public static function build<KB:Keyboard>(table:FancyTable<KB>, out:Element) {
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
			var colName = column.filterName ?? column.name;
			var tr = document.createDivElement();
			tr.classList.add("item");
			
			var cbShow = document.createInputElement();
			cbShow.type = "checkbox";
			cbShow.title = 'Show "$colName"';
			cbShow.checked = column.show;
			cbShow.onchange = function(_) {
				column.show = !column.show;
				for (cell in table.header.cells.filter(c -> c.column == column)) {
					cell.element.setDisplayFlag(column.show);
				}
				for (row in table.rows) {
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
			cbFilter.title = 'Filter "$colName"';
			cbFilter.checked = false;
			cbFilter.disabled = !column.canFilter; //divFilters.children.length == 0;
			cbFilter.onchange = function(_) {
				column.wantFilter = cbFilter.checked;
				divFilters.setDisplayFlag(cbFilter.checked);
				table.updateFilters();
			}
			tr.appendChild(cbFilter);
			
			var meta = document.createDivElement();
			meta.classList.add("name");
			
			var colNameEl = document.createSpanElement();
			colNameEl.appendTextNode(colName);
			colNameEl.classList.add("column-name");
			
			addNotes(column, colNameEl);
			meta.appendChild(colNameEl);
			meta.appendChild(divFilters);
			tr.appendChild(meta);
			
			dest.appendChild(tr);
		}
	}
}