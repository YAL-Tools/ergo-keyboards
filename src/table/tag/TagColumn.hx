package table.tag;
import js.html.Element;
import table.tag.TagLikeColumnTools;
import type.Keyboard;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class TagColumn<KB:Keyboard, ET:EnumValue> extends TagColumnBase<KB, ET, ET> {
	public function new(name:String, field:FancyField<KB, ET>, et:Enum<ET>) {
		super(name, field, et);
	}
	// shared:
	override public function buildValue(out:Element, kb:KB):Void {
		TagLikeColumnTools.buildSingleValue(this, out, kb);
	}
	override function buildUsedValues() {
		TagLikeColumnTools.buildUsedValues(this, usedValues);
	}
	
	override public function matchesFilter(kb:KB):Bool {
		return TagLikeColumnTools.matchesFilters(this, kb);
	}
	
	override public function getVisibleTagNamesForLegends():Array<String> {
		return TagLikeColumnTools.getVisibleTagNamesForLegends(this);
	}
	
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		TagLikeColumnTools.buildEditor(this, out, store, restore);
	}
	
	override public function save(kb:KB):Void {
		TagLikeColumnTools.save(this, kb);
	}
	override public function load(kb:KB):Void {
		TagLikeColumnTools.load(this, kb);
	}
}
