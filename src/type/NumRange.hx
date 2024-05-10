package type;

import js.lib.RegExp;

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
	public static function parseInt(str:String):NumRange<Int> {
		static var rxRange = new RegExp("^\\s*" + "(\\d+)"
			+ "\\s*" + "(?:\\.\\.|-)" // a..b OR a-b
			+ "\\s*" + "(\\d+)"
		+ "\\s*" + "$");
		var mt = rxRange.exec(str);
		if (mt != null) {
			var min = Std.parseInt(mt[1]);
			var max = Std.parseInt(mt[2]);
			return new IntRange(min, max);
		} else {
			return Std.parseInt(str);
		}
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
