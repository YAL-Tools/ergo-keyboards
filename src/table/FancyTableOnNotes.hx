package table;
import js.html.Element;

/**
 * ...
 * @author YellowAfterlife
 */
abstract FancyTableOnNotes(FancyTableOnNotesImpl)
	from FancyTableOnNotesImpl
	to FancyTableOnNotesImpl
{
	@:from public static function fromSimple(fn:Element->Void):FancyTableOnNotes {
		return function(el, _) {
			fn(el);
		}
	}
	public var call(get, never):FancyTableOnNotesImpl;
	inline function get_call() {
		return this;
	}
}
typedef FancyTableOnNotesImpl = Element->Bool->Void;