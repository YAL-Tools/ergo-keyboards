package table.tag;
import type.*;
import js.html.Element;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class TagListColumn<KB, ET:EnumValue> extends TagColumnBase<KB, ET, ValList<ET>> {
	public function new(name:String, field:FancyField<KB, ValList<ET>>, et:Enum<ET>) {
		super(name, field, et);
		defaultValue = et.createByIndex(0);
		isMulti = true;
	}
	// shared:
	override public function buildValue(out:Element, kb:KB):Void {
		TagLikeListColumnTools.buildValue(this, out, kb);
	}
	override function buildUsedValues() {
		TagLikeListColumnTools.buildUsedValues(this, usedValues);
	}
	
	override public function matchesFilter(kb:KB):Bool {
		return TagLikeListColumnTools.matchesFilter(this, kb);
	}
	
	override public function getVisibleTagNamesForLegends():Array<String> {
		return TagLikeListColumnTools.getVisibleTagNamesForLegends(this);
	}
	
	override public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		TagLikeListColumnTools.buildEditor(this, out, store, restore);
	}
	
	override public function save(kb:KB):Void {
		TagLikeListColumnTools.save(this, kb);
	}
	override public function load(kb:KB):Void {
		TagLikeListColumnTools.load(this, kb);
	}
}