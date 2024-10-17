package table;

import js.html.ScrollIntoViewOptions;
import js.html.InputElement;
import js.html.KeyboardEvent;
import js.html.Element;
using tools.HtmlTools;

class FancyTableEditorShortcuts {
	public static function bind(out:Element) {
		var inputQuery = 'input, textarea, select';
		function shortcutHandler(e:KeyboardEvent) {
			var input:InputElement = cast e.target;
			var isInput = input.tagName == "INPUT";
			var isCheckbox = isInput && input.type == "checkbox";
			var mode:FancyTableEditorShortcutsAction = switch (e.code) {
				case "PageUp": Prev;
				case "PageDown": Next;
				//
				case "ArrowUp" if (e.ctrlKey): Prev;
				case "ArrowDown" if (e.ctrlKey): Next;
				//
				case "ArrowUp" if (isCheckbox): CbUp;
				case "ArrowDown" if (isCheckbox): CbDown;
				case "ArrowLeft" if (isCheckbox): CbLeft;
				case "ArrowRight" if (isCheckbox): CbRight;
				default: return;
			}
			//
			var item = input.parentElement;
			var found = false;
			for (_ in 0 ... 8) {
				if (item.classList.contains("item")) {
					found = true;
					break;
				}
				item = item.parentElement;
			}
			if (!found) return;
			//
			function focusAndScrollIntoView(first:Element) {
				first.focus();
				var opt:ScrollIntoViewOptions = {};
				opt.behavior = SMOOTH;
				opt.block = NEAREST;
				first.scrollIntoView(opt);
			}
			switch (mode) {
				case Prev, Next: {
					e.preventDefault();
					var isPrev = mode == Prev;
					var adjItem = isPrev ? item.previousElementSibling : item.nextElementSibling;
					inline function focusFirstInAdjItem() {
						var first = adjItem.querySelector(inputQuery);
						if (first != null) focusAndScrollIntoView(first);
					}
					if (adjItem != null && adjItem.classList.contains("item")) {
						focusFirstInAdjItem();
						return;
					}
					var details = item.parentElement;
					var adjDetails = isPrev ? details.previousElementSibling : details.nextElementSibling;
					if (adjDetails == null || adjDetails.tagName != "DETAILS") return;
					adjItem = isPrev ? adjDetails.querySelector('.item:last-child') : adjDetails.querySelector('.item');
					if (adjItem != null) {
						focusFirstInAdjItem();
						return;
					}
				}
				case CbUp, CbDown, CbLeft, CbRight: {
					if (mode == CbLeft || mode == CbRight) {
						if (item.querySelector('.tag-options[column-count="2"]') == null) return;
					}
					//
					var inputs = item.querySelectorAllAutoArr(inputQuery, Element);
					var inputCount = inputs.length;
					var inputHalfC = Math.ceil(inputs.length / 2);
					var inputInd = inputs.indexOf(input);
					if (inputInd == -1) return; // ..?
					function adjustInputInd(delta) {
						var newInputInd = inputInd + delta;
						if (newInputInd < 0 || newInputInd >= inputCount) return;
						inputInd = newInputInd;
					}
					switch (mode) {
						case CbUp: adjustInputInd(-1);
						case CbDown: adjustInputInd(1);
						case CbLeft: adjustInputInd(-inputHalfC);
						case CbRight: adjustInputInd(inputHalfC);
						default:
					}
					if (inputInd < 0) inputInd += inputCount;
					if (inputInd >= inputCount) inputInd -= inputCount;
					focusAndScrollIntoView(inputs[inputInd]);
					e.preventDefault();
				};
			}
		}
		for (el in out.querySelectorEls(inputQuery)) {
			el.addEventListener("keydown", shortcutHandler);
		}
	}
}
enum FancyTableEditorShortcutsAction {
	Prev;
	Next;
	CbUp;
	CbDown;
	CbLeft;
	CbRight;
}