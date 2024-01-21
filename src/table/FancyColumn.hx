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
class FancyColumn<T> {
	public var table:FancyTable<T> = null;
	public var name:String;
	public var filterName:String = null;
	public var shortName:String = null;
	public var onNotes:Element->Void = null;
	public var onEditorNotes:Element->Void = null;
	public var show = true;
	public var canShow = true;
	public var canFilter = true;
	public var canEdit = true;
	public var wantFilter = false;
	
	public var showCheckbox:InputElement = null;
	public var filterCheckbox:InputElement = null;
	
	/** Shown if keyboard doesn't have this value specified. */
	public var nullCaption:String = "";
	public function new(name:String) {
		this.name = name;
	}
	public function getId():String {
		return name;
	}
	public function buildValue(out:Element, kb:T):Void {
		
	}
	public function buildFilter(out:Element):Void {
		
	}
	public function buildEditor(out:Element, store:Array<T->Void>, restore:Array<T->Void>):Void {
		
	}
	public function matchesFilter(kb:T):Bool {
		return true;
	}
	public function saveFilterParams(obj:DynamicAccess<String>):Void {
		
	}
	public function loadFilterParams(obj:DynamicAccess<String>):Bool {
		return false;
	}
	
	public var canSort = false;
	public function compareKeyboards(a:T, b:T, ascending:Bool):Int {
		return 0;
	}
	// if saving/loading requires preprocessing, these two should apply/undo that
	public function save(kb:T):Void {
		
	}
	public function load(kb:T):Void {
		
	}
}
