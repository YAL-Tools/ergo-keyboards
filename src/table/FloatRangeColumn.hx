package table;
import type.*;

/**
 * ...
 * @author YellowAfterlife
 */
class FloatRangeColumn<KB:Keyboard> extends NumberRangeColumn<KB, Float> {
	override public function parseFilterValue(val:String):Float {
		return NumberColumn.parseFloatValue(val);
	}
}