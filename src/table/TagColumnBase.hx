package table;
import js.html.Element;
import table.FancyColumn;
import type.GetSetOn;
import type.Keyboard;
import js.Browser.*;
import type.ValList;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class TagColumnBase<KB:Keyboard, ET:EnumValue> extends FancyColumn<KB> {
	public var filterLabels:Map<ET, String> = new Map();
	public var shortLabels:Map<ET, String> = new Map();
	public var type:Enum<ET>;
	public function new(name:String, et:Enum<ET>) {
		super(name);
		this.type = et;
	}
	
	public var filterTags:Array<ET> = [];
	public var isMulti = false;
	public var filterMode:TagFilterMode = AnyOf;
	override public function buildFilter(out:Element):Void {
		var modeSelect = document.createSelectElement();
		for (ctr in TagFilterMode.getConstructors()) {
			var val = TagFilterMode.createByName(ctr);
			var name = switch (val) {
				case AnyOf: "Any of these";
				case AllOf: if (!isMulti) continue; "All of these";
				case NoneOf: "None of these";
			}
			var opt = document.createOptionElement();
			opt.value = ctr;
			opt.appendTextNode(name);
			if (val == AnyOf) opt.selected = true;
			modeSelect.appendChild(opt);
		}
		modeSelect.onchange = function(_) {
			var old = filterMode;
			filterMode = TagFilterMode.createByName(modeSelect.value) ?? AnyOf;
			if (old != filterMode) table.updateFilters();
		}
		out.appendChild(modeSelect);
		for (ctr in Type.getEnumConstructs(type)) {
			var val:ET = Type.createEnum(type, ctr);
			var name = filterLabels[val] ?? ctr;
			
			var cb = document.createCheckboxElement();
			cb.onchange = function(_) {
				if (cb.checked) {
					if (!filterTags.contains(val)) {
						filterTags.push(val);
						table.updateFilters();
					}
				} else {
					if (filterTags.remove(val)) {
						table.updateFilters();
					}
				}
			}
			
			var lb = document.createLabelElement();
			lb.appendChild(cb);
			lb.appendTextNode(name);
			
			var div = document.createDivElement();
			div.appendChild(lb);
			out.appendChild(div);
		}
	}
}