package table;
import js.Browser.*;
import js.html.Element;
import js.html.TableCellElement;
import table.FancyTableColumn;
import type.Keyboard;
import js.html.TableRowElement;

/**
 * A row in the data table
 * @author YellowAfterlife
 */
class FancyTableRow<KB:Keyboard> {
	public var keyboard:KB;
	public var element:TableRowElement;
	public var show:Bool;
	public var cells:Array<FancyTableCellBase<KB>> = [];
	public function new(kb:KB) {
		keyboard = kb;
		element = document.createTableRowElement();
	}
}
class FancyTableCellBase<KB:Keyboard> {
	public var element:Element;
	public var column:FancyTableColumn<KB>;
	public function new(col:FancyTableColumn<KB>) {
		column = col;
	}
}
class FancyTableCell<KB:Keyboard> extends FancyTableCellBase<KB> {
	public function new(col:FancyTableColumn<KB>) {
		super(col);
		element = document.createTableCellElement();
	}
}
class FancyTableHeaderCell<KB:Keyboard> extends FancyTableCellBase<KB> {
	public function new(col:FancyTableColumn<KB>) {
		super(col);
		element = document.createElement("th");
	}
}