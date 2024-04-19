package table.tag;

class StringTagColumnBase<T, V> extends TagLikeColumnBase<T, String, V> {
	public var tags:Array<String>;
	//
	public var filterLabels:Map<String, String> = new Map();
	public var shortLabels:Map<String, String> = new Map();
	
	public function new(name:String, field:FancyField<T, V>, tags:Array<String>) {
		super(name, field);
		this.tags = tags;
	}
	public function getDefaultTag():String {
		return null;
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
	//
	public function getFilterLabel(val:String):String {
		return filterLabels[val] ?? val;
	}
	public function getShortLabel(val:String):String {
		return shortLabels[val] ?? val;
	}
	//
	public var usedValues:Map<String, Bool> = new Map();
	override public function showInFilters(val:String):Bool {
		return usedValues.exists(val);
	}
}