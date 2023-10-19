package table;
import type.Keyboard;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableShuffler<KB:Keyboard> extends FancyColumn<KB> {
	override public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		return Math.random() < 0.5 ? -1 : 1;
	}
}