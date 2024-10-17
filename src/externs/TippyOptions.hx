package externs;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.Browser;
import js.html.Element;
import js.html.Event;
import externs.Tippy;

/**
 * ...
 * @author YellowAfterlife
 */
@:build(tools.StringAccess.build())
abstract TippyOptions(Any) {
	public var theme:String;
	public var interactive:Bool;
	public var content:EitherType<TippyStringOrElement, Element->TippyStringOrElement>;
	public var trigger:String;
	public var touch:EitherType<Bool, String>;
	public var onTrigger:(tippy:Tippy, event:Event)->Void;
	public var onShow:TippyOptionsOnShow;
	public var placement:String;
	public var maxWidth:EitherType<Int, String>;
	public var appendTo:Void->Element;
	public inline function new() {
		this = {};
		theme = Tippy.theme;
	}
	public inline function bind(el:Any):Tippy {
		return Tippy.bind(el, this);
	}
	public function bindClick(el:Element) {
		trigger = "click";
		var fn; fn = function(e) {
			var tippy = bind(el);
			tippy.show();
			el.removeEventListener("click", fn);
		}
		el.addEventListener("click", fn);
	}
	public function setLazyContent(fn:Void->Element) {
		var ready = false;
		onShow = function(tippy:Tippy) {
			if (!ready) {
				ready = true;
				tippy.setContent(fn());
			}
		}
	}
	public function setHoverOnly(fn:TippyOptionsOnShow) {
		onShow = fn;
		touch = false;
	}
	public function setClickTap(
		click:Tippy->Event->Void,
		tap:TippyOptionsOnShow,
		?wantClick:Tippy->Event->Bool
	):Void {
		trigger = "click";
		var _tap:Tippy->Null<Bool> = cast tap;
		var block = false;
		if (click == null) click = function(t, e) {};
		if (tap == null) tap = function(t) {};
		if (wantClick == null) wantClick = function(t, e) {
			return !Tippy.currentInput.isTouch;
		}
		onTrigger = function(t, e) {
			block = wantClick(t, e);
			if (!block) return;
			click(t, e);
		};
		onShow = function(t) {
			if (block) return false;
			var val = _tap(t);
			return val == null || val;
		};
	}
	static function _preventDefault(t, e:Event) {
		e.preventDefault();
	}
	public function setContextMenu(show:TippyOptionsOnShow) {
		trigger = "contextmenu";
		onTrigger = _preventDefault;
		onShow = show;
	}
	private static function _body() {
		return Browser.document.body;
	}
	public function setInteractiveSafe() {
		interactive = true;
		appendTo = _body;
	}
}
typedef TippyOptionsOnShow = EitherType<(tippy:Tippy)->Bool, (tippy:Tippy)->Void>;
