package table.number;
import type.*;
import table.number.NumberColumn;

/**
 * ...
 * @author YellowAfterlife
 */
class IntListColumn<KB:Keyboard> extends NumberListColumn<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		return NumberColumn.parseIntValue(val);
	}
}