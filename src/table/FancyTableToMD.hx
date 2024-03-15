package table;
import js.html.AnchorElement;
import js.html.TableRowElement;
import table.FancyRow;
import table.FancyTable;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableToMD {
	public static function run<T>(table:FancyTable<T>) {
		var out = new StringBuf();
		
		var hasLegend = false;
		for (col in table.columns) if (col.show) {
			var legends = col.getLegends();
			if (legends.length == 0) continue;
			if (!hasLegend) {
				hasLegend = true;
				out.add("|Column|Value|Explanation|");
				out.add("\n|-:|:-|:-|");
			}
			var colName = (col.shortName ?? col.name);
			out.add("\n|" + colName
				+ "||" + (col.filterName ?? col.name));
			for (legend in legends) {
				out.add("\n|" + colName
					+ "|" + legend.short
					+ "|" + legend.full
				+ "|");
			}
		}
		if (hasLegend) out.add("\n\n");
		
		var cells = [];
		for (col in table.columns) if (col.show) {
			cells.push(col.shortName ?? col.name);
		}
		out.add("|" + cells.join("|") + "|");
		out.add("\n|" + cells.map((_)->":-").join("|") + "|");
		for (tr in table.outElement.querySelectorAllAutoArr("tr", TableRowElement)) {
			var row:FancyRow<T> = (cast tr).fancyRow;
			if (row == null || !row.show) continue;
			cells = [];
			for (cell in row.cells) if (cell.column.show) {
				var text = cell.element.innerText;
				var a:AnchorElement = cast cell.element.querySelector("a");
				if (a != null && !StringTools.startsWith(a.href, "javascript:")) {
					text = '[$text](${a.href})';
				}
				cells.push(text);
			}
			out.add("\n|" + cells.join("|") + "|");
		}
		return out.toString();
	}
}