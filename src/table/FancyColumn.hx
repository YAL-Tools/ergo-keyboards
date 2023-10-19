package table;
import js.html.DivElement;
import js.html.Element;
import type.IntRange;
import type.Keyboard;
import js.Browser.*;
using tools.HtmlTools;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyColumn<KB:Keyboard> {
	public var table:FancyTable<KB> = null;
	public var name:String;
	public var filterName:String = null;
	public var shortName:String = null;
	public var notes:DivElement = null;
	public var show = true;
	public var canFilter = true;
	public var wantFilter = false;
	public var filterPrefix:String = null;
	
	/** Shown if keyboard doesn't have this value specified. */
	public var nullCaption:String = "";
	public function new(name:String) {
		this.name = name;
		notes = document.createDivElement();
	}
	public function buildValue(out:Element, kb:KB):Void {
		
	}
	public function buildFilter(out:Element):Void {
		
	}
	public function buildEditor(out:Element, store:Array<KB->Void>, restore:Array<KB->Void>):Void {
		
	}
	public function matchesFilter(kb:KB):Bool {
		return true;
	}
	
	public var canSort = false;
	public function compareKeyboards(a:KB, b:KB, ascending:Bool):Int {
		return 0;
	}
	// if saving/loading requires preprocessing, these two should apply/undo that
	public function save(kb:KB):Void {
		
	}
	public function load(kb:KB):Void {
		
	}
}
