package type;
import type.KeySpacing;
import type.StaggerType;
import type.*;
import type.ValList;

/**
 * @author YellowAfterlife
 */
typedef Keyboard = {>NamedThing,
	?parent:String,
	?hidden:Bool,
	?keys:NumRangeList<Int>,
	
	?shape:ValList<Shape>,
	?stagger:ValList<StaggerType>,
	?connection:ValList<Connection>,
	
	?hotswap:ValList<HotSwap>,
	?switchProfile:ValList<SwitchProfile>,
	?switchForce:ValList<Int>,
	?switchKind:ValList<SwitchKind>,
	?keySpacing:ValList<KeySpacing>,
	
	?encoders:IntRange,
	?encoderType:ValList<EncoderType>,
	
	?pointingDevices:IntRange,
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
	?navCluster:ValList<NavCluster>,
	?numpad:ValList<Numpad>,
	
	?wristPads:ValList<WristPads>,
	?tenting:ValList<Tenting>,
	?tilt:IntRange,
	?caseType:ValList<CaseType>,
	?extras:ValList<String>,
	
	// controller stuff
	?ctlCount:IntRange,
	?ctlFootprint:ValList<String>,
	?ctlPinCount:IntRange,
	?ctlName:ValList<String>,
	
	?firmware:ValList<Firmware>,
	?software:ValList<Software>,
	
	?web:ValList<String>,
	?source:ValList<String>,
	?kit:ValList<String>,
	?prebuilt:ValList<String>,
	?layoutRef:ValList<String>,
	
	?assembly:ValList<Assembly>,
	?lighting:ValList<Lighting>,
}