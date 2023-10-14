package type;

/**
 * ...
 * @author YellowAfterlife
 */
@:forward abstract ValList<T>(Array<T>) from Array<T> to Array<T> {
	public var length(get, never):Int;
	inline function get_length() return this.length;
	
	@:arrayAccess inline function aget(i:Int):T return this[i];
	@:arrayAccess inline function aset(i:Int, v:T):T return this[i] = v;
	
	@:from public static function fromValue<T>(val:T):ValList<T> {
		return [val];
	}
}