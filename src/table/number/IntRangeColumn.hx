package table.number;
import type.NamedThing;
import table.number.NumberColumn;
import table.number.NumberRangeColumn;
import table.number.NumberRangeListColumn;
import type.Keyboard;

/**
 * ...
 * @author YellowAfterlife
 */
class IntRangeColumn<KB:NamedThing> extends NumberRangeColumn<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		return NumberColumn.parseIntValue(val);
	}
}
class IntRangeListColumn<KB:NamedThing> extends NumberRangeListColumn<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		return NumberColumn.parseIntValue(val);
	}
}