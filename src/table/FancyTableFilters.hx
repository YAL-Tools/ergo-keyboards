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
	public static function addNotesFor(onNotes:Element->Void, el:Element) {
		if (onNotes != null) {
			el.classList.add("has-notes");
			el.title = "(click to view notes)";
			var opts = new TippyOptions();
			opts.trigger = "click";
			opts.interactive = true;
			opts.appendTo = () -> el.parentElement;
			opts.maxWidth = 480;
			opts.setLazyContent(function() {
				var div = document.createDivElement();
				onNotes(div);
				return div;
			});
			Tippy.bind(el, opts);
		}
	}
	public static function addNotes<T>(column:FancyColumn<T>, el:Element) {
		addNotesFor(column.onNotes, el);
	}
	public static function build<T>(table:FancyTable<T>, out:Element) {
		var dest:Element = out;
		for (item in table.filterOrder) {
			var column = switch (item) {
				case Header(header):
					var text = header.text;
					var details = document.createDetailsElement();
					details.open = true;
					var summary = document.createElement("summary");
					summary.appendTextNode(text);
					details.appendChild(summary);
					out.appendChild(details);
					dest = details;
					for (note in header.filterNotes) {
						var div = details.appendElTextNode("div", "");
						div.classList.add("note");
						var notice = div.appendElTextNode("span", note.text);
						addNotesFor(note.func, notice);
					}
					continue;
				case Column(col): col;
			}
			if (!(column.showInFilter ?? column.canFilter)) continue;
			var colName = column.filterName ?? column.name;
			var tr = document.createDivElement();
			tr.classList.add("item");
			tr.setAttribute("data-id", column.getId());
			tr.setAttribute("data-name", column.name);
			
			var cbShow = document.createInputElement();
			cbShow.disabled = !column.canShow;
			cbShow.type = "checkbox";
			cbShow.classList.add("cb-show");
			cbShow.checked = column.show;
			cbShow.onchange = function(_) {
				column.show = cbShow.checked;
				for (cell in table.header.cells.filter(c -> c.column == column)) {
					cell.element.setDisplayFlag(column.show);
				}
				for (row in table.rows) {
					for (cell in row.cells.filter(c -> c.column == column)) {
						cell.element.setDisplayFlag(column.show);
					}
				}
			}
			column.showCheckbox = cbShow;
			var lbShow = document.createLabelElement();
			lbShow.appendChild(cbShow);
			tr.appendChild(lbShow);
			var toShow = new TippyOptions();
			toShow.content = 'Show "$colName"';
			Tippy.bind(cbShow, toShow);
			
			var divFilters = document.createDivElement();
			column.buildFilter(divFilters);
			divFilters.setDisplayFlag(false);
			divFilters.classList.add("filters");
			
			var cbFilter = document.createInputElement();
			cbFilter.type = "checkbox";
			cbFilter.classList.add("cb-filter");
			cbFilter.checked = false;
			cbFilter.disabled = !column.canFilter; //divFilters.children.length == 0;
			cbFilter.onchange = function(_) {
				column.wantFilter = cbFilter.checked;
				divFilters.setDisplayFlag(cbFilter.checked);
				table.updateFilters();
			}
			column.filterCheckbox = cbFilter;
			var lbFilter = document.createLabelElement();
			lbFilter.appendChild(cbFilter);
			tr.appendChild(lbFilter);
			var toFilter = new TippyOptions();
			toFilter.content = 'Filter "$colName"';
			Tippy.bind(cbFilter, toFilter);
			
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