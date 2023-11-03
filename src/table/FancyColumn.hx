package table;
import haxe.DynamicAccess;
import js.html.DivElement;
import js.html.Element;
import js.html.InputElement;
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
	public var onNotes:Element->Void = null;
	public var show = true;
	public var canFilter = true;
	public var wantFilter = false;
	
	public var filterCheckbox:InputElement = null;
	
	/** Shown if keyboard doesn't have this value specified. */
	public var nullCaption:String = "";
	public function new(name:String) {
		this.name = name;
	}
	public function getId():String {
		return name;
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
	public function saveFilterParams(obj:DynamicAccess<String>):Void {
		
	}
	public function loadFilterParams(obj:DynamicAccess<String>):Bool {
		return false;
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
