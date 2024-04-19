package table.tag;
import type.*;
import js.html.Element;

class StringTagListColumn<T> extends StringTagColumnBase<T, Array<String>> {
	//
	override public function buildValue(out:Element, kb:T):Void {
		TagLikeListColumnTools.buildValue(this, out, kb);
	}
	override function buildUsedValues() {
		TagLikeListColumnTools.buildUsedValues(this, usedValues);
	}
	
	override public function matchesFilter(kb:T):Bool {
		return TagLikeListColumnTools.matchesFilter(this, kb);
	}
	
	override public function getVisibleTagNamesForLegends():Array<String> {
		return TagLikeListColumnTools.getVisibleTagNamesForLegends(this);
	}
	
	override public function buildEditor(out:Element, store:Array<T->Void>, restore:Array<T->Void>):Void {
		TagLikeListColumnTools.buildEditor(this, out, store, restore);
	}
	
	override public function save(kb:T):Void {
		TagLikeListColumnTools.save(this, kb);
	}
	override public function load(kb:T):Void {
		TagLikeListColumnTools.load(this, kb);
	}
}