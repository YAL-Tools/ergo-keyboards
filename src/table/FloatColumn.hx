package table;
import type.Keyboard;

/**
 * ...
 * @author YellowAfterlife
 */
class FloatColumn<T> extends NumberColumn<T, Float> {
	override public function parseFilterValue(val:String):Float {
		return NumberColumn.parseFloatValue(val);
	}
}