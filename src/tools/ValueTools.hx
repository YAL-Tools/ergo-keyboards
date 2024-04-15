package tools;
import js.Lib;
import js.Syntax;

/**
 * ...
 * @author YellowAfterlife
 */
class ValueTools {
	public static function copy(val:Any, ?depth:Int) {
		if (depth == null) depth = 0; else depth += 1;
		if (val == null) return val;
		if (Reflect.isEnumValue(val)) {
			if ((val:EnumValue).getParameters().length > 0) throw "todo!";
			return val;
		}
		if (val is String || val is Float) return val;
		if (val is Array) {
			return [for (i => item in (val:Array<Any>)) copy(item, depth)];
		}
		if (Reflect.isObject(val)) {
			var obj:Any = {};
			for (fd in Reflect.fields(val)) {
				var sub = Reflect.field(val, fd);
				sub = copy(sub, depth);
				Reflect.setField(obj, fd, sub);
			}
			return obj;
		}
		throw "todo!";
	}
}