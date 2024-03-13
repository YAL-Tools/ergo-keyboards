package table;
import table.NumberColumn;
import table.NumberRangeColumn;
import table.NumberRangeListColumn;
import type.Keyboard;

/**
 * ...
 * @author YellowAfterlife
 */
class IntRangeColumn<KB:Keyboard> extends NumberRangeColumn<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		return NumberColumn.parseIntValue(val);
	}
}
class IntRangeListColumn<KB:Keyboard> extends NumberRangeListColumn<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		return NumberColumn.parseIntValue(val);
	}
}