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
	
	?img:ValList<String>,
	?notes:ValList<String>,
	
	?shape:ValList<Shape>,
	?stagger:StaggerType,
	?connection:ValList<Connection>,
	
	?hotswap:HotSwap,
	?switchProfile:ValList<SwitchProfile>,
	?switchForce:ValList<Int>,
	?switchKind:ValList<SwitchKind>,
	?keySpacing:KeySpacing,
	
	?encoders:IntRange,
	?encoderType:ValList<EncoderType>,
	
	?trackballs:IntRange,
	/** in mm */
	?trackballSize:Float,
	
	?trackpads:IntRange,
	/** in mm */
	?trackpadSize:Float,
	
	/** aka "pointing sticks" */
	?trackpoints:IntRange,
	
	?dpads:IntRange,
	?dpadDirs:IntRange,
	
	?displays:IntRange,
	?navCluster:NavCluster,
	
	?wristPads:ValList<WristPads>,
	?tenting:IntRange,
	?tilt:IntRange,
	?caseType:ValList<CaseType>,
	?extras:ValList<String>,
	
	?firmware:ValList<Firmware>,
	?software:ValList<Software>,
	
	?web:ValList<String>,
	?source:ValList<String>,
	?kit:ValList<String>,
	?prebuilt:ValList<String>,
	
	?assembly:ValList<Assembly>,
	// TODO: palmrest and tenting
}