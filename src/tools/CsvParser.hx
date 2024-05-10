package tools;
using StringTools;

class CsvParser {
	public static function parse(str:String):Array<Array<String>> {
		str = str.replace("\r", "");
		var row = [];
		var table = [row];
		
		var quote = false;
		
		var pos = 0;
		var len = str.length;
		
		var buf = new StringBuf();
		var start = 0;
		var __flush_till:Int;
		inline function flush(till:Int) {
			__flush_till = till;
			if (__flush_till > start) buf.addSub(str, start, __flush_till - start);
		}
		
		while (pos < len) {
			var c = str.fastCodeAt(pos++);
			switch (c) {
				case '"'.code:
					flush(pos - 1);
					if (quote) {
						if (pos < len && str.fastCodeAt(pos) == '"'.code) {
							buf.addChar('"'.code);
							pos += 1;
						} else quote = false;
					} else quote = true;
					start = pos;
				case ','.code if (!quote):
					flush(pos - 1);
					row.push(buf.toString());
					buf = new StringBuf();
					start = pos;
				case '\n'.code if (!quote):
					flush(pos - 1);
					row.push(buf.toString());
					buf = new StringBuf();
					row = [];
					table.push(row);
					start = pos;
			}
		}
		flush(pos);
		row.push(buf.toString());
		
		// trailing linebreak?
		var last = table.length - 1;
		if (table[last].length == 1 && table[last][0] == "") table.pop();
		
		return table;
	}
}