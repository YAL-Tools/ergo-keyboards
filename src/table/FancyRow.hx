package table;
import js.Browser.*;
import js.html.Element;
import js.html.TableCellElement;
import table.FancyColumn;
import type.Keyboard;
import js.html.TableRowElement;

/**
 * A row in the data table
 * @author YellowAfterlife
 */
class FancyRow<T> {
	public var value:T;
	public var element:TableRowElement;
	public var show:Bool = true;
	public var cells:Array<FancyTableCellBase<T>> = [];
	public function new(ref:T) {
		value = ref;
		element = document.createTableRowElement();
		if (ref != null) {
			(cast element).fancyRow = this;
		}
		element.addEventListener("click", function(_) {
			var cur = element.parentElement.querySelector("tr.latest");
			if (cur != null) cur.classList.remove("latest");
			
			element.classList.add("latest");
		});
	}
}
class FancyTableCellBase<T> {
	public var element:Element;
	public var column:FancyColumn<T>;
	public function new(col:FancyColumn<T>) {
		column = col;
	}
}
class FancyTableCell<T> extends FancyTableCellBase<T> {
	public function new(col:FancyColumn<T>) {
		super(col);
		element = document.createTableCellElement();
	}
}
class FancyTableHeaderCell<T> extends FancyTableCellBase<T> {
	public function new(col:FancyColumn<T>) {
		super(col);
		element = document.createElement("th");
	}
}