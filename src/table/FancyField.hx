package table;
import type.GetSetOn;
import type.Keyboard;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyField<KB:Keyboard, RT> {
	public var name:String;
	public var access:GetSetOn<KB, RT>;
	public function new(name:String, access:GetSetOn<KB, RT>) {
		this.name = name;
		this.access = access;
	}
}