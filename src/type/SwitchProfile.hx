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
	AnyMechanical;
	AnySimple;
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
	public static function isMech(p:SwitchProfile){
		return switch (p) {
			case Simple: false;
			case SimpleLP: false;
			default: true;
		}
	}
}
class SwitchProfileColumn<KB:Keyboard> extends TagListColumn<KB, SwitchProfile> {
	override public function showInFilters(val:SwitchProfile):Bool {
		return switch (val) {
			case AnyLP, AnyHP: true;
			case AnyMechanical, AnySimple: super.showInFilters(Simple) || super.showInFilters(SimpleLP);
			default: super.showInFilters(val);
		}
	}
	override public function tagsContain(tags:Array<SwitchProfile>, tag:SwitchProfile):Bool {
		inline function ifAny(fn:SwitchProfile-> Bool){
			var ret = false;
			for (val in tags) {
				if (fn(val)) { ret = true; break; }
			}
			return ret;
		}
		return switch (tag) {
			case AnyHP: ifAny(SwitchProfileTools.isHP);
			case AnyLP: ifAny(SwitchProfileTools.isLP);
			case AnyMechanical: ifAny(SwitchProfileTools.isMech);
			case AnySimple: !ifAny(SwitchProfileTools.isMech);
			default: super.tagsContain(tags, tag);
		}
	}
}