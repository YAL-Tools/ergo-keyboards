package table;
import table.NumberColumn;
import type.GetSetOn;
import type.NumRange;

/**
 * ...
 * @author YellowAfterlife
 */
class IntColumn<KB:Keyboard> extends NumberColumn<KB, Int> {
	override public function parseFilterValue(val:String):Int {
		return NumberColumnBase.parseIntValue(val);
	}
}