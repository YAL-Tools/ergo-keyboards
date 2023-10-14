package tools;
import haxe.macro.Context;
import haxe.macro.Expr;

/**
 * ...
 * @author YellowAfterlife
 */
class StringAccess {
	public static macro function build():Array<Field> {
		var fields:Array<Field> = Context.getBuildFields();
		var newFields = fields.copy();
		for (field in fields) {
			if (field.access != null && field.access.contains(AStatic)) continue;
			var name = field.name;
			switch (field.kind) {
				case FVar(_t, null):
					var t:ComplexType = _t;
					var getter = "get_" + name;
					var setter = "set_" + name;
					field.kind = FProp("get", "set", t, null);
					for (nf in (macro class Tmp {
						private inline function $getter():$t {
							return js.Syntax.code('{0}[{1}]', this, $v{name});
						}
						private inline function $setter(v:$t):$t {
							js.Syntax.code('{0}[{1}] = {2}', this, $v{name}, v);
							return v;
						}
					}).fields) newFields.push(nf);
				case FFun(_f):
					var fun:Function = _f;
					if (fun.expr != null) continue;
					var args = [for (arg in fun.args) macro $i{arg.name}];
					var funExpr = macro js.Syntax.code('{0}[{1}]', this, $v{name});
					var callExpr = macro $funExpr($a{args});
					switch (fun.ret) {
						case null: {};
						case macro:Void: {};
						default: callExpr = macro return $callExpr;
					}
					fun.expr = callExpr;
					field.access.push(AInline);
				default: continue;
			};
		}
		return newFields;
	}
}