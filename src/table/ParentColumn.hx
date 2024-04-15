package table;
import js.html.Element;
import js.Browser.*;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class ParentColumn<KB:type.Keyboard> extends StringColumn<KB> {

	public function new(name:String, field:FancyField<KB, String>) {
		super(name, field);
		emptyToNull = true;
		canFilter = false;
	}
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		super.buildEditor(out, store, restore);
		out.appendLineBreak();
		var def = "Pick a keyboard?";
		var selector = document.createSelectElement();
		//
		var names = table.values.map(s -> s.name);
		names.sort(function(a, b) {
			var an = a.toLowerCase();
			var bn = b.toLowerCase();
			return an < bn ? -1 : 1;
		});
		names.unshift(def);
		//
		for (name in names) {
			var opt = document.createOptionElement();
			opt.value = name;
			opt.text = name;
			selector.appendChild(opt);
		}
		selector.value = def;
		//
		selector.onchange = function(_) {
			if (selector.value == def) return;
			editorField.value = selector.value;
			selector.value = def;
		}
		out.appendChild(selector);
	}
}