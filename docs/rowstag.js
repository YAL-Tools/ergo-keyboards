/**
 * ...
 * @author YellowAfterlife
 */

window.rowStagData = [
{
	"name": "PERIDUO-606",
	"img": "PD-606BUS-11650-01.webp",
	"notes": "Also see: a dozen other similarly-shaped Perixx keyboards",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wireless",
	"keys": 86,
	"rows": 5,
	"lshift": [
		"ANSI",
		"ISO"
	],
	"rshift": "RightCut",
	"enter": [
		"ANSI",
		"ISO"
	],
	"fnPos": "AfterLGui",
	"leftMods": 3,
	"rightMods": 3,
	"space": "Split",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"mouseWheel": "VerticalLR",
	"lighting": "None",
	"firmware": "Simple",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": [
		"![v:ANSI] https://perixx.com/products/11660",
		"![v:ISO] https://perixx.eu/products/11660",
	]
},
{
	"name": "Mokulua",
	"img": "Mokulua.webp",
	"notes": "Cuts one key per row but has 4 spare keys in the middle, so it works out..?",
	"shape": "Split",
	"stagger": "Row",
	"connection": "Wired",
	"keys": {
		"min": 68,
		"max": 70
	},
	"rows": 4,
	"dCols": -1,
	"lshift": "ANSI",
	"rshift": "LeftCut",
	"enter": "ANSI",
	"space": "Multi",
	"thumbKeys": 4,
	"leftMods": 3,
	"rightMods": {
		"min": 0,
		"max": 3
	},
	"navCluster": "Arrows",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Knob",
	"displays": {
		"min": 0,
		"max": 2
	},
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"kit": "!https://mechwild.com/product/mokulua/"
},
{
	"name": "Folding Keyboard A",
	"img": "protoarc-xk03.jpg",
	"notes": "This one's kind of splayed!",
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Row",
	"connection": "Bluetooth",
	"keys": 65,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "Normal",
	"enter": "ANSI",
	"space": "Split",
	"fnPos": "AfterLCtl",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Squished",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"lighting": "None",
	"firmware": "Simple",
	"caseType": "Included",
	"prebuilt": [
		"[v:ProtoArc] https://www.aliexpress.com/item/1005005943947299.html",
		"[v:ProtoArc] https://www.amazon.com/dp/B0CD76BFK2/",
		"[v:SeenDa] https://www.aliexpress.com/item/1005005978718648.html",
		"[v:Nulea] https://www.amazon.com/Nulea-Ergonomic-Rechargeable-Full-Size-Bluetooth/dp/B0BZTZSSJ7/"
	]
},
{
	"name": "Folding Keyboard B",
	"img": "Perixx-805E.webp",
	"notes": [
		"A slightly less fortunate specimen than the other one.",
		"Sold by many, but who makes these?"
	],
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Row",
	"connection": "Bluetooth",
	"keys": 64,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "Normal",
	"enter": "ANSI",
	"space": "Split",
	"fnPos": "AfterLCtl",
	"leftMods": 3,
	"rightMods": 1,
	"navCluster": "Squished",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"lighting": "None",
	"firmware": "Simple",
	"caseType": "Included",
	"prebuilt": [
		"[v:Perixx] https://perixx.com/products/ultra-portable-and-foldable-bluetooth-5-1-rechargeable-70-ergonomic-keyboard-scissor-keys",
		"[v:MoKo] https://www.amazon.com/MoKo-Ultra-Thin-Rechargeable-Compatible-Smartphones/dp/B07BNB6R7G",
		"[v:BOW A] https://www.aliexpress.com/item/1005006168174548.html",
		"[v:BOW B] https://www.aliexpress.com/item/1005005609260936.html",
		"[v:SeenDa] https://www.aliexpress.com/item/1005005429203001.html"
	]
},
{
	"name": "Kolibrimini",
	"img": "Kolibrimini.jpg",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 50,
	"rows": 3,
	"lshift": "ANSI",
	"rshift": "LeftCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"thumbKeys": 2,
	"leftMods": 2,
	"rightMods": 1,
	"navCluster": "Arrows",
	"hotswap": "No",
	"switchProfile": "MX",
	"lighting": "Underglow",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/kreme123/Kolibrimini"
},
{
	"name": "Adelheid",
	"img": "adelheid.jpg",
	"shape": "Unibody",
	"keys": 82,
	"rows": 5,
	"dCols": 1,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Short",
	"leftMods": 2,
	"rightMods": 1,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/floookay/adelheid"
},
{
	"name": "Bonsai",
	"img": "Bonsai.jpg",
	"shape": "Unibody",
	"keys": 83,
	"rows": 5,
	"dCols": 1,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Short",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "ThroughHole",
	"caseType": "Included",
	"source": "https://github.com/Retne01/Bonsai"
},
{
	"name": "Sesame",
	"img": "Sesame.jpg",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 65,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"leftMods": 2,
	"rightMods": 1,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "VIA",
	"assembly": "ThroughHole",
	"caseType": "Included",
	"source": "https://github.com/kb-elmo/sesame"
},
{
	"name": "Goldtouch V2",
	"img": "goldtouch-v2.jpg",
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Row",
	"connection": "Wired",
	"keys": 93,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "Split",
	"backspace": "Normal",
	"fnPos": "Elsewhere",
	"leftMods": 3,
	"rightMods": 3,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "Simple",
	"lighting": "None",
	"firmware": "Simple",
	"tenting": {
		"min": 0,
		"max": 30
	},
	"caseType": "Included",
	"prebuilt": [
		"![v:PC] https://shop.goldtouch.com/collections/ergonomic-keyboards/products/goldtouch-v2-adjustable-comfort-keyboard-pc-only",
		"![v:PC/Mac] https://shop.goldtouch.com/collections/ergonomic-keyboards/products/goldtouch-v2-adjustable-comfort-keyboard-pc-and-mac-compatible-usb",
		"![v:all] https://shop.goldtouch.com/collections/ergonomic-keyboards"
	]
},
{
	"name": "Dygma Raise",
	"img": "dygma-raise.jpg",
	"notes": "(image from IGN review)",
	"shape": "Split",
	"connection": "Wired",
	"keys": 68,
	"rows": 4,
	"lshift": [
		"ANSI",
		"ISO"
	],
	"rshift": "Normal",
	"enter": [
		"ANSI",
		"ISO"
	],
	"space": "Multi",
	"thumbKeys": 4,
	"leftMods": 3,
	"rightMods": 4,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"lighting": "RGB",
	"firmware": "Custom",
	"software": "Custom",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": "https://dygma.com/products/dygma-raise"
},
{
	"name": "cool844",
	"img": "cool844.jpg",
	"shape": "Unibody",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"lshift": "ANSI",
	"rshift": "LeftCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Normal",
	"leftMods": 2,
	"rightMods": 0,
	"navCluster": "Arrows",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "Remap",
	"caseType": "Included",
	"source": "https://github.com/telzo2000/cool844V2"
},
{
	"name": "Keychron K11",
	"img": "keychron-k11.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 68,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "Multi",
	"thumbKeys": 2,
	"leftMods": 3,
	"rightMods": 1,
	"navCluster": "Arrows",
	"hotswap": [
		"No",
		"Yes"
	],
	"switchProfile": "GateronLP",
	"encoders": 1,
	"lighting": [
		"Simple",
		"RGB"
	],
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"prebuilt": "https://www.keychron.com/products/keychron-k11-pro-alice-layout-qmk-via-wireless-custom-mechanical-keyboard"
},
{
	"name": "Keychron K15",
	"img": "keychron-k15.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 89,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Inline",
	"hotswap": [
		"No",
		"Yes"
	],
	"switchProfile": "GateronLP",
	"encoders": 1,
	"lighting": [
		"Simple",
		"RGB"
	],
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"prebuilt": "https://www.keychron.com/products/keychron-k15-pro-alice-layout-qmk-via-wireless-custom-mechanical-keyboard"
},
{
	"name": "Libra Mini",
	"img": "libra-mini.jpg",
	"notes": "Joystick acts as 4 keys",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"lshift": "ANSI",
	"rshift": "LeftCut",
	"enter": "ANSI",
	"space": "SplitDistinct",
	"backspace": "Normal",
	"thumbKeys": 2,
	"leftMods": {
		"min": 2,
		"max": 3
	},
	"rightMods": {
		"min": 2,
		"max": 3
	},
	"navCluster": "Arrows",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"trackpoints": {
		"min": 0,
		"max": 1
	},
	"firmware": "QMK",
	"software": "VIA",
	"tenting": 5,
	"caseType": "Included",
	"kit": "https://gcustomcables.com/products/libra-mini-keyboard-kit"
},
{
	"name": "Cloud Nine ErgoTKL",
	"img": "ergotkl.webp",
	"shape": "Split",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 89,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinct",
	"backspace": "Normal",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"lighting": "RGB",
	"firmware": "Custom",
	"software": "Custom",
	"wristPads": "Integrated",
	"tenting": 7,
	"caseType": "Included",
	"prebuilt": "https://cloudnineergo.com/products/cloud-nine-ergotkl-ergonomic-split-mechanical-keyboard"
},
{
	"name": "La Lettre",
	"img": "la-lettre.jpg",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 34,
	"rows": 3,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"space": "SplitDistinct",
	"backspace": "Short",
	"leftMods": 1,
	"rightMods": 1,
	"enter": "Mini",
	"leftMods": 0,
	"rightMods": 0,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/somepin/la-lettre"
},
{
	"name": "Matias Ergo Pro",
	"img": "matias-ergo-pro.jpg",
	"shape": "Split",
	"connection": "Wired",
	"keys": {
		"min": 87,
		"max": 89
	},
	"rows": 5,
	"lshift": [
		"ANSI",
		"ISO"
	],
	"rshift": "Normal",
	"enter": [
		"ANSI",
		"ISO"
	],
	"space": "SplitDistinct",
	"backspace": "Normal",
	"leftMods": 3,
	"rightMods": 1,
	"navCluster": [
		"Squished",
		"Inline"
	],
	"hotswap": "No",
	"switchProfile": "MX",
	"lighting": "None",
	"firmware": "Custom",
	"wristPads": "Detachable",
	"caseType": "Included",
	"prebuilt": "https://matias.store/collections/all/ergo-pro"
},
{
	"name": "Red Herring",
	"img": "red-herring.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": {
		"min": 86,
		"max": 89
	},
	"rows": 5,
	"lshift": [
		"ANSI",
		"ISO"
	],
	"rshift": [
		"Normal",
		"LeftCut"
	],
	"enter": [
		"ANSI",
		"ISO"
	],
	"space": "Multi",
	"backspace": [
		"Normal",
		"Short"
	],
	"thumbKeys": 3,
	"leftMods": 4,
	"rightMods": 3,
	"navCluster": "Inline",
	"hotswap": [
		"No",
		"Yes"
	],
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"displays": 1,
	"firmware": "QMK",
	"software": "Vial",
	"assembly": "ThroughHole",
	"wristPads": "Detachable",
	"caseType": "Included",
	"source": "https://github.com/dcpedit/redherring"
},
{
	"name": "Qazikat",
	"img": "qazikat.jpg",
	"notes": "Plenty of options on one PCB, including katana stagger.",
	"shape": "Monoblock",
	"stagger": "Row",
	"connection": "Wired",
	"keys": {
		"min": 38,
		"max": 41
	},
	"rows": 3,
	"lshift": "ANSI",
	"rshift": "None",
	"enter": [
		"ANSI",
		"ISO"
	],
	"space": [
		"Normal",
		"SplitDistinctFn",
		"Multi"
	],
	"backspace": "Short",
	"thumbKeys": {
		"min": 1,
		"max": 2
	},
	"leftMods": 2,
	"rightMods": 0,
	"navCluster": "Arrows",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/weteor/Qazikat"
},
{
	"name": "Kensington Pro Fit",
	"img": "kensington-pro-fit.jpg",
	"notes": "Just a regular cheap unibody keyboard. What did you expect?",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Bluetooth",
		"Wireless"
	],
	"keys": 108,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "Normal",
	"enter": "ANSI",
	"space": "Split",
	"backspace": "Normal",
	"fnPos": "AfterLCtl",
	"leftMods": 3,
	"rightMods": 4,
	"navCluster": "Full",
	"numpad": "Full",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"lighting": "None",
	"firmware": "Simple",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": [
		"![v:wired] https://www.kensington.com/p/products/electronic-control-solutions/wireless-ergonomic-keyboards/pro-fit-ergo-wired-keyboard/",
		"![v:wireless] https://www.kensington.com/p/products/electronic-control-solutions/wireless-ergonomic-keyboards/pro-fit-ergo-wireless-keyboard/"
	]
},
{
	"name": "BC Split Ergonomic Keyboard",
	"img": "BC-Split-Ergonomic-Keyboard.jpg",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 89,
	"rows": 5,
	"lshift": "ISO",
	"rshift": "Normal",
	"enter": "ISO",
	"space": "Split",
	"backspace": "Normal",
	"fnPos": "BeforeRCtl",
	"leftMods": 3,
	"rightMods": 3,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"lighting": "None",
	"firmware": "Simple",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": "!https://www.backcs.co.uk/bc-split-ergonomic-keyboard/"
},
{
	"name": "Sesame",
	"img": "sesame.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"keys": 65,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Normal",
	"leftMods": 2,
	"rightMods": 2,
	"hotswap": "No",
	"switchProfile": "MX",
	"assembly": "ThroughHole",
	"caseType": "Included",
	"source": "https://github.com/kb-elmo/sesame",
	"kit": "https://mechboards.co.uk/collections/kits/products/sesame-kit",
	"prebuilt": "https://mechboards.co.uk/collections/pre-builds/products/sesame-kit-pre-built"
},
null
];
/* TODO
https://www.amazon.com/RK-ROYAL-KLUDGE-Bluetooth-Mechanical/dp/B0C88RR3CM?th=1
https://epomaker.com/products/feker-alice98
*/