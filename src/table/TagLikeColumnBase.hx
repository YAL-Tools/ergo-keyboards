package table;
using tools.HtmlTools;
import js.html.Element;
import js.html.InputElement;
import js.html.SelectElement;
import js.Browser.*;
import type.ValList;
import haxe.DynamicAccess;
import haxe.extern.EitherType;

/**
 * NB! FT can be ValList<VT>
 * @author YellowAfterlife
 */
abstract class TagLikeColumnBase<T, VT, FT> extends FancyColumn<T> {
	public var field:FancyField<T, FT>;
	
	override public function getId():String {
		return field.name;
	}
	
	abstract public function getTagNames():Array<String>;
	abstract public function tagToIndex(val:VT):Int;
	abstract public function tagToName(val:VT):String;
	abstract public function indexToTag(ind:Int):VT;
	abstract public function nameToTag(str:String):VT;
	abstract public function getDefaultTag():VT;
	abstract public function getFilterLabel(val:VT):String;
	abstract public function getShortLabel(val:VT):String;
	public function showInFilters(val:VT):Bool {
		return true;
	}
	
	public function new(name:String, field:FancyField<T, FT>) {
		super(name);
		this.field = field;
	}
	
	public var filterTags:Array<VT> = [];
	public var filterCheckboxes:Array<InputElement> = [];
	public var isMulti = false;
	
	public var filterMode:TagFilterMode = AnyOf;
	public var filterModeSelect:SelectElement = null;
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
		filterModeSelect = modeSelect;
		out.appendChild(modeSelect);
		
		for (ctr in getTagNames()) {
			var val:VT = nameToTag(ctr);
			if (!showInFilters(val)) continue;
			var name = getFilterLabel(val) ?? ctr;
			
			var cb = document.createCheckboxElement();
			cb.checked = filterTags.contains(val);
			cb.id = field.name + "-" + ctr;
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
			filterCheckboxes.push(cb);
			
			var lb = document.createLabelElement();
			lb.appendChild(cb);
			lb.appendTextNode(name);
			
			var div = document.createDivElement();
			div.appendChild(lb);
			out.appendChild(div);
		}
	}
	override public function saveFilterParams(obj:DynamicAccess<String>):Void {
		var name = field.name;
		if (filterMode != AnyOf) {
			obj[name + "-mode"] = filterMode.getName();
		}
		var list = filterTags.map(t->tagToName(t));
		if (list.length > 0) obj[name] = list.join("~");
	}
	override public function loadFilterParams(obj:DynamicAccess<String>):Bool {
		var name = field.name;
		var mode = obj[name + "-mode"];
		var ret = false;
		if (mode != null) try {
			filterMode = TagFilterMode.createByName(mode);
			filterModeSelect.value = mode;
			filterModeSelect.triggerChange();
			ret = true;
		} catch (x:Dynamic) {
			console.error("Invalid filter mode " + mode + " for " + name);
		}
		
		var listStr = obj[name];
		if (listStr != null) {
			var list = listStr.split("~");
			for (cb in filterCheckboxes) {
				cb.checked = false;
				cb.triggerChange();
			}
			for (item in list) {
				var cb = filterCheckboxes.filter(cb->cb.id == name + "-" + item)[0];
				if (cb != null) {
					cb.checked = true;
					cb.triggerChange();
					ret = true;
				}
			}
		}
		return ret;
	}
}
typedef TagLikeColumnBaseTC = EitherType<EnumValue, String>;
