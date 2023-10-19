package table;
import type.Keyboard;

/**
 * ...
 * @author YellowAfterlife
 */
class FloatColumn<KB:Keyboard> extends NumberColumn<KB, Float> {
	override public function parseFilterValue(val:String):Float {
		return NumberColumn.parseFloatValue(val);
	}
}