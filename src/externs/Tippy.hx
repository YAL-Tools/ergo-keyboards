package externs ;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.Syntax;
import js.html.Element;
import js.html.Event;

/**
 * ...
 * @author YellowAfterlife
 */
@:native("Tippy")
@:build(tools.StringAccess.build())
extern class Tippy {
	public static inline var theme:String = "translucent";
	public static inline function bind(target:Any, options:TippyOptions):Void {
		Syntax.code("Tippy")(target, options);
	}
	
	function destroy():Void;
	function disable():Void;
	function enable():Void;
	function hide():Void;
	function show():Void;
	function setContent(content:TippyStringOrElement):Void;
	function setProps(options:TippyOptions):Void;
	var reference:Element;
	static var currentInput(get, never):TippyInput;
	private static inline function get_currentInput():TippyInput {
		return Syntax.code('{0}["currentInput"]', Tippy);
	}
	private static inline function __init__():Void {
		Syntax.code('var Tippy = window["tippy"]');
	}
}
extern class TippyInput {
	var isTouch(get, never):Bool;
	private inline function get_isTouch():Bool {
		return Syntax.code('{0}["isTouch"]', this);
	}
}

typedef TippyStringOrElement = EitherType<String, Element>;
