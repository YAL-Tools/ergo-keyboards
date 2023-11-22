package table;

using tools.HtmlTools;
import externs.Tippy;
import externs.TippyOptions;
import table.FancyTable;
import js.Browser.*;
import js.html.Element;
import js.html.InputElement;

/**
 * ...
 * @author YellowAfterlife
 */
class FancyTableControls {
	public static function clearFilters<T>(table:FancyTable<T>, divFilters:Element) {
		var cbs:Array<InputElement> = divFilters.querySelectorAllAutoArr("input.cb-filter");
		var update = false;
		table.canUpdateFilters = false;
		for (el in cbs) {
			if (el.checked) {
				update = true;
				el.checked = false;
				el.triggerChange();
			}
		}
		table.canUpdateFilters = true;
		if (update) table.updateFilters();
	}
	public static function createShareButton<T>(table:FancyTable<T>, btShare:InputElement) {
		var shareOpt = new TippyOptions();
		shareOpt.trigger = "manual";
		shareOpt.content = "Copied!";
		var shareTippy = Tippy.bind(btShare, shareOpt);
		var shareTippyHide:Int = 0;
		btShare.onclick = function() {
			var search = table.saveFilters();
			var url = table.baseURL + search;
			function fallback() {
				window.prompt("Failed to copy - here's your link:", url);
			}
			try {
				navigator.clipboard.writeText(url).catchError(function(e) {
					console.error("Failed to copy", e);
					fallback();
				}).then(function(_) {
					shareTippy.show();
					if (shareTippyHide != 0) {
						window.clearTimeout(shareTippyHide);
					}
					shareTippyHide = window.setTimeout(function() {
						shareTippyHide = 0;
						shareTippy.hide();
					}, 1200);
				});
			} catch (x:Dynamic) {
				console.error("Failed to copy", x);
				fallback();
			}
		}
	}
}