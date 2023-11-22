package table;
import js.html.Element;

/**
 * ...
 * @author YellowAfterlife
 */
class StringTagColumn<T> extends TagLikeColumnBase<T, String, String> {
	public var defaultValue:String = null;
	public var tags:Array<String>;
	public function new(name:String, field:FancyField<T, String>, tags:Array<String>) {
		super(name, field);
		this.field = field;
		this.tags = tags;
	}
	
	function getValue(item:T) {
		return field.access(item) ?? defaultValue;
	}
	public function getDefaultTag():String {
		return defaultValue;
	}
	public function getTagNames():Array<String> {
		return tags;
	}
	public function tagToIndex(val:String):Int {
		return tags.indexOf(val);
	}
	public function tagToName(val:String):String {
		return val;
	}
	public function indexToTag(ind:Int):String {
		return tags[ind];
	}
	public function nameToTag(name:String):String {
		return tags.contains(name) ? name : null;
	}
	public function getFilterLabel(val:String):String {
		return val;
	}
	public function getShortLabel(val:String):String {
		return val;
	}
	
	override public function matchesFilter(item:T):Bool {
		if (filterTags.length == 0) return true;
		var val = getValue(item);
		switch (filterMode) {
			case AnyOf: return filterTags.contains(val);
			case NoneOf: return !filterTags.contains(val);
			default: return true;
		}
	}
	
	override public function buildValue(out:Element, item:T):Void {
		TagLikeColumnTools.buildSingleValue(this, out, item);
	}
}