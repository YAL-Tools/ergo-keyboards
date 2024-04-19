package type;
import table.tag.TagListColumn;
import table.FancyField;

/**
 * ...
 * @author YellowAfterlife
 */
enum SwitchProfile {
	Unknown;
	AnyHP;
	AnyLP;
	MX;
	Choc;
	ChocV2;
	ChocMini;
	KXSwitch;
	Alps;
	GateronLP;
	OutemuLP;
	CherryULP;
	Optical;
	Topre;
	Simple;
	SimpleLP;
	Other;
}
class SwitchProfileTools {
	public static function isHP(p:SwitchProfile) {
		return switch (p) {
			case AnyHP: true;
			case MX: true;
			case Alps: true;
			case Optical: true;
			case Topre: true;
			case Simple: true;
			default: false;
		}
	}
	public static function isLP(p:SwitchProfile) {
		return switch (p) {
			case AnyLP: true;
			case Choc: true;
			case ChocV2: true;
			case ChocMini: true;
			case KXSwitch: true;
			case GateronLP: true;
			case OutemuLP: true;
			case CherryULP: true;
			case SimpleLP: true;
			default: false;
		}
	}
}
class SwitchProfileColumn<KB:Keyboard> extends TagListColumn<KB, SwitchProfile> {
	override public function showInFilters(val:SwitchProfile):Bool {
		return switch (val) {
			case AnyLP, AnyHP: true;
			default: super.showInFilters(val);
		}
	}
	override public function tagsContain(tags:Array<SwitchProfile>, tag:SwitchProfile):Bool {
		switch (tag) {
			case AnyHP:
				for (val in tags) {
					if (SwitchProfileTools.isHP(val)) return true;
				}
				return false;
			case AnyLP:
				for (val in tags) {
					if (SwitchProfileTools.isLP(val)) return true;
				}
				return false;
			default:
				return super.tagsContain(tags, tag);
		}
	}
}