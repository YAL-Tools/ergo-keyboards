package type;
import haxe.Rest;
import table.number.NumberColumn;

/**
 * ...
 * @author YellowAfterlife
 */
@:forward abstract NumRangeList<T:Float>(Array<NumRange<T>>) from Array<NumRange<T>> {
	public inline function new() {
		this = [];
	}
	
	@:arrayAccess public inline function get(i:Int):NumRange<T> {
		return this[i];
	}
	@:arrayAccess public inline function set(i:Int, v:NumRange<T>):NumRange<T> {
		return this[i] = v;
	}
	
	@:from public static inline function fromValue<T:Float>(v:T):NumRangeList<T> {
		return [NumRange.fromValue(v)];
	}
	@:from public static inline function fromRange<T:Float>(v:NumRange<T>):NumRangeList<T> {
		return [v];
	}
	@:from public static function fromSimpleArray<T:Float>(arr:Array<T>):NumRangeList<T> {
		if (arr.length != 2) throw "Expected [min, max]";
		return [new NumRange(arr[0], arr[1])];
	}
	//
	public static function fromValues<T:Float>(arr:Array<T>):NumRangeList<T> {
		return arr.map(v -> NumRange.fromValue(v));
	}
	public static function either<T:Float>(vals:Rest<T>):NumRangeList<T> {
		var ranges = [];
		for (val in vals) ranges.push(NumRange.fromValue(val));
		return ranges;
	}
	//
	public function calcMin(def:T = cast 0):T {
		var result:T = null;
		for (range in this) {
			if (result == null || NumberColumn.compareValues(range.min, result) < 0) result = range.min;
		}
		return result ?? def;
	}
	public function calcMax(def:T = cast 0):T {
		var result:T = null;
		for (range in this) {
			if (result == null || NumberColumn.compareValues(range.max, result) > 0) result = range.max;
		}
		return result ?? def;
	}
	public function toString() {
		return this.map(r -> r.toString()).join(", ");
	}
}
typedef IntRangeList = NumRangeList<Int>;
