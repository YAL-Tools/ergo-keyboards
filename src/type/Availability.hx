package type;

import js.html.Element;
import table.tag.TagListColumn;

/**
 * ...
 * @author 
 */
enum Availability {
	OpenSource;
	Kit;
	PreBuilt;
	BuildGuide;
	LayoutRef;
}
class AvailabilityColumn<T> extends TagListColumn<T, Availability> {
	public var onBuildValue:(out:Element, item:T)->Void;
	override function buildValue(out:Element, item:T) {
		onBuildValue(out, item);
	}
}