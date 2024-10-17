package table;

import js.html.Element;
using tools.HtmlTools;

class FuncColumn<T> extends FancyColumn<T> {
	public var func:FuncColumnFunc<T>;
	override public function new(name:String, refValue:T, func:FuncColumnFunc<T>) {
		super(name);
		canEdit = false;
		canFilter = false;
		this.func = func;
	}
	override function buildValue(out:Element, item:T) {
		var pair = func(out, item);
		if (pair == null) return;
		var span = out.appendElTextNode("span", pair.text);
		span.setTippyTitle(pair.tip);
	}
}
typedef FuncColumnFunc<T> = (out:Element, item:T)->{text:String, tip:String};