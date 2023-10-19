package table;
import type.*;
import table.NumberColumn;

/**
 * ...
 * @author YellowAfterlife
 */
class IntListColumn<KB:Keyboard> extends NumberListColumn<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		return NumberColumn.parseIntValue(val);
	}
}