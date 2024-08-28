package table;
import externs.Tippy;
import externs.TippyOptions;
import haxe.DynamicAccess;
import js.html.DivElement;
import js.html.Element;
import js.html.InputElement;
import js.html.SelectElement;
import js.html.TextAreaElement;
import table.tag.TagFilterMode;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
using tools.HtmlTools;
using StringTools;

/**
 * ...
 * @author YellowAfterlife
 */
class StringColumn<KB> extends FancyColumn<KB> {
	public var field:FancyField<KB, String>;
	public var emptyToNull:Bool = false;
	public function new(name:String, field:FancyField<KB, String>) {
		super(name);
		this.field = field;
		canSort = true;
	}
	override public function buildValue(out:Element, kb:KB):Void {
		out.appendTextNode(field.access(kb));
	}
	
	override public function compareValues(a:KB, b:KB, ascending:Bool):Int {
		var an = field.access(a).toUpperCase();
		var bn = field.access(b).toUpperCase();
		var sign = an == bn ? 0 : (an < bn ? -1 : 1);
		if (ascending) sign = -sign;
		return sign;
	}
	
	public var filterMode:TagFilterMode = AnyOf;
	public var filterModeSelect:SelectElement = null;
	//
	public var filterWords:Array<String> = [];
	public var filterWordsText:String = "";
	public var filterField:TextAreaElement = null;
	//
	override public function buildFilter(out:Element):Void {
		var modeSelect = document.createSelectElement();
		for (ctr in TagFilterMode.getConstructors()) {
			var val = TagFilterMode.createByName(ctr);
			var name = switch (val) {
				case AnyOf: "Any of these";
				case AllOf: "All of these";
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
		//
		filterField = document.createTextAreaElement();
		filterField.placeholder = "word1\nword2";
		function syncWords() {
			var newWords = filterField.value.split("\n");
			newWords = newWords.map(s -> StringTools.trim(s).toLowerCase());
			newWords = newWords.filter(s -> s != "");
			var newText = newWords.join("\n");
			if (newText == filterWordsText) return;
			filterWordsText = newText;
			filterWords = newWords;
			table.updateFilters();
		}
		filterField.addFieldChangeEventListener(function(_) syncWords());
		out.appendChild(filterField);
	}
	override public function matchesFilter(kb:KB):Bool {
		if (filterWords.length == 0) return true;
		var lqn = field.access(kb).toLowerCase();
		for (word in filterWords) {
			switch (filterMode) {
				case AnyOf: if (lqn.indexOf(word) >= 0) return true;
				case NoneOf: if (lqn.indexOf(word) >= 0) return false;
				case AllOf: if (lqn.indexOf(word) < 0) return false;
			}
		}
		return filterMode != AnyOf;
	}
	
	public var editorField:InputElement;
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		var fd = document.createInputElement();
		fd.type = "text";
		store.push(function(kb) {
			if (emptyToNull && fd.value.trim() == "") return;
			field.access(kb, true, fd.value);
		});
		restore.push(function(kb) {
			var val = field.access(kb);
			fd.value = val != null ? val : "";
		});
		fd.placeholder = "Cool Keyboard";
		out.appendChild(fd);
		editorField = fd;
	}
	
	override public function saveFilterParams(obj:DynamicAccess<String>):Void {
		var name = field.name;
		if (filterMode != AnyOf) {
			obj[name + "-mode"] = filterMode.getName();
		}
		if (filterWords.length > 0) {
			obj[name] = filterWords.map(s -> StringTools.htmlEscape(s, true)).join("+");
		}
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
			var list = listStr.split("+");
			filterWords = list.map(s -> s.htmlUnescape());
			filterField.value = filterWords.join("\n");
			ret = true;
		}
		return ret;
	}
}
