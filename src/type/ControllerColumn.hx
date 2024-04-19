package type;

import js.lib.RegExp;
import tools.CsvParser;
import table.tag.StringTagListColumn;
import js.Browser.*;
using StringTools;

class ControllerColumn<T> extends StringTagListColumn<T> {
	static final otherPrefix:String = "!";
	static final otherMatcher = new RegExp("^(.+),\\s*(!.+)$");
	override function showInFilters(val:String):Bool {
		return !val.startsWith(otherPrefix);
	}
	override function buildUsedValues() {
		if (tags != null) return;
		tags = [];
		var found = new Map();
		var hasOther = false;
		for (item in table.values) {
			var vals = field.access(item);
			if (vals == null) continue;
			for (val in vals) {
				if (val.startsWith(otherPrefix)) {
					hasOther = true;
					continue;
				}
				var vlq = val.toLowerCase();
				if (found.exists(vlq)) continue;
				found[vlq] = true;
				tags.push(val);
			}
		}
		if (hasOther && !tags.contains("Other")) tags.push("Other");
	}
	override function tagsContain(tags:Array<String>, tag:String):Bool {
		if (tag == "Other") {
			for (t in tags) {
				if (t.startsWith(otherPrefix)) return true;
			}
			return false;
		}
		return super.tagsContain(tags, tag);
	}
	override function getShortLabel(val:String):String {
		if (val.startsWith(otherPrefix)) return "Other";
		return super.getShortLabel(val);
	}
	override function getFilterLabel(val:String):String {
		if (val.startsWith(otherPrefix)) return val.substring(otherPrefix.length);
		return super.getFilterLabel(val);
	}
	override function getShortNotes(val:String):String {
		if (val.startsWith(otherPrefix)) return val.substring(otherPrefix.length);
		return null;
	}
	static function parseCsvItem(str:String) {
		if (str.trim() == "") return null;
		if (str.startsWith(otherPrefix)) {
			return [str];
		}
		var vals = [];
		var mt = otherMatcher.exec(str);
		var other = null;
		if (mt != null) {
			other = mt[2];
			str = mt[1];
		}
		for (part in str.split(",")) {
			part = part.trim();
			if (part != "") vals.push(part);
		}
		if (other != null) {
			vals.push(other);
		}
		return vals;
	}
	public static function initKeyboards<T:Keyboard>(table:KeyboardTable<T>) {
		var csv = CsvParser.parse((cast window).mcuData);
		csv.shift(); // remove header
		for (row in csv) {
			var name = row[0];
			var kb = table.values.filter(kb -> kb.name == name)[0];
			if (kb == null) {
				//console.log('MCU CSV refers to missing keyboard "$name"');
				continue;
			}
			//
			if (row[1] != "") kb.ctlCount ??= Std.parseInt(row[1]);
			//Treat ctlPinCount as an int
			if (row[3] != "") kb.ctlPinCount ??= Std.parseInt(row[3]);
			//
			for (i in 2 ... 5) {
				var vals = parseCsvItem(row[i]);
				if (vals == null) continue;
				switch (i) {
					case 2: kb.ctlFootprint ??= vals;
					//Treat ctlPinCount as string
					//case 3: kb.ctlPinCount ??= vals;
					case 4: kb.ctlName ??= vals;
				}
			}
		}
	}
}