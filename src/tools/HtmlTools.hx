package tools;
import haxe.DynamicAccess;
import haxe.Json;
import haxe.Rest;
import js.html.*;
import haxe.extern.EitherType;
import js.Browser;

/**
 * ...
 * @author YellowAfterlife
 */
class HtmlTools {
	public static inline function getElementByIdAuto<T:Element>(doc:Document, id:String, ?c:Class<T>):T {
		return cast doc.getElementById(id);
	}
	
	private static inline function asElement(el:EitherType<Document, Element>):Element {
		return cast el;
	}
	
	public static inline function querySelectorEls(el:EitherType<Document, Element>, selectors:String):ElementList {
		return cast asElement(el).querySelectorAll(selectors);
	}
	public static inline function querySelectorAllAuto<T:Element>(el:EitherType<Document, Element>, selectors:String, ?c:Class<T>):ElementListOf<T> {
		return cast asElement(el).querySelectorAll(selectors);
	}
	public static function querySelectorAllAutoArr<T:Element>(el:EitherType<Document, Element>, selectors:String, ?c:Class<T>):Array<T> {
		var elist = querySelectorAllAuto(el, selectors, c);
		return [for (el in elist) el];
	}
	public static inline function querySelectorAuto<T:Element>(
		el:EitherType<Document, Element>, selectors:String, ?c:Class<T>
	):T {
		return cast asElement(el).querySelector(selectors);
	}
	
	public static inline function appendTextNode(e:Element, text:String) {
		e.appendChild(Browser.document.createTextNode(text));
	}
	public static inline function appendLineBreak(e:Element) {
		e.appendChild(Browser.document.createBRElement());
	}
	
	public static function appendDivTextNode(e:Element, text:String) {
		var div = Browser.document.createDivElement();
		div.appendChild(Browser.document.createTextNode(text));
		e.appendChild(div);
		return div;
	}
	public static function appendParaTextNode(e:Element, paras:Rest<String>) {
		var result:ParagraphElement = null;
		for (text in paras) {
			var p = Browser.document.createParagraphElement();
			p.appendChild(Browser.document.createTextNode(text));
			e.appendChild(p);
			if (result == null) result = p;
		}
		return result;
	}
	public static function appendElTextNode(e:Element, tag:String, text:String) {
		var p = Browser.document.createElement(tag);
		p.appendChild(Browser.document.createTextNode(text));
		e.appendChild(p);
		return p;
	}
	
	public static function addFieldChangeEventListener(e:Element, f:Event->Void) {
		e.addEventListener("change", f);
		e.addEventListener("keydown", function(e) {
			Browser.window.setTimeout(function() f(e));
		});
		e.addEventListener("keyup", f);
	}
	
	@:noUsing public static function createFilePicker(accept:String, fn:FilePickCallback<File>):InputElement {
		var form = Browser.document.createFormElement();
		form.classList.add("hidden");
		var picker = Browser.document.createInputElement();
		picker.type = "file";
		picker.accept = accept;
		form.appendChild(picker);
		var reset = function() form.reset();
		picker.onchange = function(_) {
			for (file in picker.files) {
				fn(file, reset);
				break;
			}
		}
		Browser.document.body.appendChild(form);
		return picker;
	}
	@:noUsing public static function createJsonPicker<T>(fn:T->Void):InputElement {
		return createFilePicker(".json", function(file:File, then:Void->Void) {
			var reader = new FileReader();
			reader.onload = function() {
				var text = reader.result;
				var json = try {
					Json.parse(text);
				} catch (x:Dynamic) {
					Browser.window.alert("Invalid JSON: " + x);
					return;
				}
				try {
					fn(json);
				} catch (x:Dynamic) {
					Browser.window.alert("Load error: " + x);
				}
				//then();
			};
			reader.onloadend = function() then();
			reader.readAsText(file);
		});
	}
	public static function createCheckboxElement(doc:HTMLDocument) {
		var cb = doc.createInputElement();
		cb.type = "checkbox";
		return cb;
	}
	
	@:noUsing public static inline function saveAs(data:Blob, name:String) {
		js.Syntax.code("window['saveAs']")(data, name);
	}
	@:noUsing public static function saveJsonAs(data:Any, name:String) {
		var text = Json.stringify(data, null, "\t");
		var blob = new Blob([text]);
		saveAs(blob, name);
	}
	
	public static function setAttributeFlag(el:Element, attr:String, val:Bool) {
		if (val) {
			if (!el.hasAttribute(attr)) el.setAttribute(attr, "");
		} else {
			if (el.hasAttribute(attr)) el.removeAttribute(attr);
		}
	}
	public static function setTokenFlag(tl:DOMTokenList, name:String, val:Bool) {
		if (tl.contains(name) != val) tl.toggle(name);
	}
	public static function setDisplayFlag(el:Element, visible:Bool):Void {
		el.style.display = visible ? "" : "none";
	}
	public static function triggerChange(el:Element):Void {
		el.dispatchEvent(new CustomEvent("change"));
	}
}
typedef FilePickCallback<T> = (file:T, then:Void->Void)->Void;
extern class ElementList implements ArrayAccess<Element> {
	public var length(default, never):Int;
	public function item(index:Int):Element;
}
extern class ElementListOf<T:Element> implements ArrayAccess<T> {
	public var length(default, never):Int;
	public function item(index:Int):T;
}