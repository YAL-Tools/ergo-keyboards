package table;
import type.GetSetOn;
import type.Keyboard;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyField<T, RT> {
	public var name:String;
	public var access:GetSetOn<T, RT>;
	public function new(name:String, access:GetSetOn<T, RT>) {
		this.name = name;
		this.access = access;
	}
}