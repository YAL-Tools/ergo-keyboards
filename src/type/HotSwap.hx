package type;

/**
 * ...
 * @author YellowAfterlife
 */
abstract HotSwap(HotSwapBase) from HotSwapBase to HotSwapBase {
	@:from public static function fromBool(b:Null<Bool>):HotSwap {
		return switch (b) {
			case null: Unspecified;
			case true: Yes;
			case false: No;
		}
	}
}
enum HotSwapBase {
	Unspecified;
	No;
	Yes;
}