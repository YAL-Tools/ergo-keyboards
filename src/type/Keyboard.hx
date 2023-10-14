package type;
import type.KeySpacing;
import type.StaggerType;
import type.*;
import type.ValList;

/**
 * @author YellowAfterlife
 */
typedef Keyboard = {
	name:String,
	?keys:IntRange,
	?img:String,
	?stagger:StaggerType,
	?connection:ValList<Connection>,
	
	?hotswap:HotSwap,
	?switchProfile:ValList<SwitchProfile>,
	?switchForce:ValList<Int>,
	?switchKind:ValList<SwitchKind>,
	?keySpacing:KeySpacing,
	
	?knobs:IntRange,
	?trackballs:IntRange,
	?trackballSize:Float,
	?trackpads:IntRange,
	?trackpadSize:Float,
	?dpads:IntRange,
	?navCluster:NavCluster,
	
	?firmware:ValList<Firmware>,
	?software:ValList<Software>,
	
	?web:ValList<String>,
	?source:ValList<String>,
	?kit:ValList<String>,
	?prebuilt:ValList<String>,
	
	?assembly:ValList<Assembly>,
}