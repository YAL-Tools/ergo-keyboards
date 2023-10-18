package tools;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.TypeTools;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableMacro {
	#if macro
	static function exprToGetter(expr:Expr) {
		switch (expr.expr) {
			case EField(e, field, kind):
				var fdx = { expr: EField(macro q, field, kind), pos: expr.pos };
				var fx = macro @:pos(expr.pos) function(q, ?wantSet, ?setValue) {
					if (wantSet) {
						$fdx = setValue;
						return null;
					} else return $fdx;
				}
				var f = switch (fx.expr) {
					case EFunction(_, _f): _f;
					default: throw "?";
				}
				var ctxType = Context.typeExpr(e).t.toComplexType();
				var valType = Context.typeExpr(expr).t.toComplexType();
				f.args[0].type = ctxType;
				f.args[1].type = macro:Bool;
				f.args[2].type = macro:Null<$valType>;
				f.ret = macro:Null<$valType>;
				return fx;
			default:
				throw "no";
		}
	}
	#end
	/** mgf(kb.x) => `function(kb) return kb.x` */
	public static macro function mgf(fd:Expr) {
		return exprToGetter(fd);
	}
	public static macro function mAddColumn(call:Expr) {
		switch (call.expr) {
			case ECall(e, params):
				params[1] = exprToGetter(params[1]);
			case ENew(t, params):
				params[1] = exprToGetter(params[1]);
				call = macro addColumn($call);
			case EBinop(OpAssign, e1, _.expr => ENew(_, params)):
				params[1] = exprToGetter(params[1]);
				call = macro addColumn($call);
			default: throw "?";
		}
		return call;
	}
	public static macro function mcrIntColumn(title:Expr, expr:ExprOf<Int>) {
		var getter = exprToGetter(expr);
		return macro addIntColumn($title, $getter);
	}
}