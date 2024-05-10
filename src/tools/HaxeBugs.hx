package tools;

import type.StaggerType;

@:keep class HaxeBugs {
	static function dceEnthusiasm_1():Map<String, String> {
		return new Map();
	}
	static function dceEnthusiasm_2():Map<EnumValue, String> {
		return new Map();
	}
	@:keep static function dceEnthusiasm() {
		// https://github.com/HaxeFoundation/haxe/issues/11401 ?
		var a = dceEnthusiasm_1();
		a.get("");
		a.set("", "");
		a.exists("");
		var b = dceEnthusiasm_2();
		var e = StaggerType.Column;
		b.get(e);
		b.set(e, "");
		b.exists(e);
	}
	public static function ref() {
		
	}
}