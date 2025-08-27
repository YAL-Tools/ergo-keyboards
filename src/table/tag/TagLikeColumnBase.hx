package table.tag;
using tools.HtmlTools;
import js.html.Element;
import js.html.InputElement;
import js.html.SelectElement;
import js.Browser.*;
import type.ValList;
import haxe.DynamicAccess;
import haxe.extern.EitherType;

/**
 * Important remarks:
 * - FT can be ValList<VT>
 * - You cannot have usedValues in here because an EitherType-constrained type cannot be used as a map key.
 * @author YellowAfterlife
 */
abstract class TagLikeColumnBase<T, VT, FT> extends FancyColumn<T> {
	public var field:FancyField<T, FT>;
	public var defaultValue:FT = null;
	public var columnCount = 1;
	
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
	
	public function getShortNotes(item:T, val:VT):String {
		return null;
	}
	
	public function showInEditor(val:VT):Bool {
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
	
	public function getValue(item:T):FT {
		return field.access(item) ?? defaultValue;
	}
	public function tagsContain(tags:Array<VT>, tag:VT) {
		return tags.contains(tag);
	}
	
	public function showInFilters(val:VT):Bool {
		return true;
	}
	
	public function getFilterNotes(val:VT):String {
		return null;
	}
	public function appendFilterNotes(out:Element, forEditor:Bool) {
		var ul:Element = null;
		for (name in getTagNames()) {
			var tag = nameToTag(name);
			if (!forEditor && !showInFilters(tag)) continue;
			var notes = getFilterNotes(tag);
			if (notes == null) continue;
			if (ul == null) {
				ul = out.appendElTextNode("ul");
			}
			var li = ul.appendElTextNode("li");
			li.appendElTextNode("b", getFilterLabel(tag));
			li.appendElTextNode("br");
			var sep = false;
			for (line in notes.split("\n")) {
				if (sep) li.appendLineBreak(); else sep = true;
				li.appendTextNode(line);
			}
		}
	}
	
	public function buildUsedValues():Void {
		
	}
	
	override public function buildFilter(out:Element):Void {
		buildUsedValues();
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
		
		var optCtr = out.appendElTextNode("div");
		optCtr.classList.add("tag-options");
		optCtr.setAttribute("column-count", "" + columnCount);
		for (ctr in getTagNames()) {
			var val:VT = nameToTag(ctr);
			if (!showInFilters(val)) continue;
			var name = getFilterLabel(val);
			
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
			optCtr.appendChild(div);
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
	public function getVisibleTagNamesForLegends():Array<String> {
		return [];
	}
	override public function getLegends():Array<FancyColumnLegend> {
		var names = getVisibleTagNamesForLegends();
		var arr = [];
		for (name in names) {
			var val = nameToTag(name);
			var short = getShortLabel(val);
			var long = getFilterLabel(val);
			if (short == long) continue;
			arr.push(new FancyColumnLegend(short, long));
		}
		return arr;
	}
}
typedef TagLikeColumnBaseTC = EitherType<EnumValue, String>;
