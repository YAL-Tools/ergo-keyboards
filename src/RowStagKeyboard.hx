package ;
import type.*;
import type.ValList;
import type.row.*;
import haxe.extern.EitherType;

/**
 * ...
 * @author YellowAfterlife
 */
@:forward
abstract RowStagKeyboard(RowStagKeyboardBase)
from RowStagKeyboardBase to RowStagKeyboardBase {
	public function new(name:String, ?parent:EitherType<String, RowStagKeyboard>) {
		this = { name: name };
		if (parent == null) {
			//
		} else if (parent is String) {
			this.parent = parent;
		} else {
			this.parent = (parent:RowStagKeyboard).name;
		}
	}
}
typedef RowStagKeyboardBase = {> Keyboard,
	?rows:IntRange,
	?dCols:IntRange,
	?qCols:IntRange,
	?aCols:IntRange,
	?zCols:IntRange,
	
	// clusters:
	?lshift:ValList<LShiftShape>,
	?rshift:ValList<RShiftShape>,
	?enter:ValList<EnterShape>,
	?space:ValList<SpaceShape>,
	?backspace:ValList<BkspShape>,
	?extraRowKeys:ValList<ExtraRowKeys>,
	?thumbKeys:IntRange,
	?fnPos:FnPos,
	?leftMods:IntRange,
	?rightMods:IntRange,
	
	//
	?mouseWheel:ValList<MouseWheel>,
};
