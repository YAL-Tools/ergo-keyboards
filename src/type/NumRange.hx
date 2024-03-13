package type;

/**
 * ...
 * @author YellowAfterlife
 */
@:forward abstract NumRange<T>(NumRangeImpl<T>) {
	public inline function new(min:T, max:T) {
		this = {min:min, max:max};
	}
	@:from public static function fromValue<T>(val:T) {
		return new NumRange(val, val);
	}
	@:from public static function fromArray<T>(arr:Array<T>) {
		if (arr.length != 2) throw "Expected [min, max]";
		return new NumRange(arr[0], arr[1]);
	}
	public function toString() {
		if (this == null) return "";
		if (this.min == this.max) return "" + this.min;
		return this.min + ".." + this.max;
	}
}
typedef NumRangeImpl<T> = {
	min:T,
	max:T,
};
