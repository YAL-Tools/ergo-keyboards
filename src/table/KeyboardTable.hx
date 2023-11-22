package table;
import type.Keyboard;
import js.Browser.*;
import js.lib.Object;

/**
 * ...
 * @author YellowAfterlife
 */
class KeyboardTable<KB:Keyboard> extends FancyTable<KB> {
	public function resolveParent(kb:KB) {
		var parentName = kb.parent;
		if (parentName == null) return;
		kb.parent = null;
		
		var parent = values.filter(ikb -> ikb.name == parentName)[0];
		if (parent == null) {
			console.error('Unknown parent "$parentName" in "${kb.name}"');
			return;
		}
		resolveParent(parent);
		
		// don't copy link lists to children:
		var tmp = Reflect.copy(parent);
		for (col in columns) if (col is LinkListColumn) {
			(cast col:LinkListColumn<KB>).field.access(tmp, true, null);
		}
		
		for (key in Object.keys(tmp)) {
			var val = Reflect.field(tmp, key);
			if (val == null) continue;
			if (Reflect.field(kb, key) != null) continue;
			Reflect.setField(kb, key, val);
		}
	}
	public function resolveParents() {
		for (kb in values) resolveParent(kb);
	}
}