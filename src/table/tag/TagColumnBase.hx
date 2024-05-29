package table.tag;
import haxe.DynamicAccess;
import js.html.Element;
import js.html.InputElement;
import js.html.SelectElement;
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
class TagColumnBase<T, ET:EnumValue, FT> extends TagLikeColumnBase<T, ET, FT> {
	public var filterLabels:Map<ET, String> = new Map();
	public var shortLabels:Map<ET, String> = new Map();
	
	public var hideInEditor:Map<ET, Bool> = new Map();
	override function showInEditor(val:ET):Bool {
		return !hideInEditor.exists(val);
	}
	
	public var usedValues:Map<ET, Bool> = new Map();
	override public function showInFilters(val:ET):Bool {
		return usedValues.exists(val);
	}
	
	public var filterNotes:Map<ET, String> = new Map();
	override function getFilterNotes(val:ET):String {
		return filterNotes[val];
	}
	
	override public function getId():String {
		return field.name;
	}
	
	public var type:Enum<ET>;
	public function getDefaultTag() {
		return type.createByIndex(0);
	}
	public function getTagNames():Array<String> {
		return type.getConstructors();
	}
	public function tagToIndex(val:ET):Int {
		return val.getIndex();
	}
	public function tagToName(val:ET):String {
		return val.getName();
	}
	public function indexToTag(ind:Int):ET {
		return type.createByIndex(ind);
	}
	public function nameToTag(name:String):ET {
		return type.createByName(name);
	}
	public function getFilterLabel(val:ET):String {
		return filterLabels[val] ?? val.getName();
	}
	public function getShortLabel(val:ET):String {
		return shortLabels[val] ?? val.getName();
	}
	
	public function new(name:String, field:FancyField<T, FT>, et:Enum<ET>) {
		super(name, field);
		this.type = et;
	}
}