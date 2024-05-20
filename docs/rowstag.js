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
	"backspace": "Wide",
	"fnPos": "Elsewhere",
	"leftMods": 3,
	"rightMods": 3,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "Simple",
	"lighting": "None",
	"firmware": "Simple",
	"tenting": ["Legs"],
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
	"prebuilt": "https://dygma.com/products/dygma-raise",
	"layoutRef": "https://support.dygma.com/hc/en-us/articles/15110448574621-How-can-I-visualize-the-Dygma-Defy-or-the-Dygma-Raise-on-my-desk",
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
	"backspace": "Wide",
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
	"backspace": "Wide",
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
	"tenting": "Fixed",
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
	"backspace": "Wide",
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
	"tenting": "Fixed",
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
	"backspace": "Wide",
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
		"Wide",
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
	"backspace": "Wide",
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
	"backspace": "Wide",
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
	"img": "sesame-1.webp",
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
	"rightMods": 2,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "VIA",
	"assembly": "ThroughHole",
	"caseType": "Included",
	"source": "https://github.com/kb-elmo/sesame",
	"kit": "https://mechboards.co.uk/collections/kits/products/sesame-kit",
	"prebuilt": "https://mechboards.co.uk/collections/pre-builds/products/sesame-kit-pre-built"
},
{
	"name": "Sally",
	"img": "sally.webp",
	"shape": "Split",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 59,
	"rows": 4,
	"qCols": -1,
	"aCols": -1,
	"zCols": -1,
	"lshift": "ANSI",
	"rshift": "None",
	"enter": "Mini",
	"space": "Multi",
	"backspace": "Short",
	"thumbKeys": 4,
	"leftMods": 0,
	"rightMods": 0,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "Unknown",
	"assembly": "Handwired",
	"source": "https://github.com/STRMSKY/sally"
},
{
	"name": "RK ROYAL KLUDGE RKS70",
	"img": "rk-royal-kludge.jpg",
	"notes": "Average-quality and surprisingly cheap",
	"shape": "Split",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Bluetooth",
		"Wireless"
	],
	"keys": 74,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinct",
	"leftMods": 3,
	"rightMods": 3,
	"navCluster": "Inline",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"lighting": "RGB",
	"firmware": "Custom",
	"software": "Custom",
	"wristPads": "Integrated",
	"prebuilt": [
		"!http://en.rkgaming.com/product/41/",
		"!https://www.amazon.com/RK-ROYAL-KLUDGE-Bluetooth-Mechanical/dp/B0C88WHV2W?th=1"
	]
},
{
	"name": "Feker Alice 98",
	"img": "feker-alice-98.webp",
	"notes": "A \"true\" Alice shape with aa slightly tented middle.",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Bluetooth",
		"Wireless"
	],
	"keys": {
		"min": 96,
		"max": 98
	},
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "Split",
	"backspace": "Wide",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Arrows",
	"numpad": "Full",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"displays": {
		"min": 0,
		"max": 1
	},
	"lighting": "RGB",
	"firmware": "Custom",
	"software": "Custom",
	"kit": "https://epomaker.com/products/feker-alice98",
	"prebuilt": "https://epomaker.com/products/feker-alice98"
},
{
	"name": "Saturn",
	"img": "saturn.jfif",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 41,
	"rows": 3,
	"qCols": -2,
	"aCols": -1,
	"zCols": 0,
	"lshift": "ANSI",
	"rshift": "Mini",
	"enter": "Mini",
	"space": "Multi",
	"thumbKeys": 3,
	"leftMods": 1,
	"rightMods": 2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"displays": {
		"min": 0,
		"max": 1
	},
	"caseType": "None",
	"source": "https://github.com/joshyeram/SaturnPioneerVoyager"
},
{
	"name": "Kinesis Freestyle 2",
	"img": "FS2-PC-cable-main.webp",
	"shape": "Split",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [94, 95],
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
	"space": "Split",
	"backspace": "Wide",
	"fnPos": "Elsewhere",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "Simple",
	"lighting": "None",
	"prebuilt": "https://kinesis-ergo.com/products/#freestyle2"
},
{
	"name": "Kinesis Freestyle Pro",
	"img": "FS2-PC-cable-main.webp",
	"shape": "Split",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 95,
		"max": 96
	},
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
	"space": "Split",
	"backspace": "Wide",
	"fnPos": "Elsewhere",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "MX",
	"lighting": "None",
	"prebuilt": "https://kinesis-ergo.com/shop/freestyle-pro/"
},
{
	"name": "PERIBOARD-335",
	"img": "periboard-335.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": "Wired",
	"keys": {
		"min": 91,
		"max": 92
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
	"space": "Split",
	"fnPos": "AfterLCtl",
	"leftMods": 3,
	"rightMods": 4,
	"navCluster": "Full",
	"hotswap": "No",
	"switchProfile": "Choc",
	"software": "Custom",
	"wristPads": "Integrated",
	"prebuilt": [
		"!https://perixx.com/products/px-ergonomic-mechanical-keyboard?variant=43501541916931",
		"!https://eu.perixx.com/collections/keyboards/products/perixx-ergo-mechanical-keyboard?variant=44205121634569"
	]
},
{
	"name": "PERIBOARD-524B",
	"img": "PERIBOARD-524B.webp",
	"notes": "Allegedly there's an ISO layout of this keyboard, but I could not find a photo of it.",
	"shape": "Split",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 86,
	"rows": 5,
	"lshift": [
		"ANSI",
		"ISO"
	],
	"rshift": "RightCut",
	"space": "Split",
	"backspace": "Wide",
	"fnPos": "AfterLCtl",
	"leftMods": 3,
	"rightMods": 3,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"firmware": "Simple",
	"prebuilt": [
		"!https://perixx.com/products/perixx-periboard-524b-us-wired-ergonomic-split-keyboard-adjustable-tilt-angle-low-profile-membrane-keys-black-us-english",
		"!https://eu.perixx.com/products/12286"
	]
},
{
	"name": "Goldtouch Go!2",
	"img": "Goldtouch-Go2.jpg",
	"shape": "Split",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 83,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "Split",
	"backspace": "Wide",
	"leftMods": 3,
	"rightMods": 3,
	"navCluster": "Arrows",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"lighting": "None",
	"firmware": "Simple",
	"prebuilt": [
		"!https://shop.goldtouch.com/collections/ergonomic-keyboards/products/goldtouch-go2-wired-mobile-keyboard-pc-mac",
		"!https://shop.goldtouch.com/collections/ergonomic-keyboards/products/goldtouch-go-2-foreign-language-bluetooth-wireless-mobile-keyboards"
	]
},
{
	"name": "Keychron Q11",
	"img": "Keychron-Q11.webp",
	"shape": "Split",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 89,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinct",
	"backspace": "Wide",
	"leftMods": 4,
	"rightMods": 3,
	"navCluster": "Inline",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"firmware": "QMK",
	"software": "VIA",
	"prebuilt": "!https://www.keychron.com/products/keychron-q11-qmk-custom-mechanical-keyboard"
},
{
	"name": "Keychron Q14",
	"img": "Keychron-Q14.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 104,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Wide",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Inline",
	"numpad": "Full",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 1,
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "VIA",
	"prebuilt": "!https://www.keychron.com/products/keychron-q14-pro-alice-layout-qmk-via-wireless-custom-mechanical-keyboard"
},
{
	"name": "FEKER Alice80",
	"img": "FEKER-Alice80.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": [
		"Wired",
		"Wireless"
	],
	"keys": 67,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Wide",
	"leftMods": 2,
	"rightMods": 2,
	"navCluster": "Inline",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"prebuilt": "!https://www.whatgeek.com/products/feker-alice-80-mechanical-keyboard"
},
{
	"name": "Cepstrum",
	"img": "Cepstrum.webp",
	"shape": "Split",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 80,
	"rows": 4,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Wide",
	"leftMods": 4,
	"rightMods": 4,
	"navCluster": "Inline",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"kit": "https://keeb.io/products/cepstrum-choc-low-profile-65-65xt-split-staggered-keyboard",
	"prebuilt": "https://keeb.io/products/cepstrum-keyboard-pre-built"
},
{
	"name": "Logitech K860",
	"img": "k860.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"connection": [
		"Bluetooth",
		"Wireless"
	],
	"keys": 110,
	"rows": 5,
	"lshift": "ANSI",
	"rshift": "Normal",
	"enter": "ANSI",
	"space": "Split",
	"backspace": "Wide",
	"fnPos": "ReplaceRGui",
	"leftMods": 3,
	"rightMods": 2,
	"navCluster": "Full",
	"numpad": "Full",
	"hotswap": "No",
	"switchProfile": "SimpleLP",
	"lighting": "None",
	"firmware": "Simple",
	"assembly": "PCB",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": "![v:wireless] https://www.logitech.com/en-us/products/keyboards/k860-split-ergonomic.920-009166.html"
},
{
	"name": "Arisu FT",
	"img": "arisu_ft.webp",
	"shape": "Unibody",
	"stagger": "Row",
	"keys": 67,
	"rows": 4,
	"dCols": 1,
	"lshift": "ANSI",
	"rshift": "RightCut",
	"enter": "ANSI",
	"space": "SplitDistinctFn",
	"backspace": "Short",
	"fnPos": "None",
	"leftMods": 2,
	"rightMods": 1,
	"navCluster": "Inline",
	"hotswap": "No",
	"switchProfile": "MX",
	"lighting": "None",
	"firmware": "QMK",
	"caseType": "Included",
	"prebuilt": "https://falbatech.click/products/Arisu-Unibody-Wooden-Ergonomic-Keyboard-p613843366"
},
{
	"name": "Majestouch Xacro M10SP",
	"img": ["Majestouch-Xacro-M10SP.webp", "Majestouch-Xacro-M10SP-ISO.webp"],
	"notes": "A 60%-ish keyboard with a pair of extra columns in the middle",
	"shape": "Split",
	"keys": [[72], [76]],
	"rows": 4,
	"dCols": 2,
	"qCols": 2,
	"aCols": 2,
	"zCols": 2,
	"lshift": "ANSI",
	"rshift": ["Normal", "LeftCut"],
	"enter": ["ANSI", "ISO"],
	"space": "Multi",
	"backspace": ["Wide", "Split"],
	"thumbKeys": 2,
	"leftMods": {"min": 3, "max": 4},
	"rightMods": {"min": 4, "max": 5},
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "Custom",
	"software": "Custom",
	"tenting": "Legs",
	"caseType": "Included",
	"prebuilt": [
		"[v:en] https://www.diatec.co.jp/en/xacro/m10sp.php",
		"[v:jp] https://diatec.co.jp/shop/xacro/m10sp.php"
	]
},
"2024-05-20"
];
window.rowStagTODOs = `
Various Alice boards https://www.reddit.com/r/ErgoMechKeyboards/comments/18nzira/budget_alice_keyboards/
Fourier https://github.com/keebio/fourier https://keeb.io/products/fourier-40-split-staggered-keyboard https://keebd.com/products/fourier-v1-3-40-split-staggered-keyboard-kit
https://github.com/JellyTitan/ErgoDonk-Zero
https://mechkeys.com/products/weikav-record-wired-alice-gasket-kit?rfsn=6645989.1d09ea&variant=44524032131295 https://kbd.news/Weikav-Record-Alice-review-2270.html
Hatsukey70 https://shop.yushakobo.jp/en/products/8361
Perixx PERIBOARD-613 B
BC Split Ergonomic
Kinesis Freestyle2
Core Mechanics Project: 0001
R-Go Split Break
Mistel keyboards
Keebio keyboards
CIDOO ABM066
UHKv2
https://kbd.news/Amano-1886.html
https://kbd.news/Feather-40-1733.html
YMDK Wings https://ymdkey.com/products/ymdk-wings-aluminum-cnc-top-bottom-qmk-pcb-full-assembly-keyboard-jade-navy-cream-switches
https://kbd.news/Kolibri-keyboard-1093.html
https://www.adesso.com/products/tru-form-ergonomic-touchpad-keyboard/
https://www.adesso.com/products/2-4-ghz-wireless-ergonomic-trackball-keyboard/
https://ajazzstore.com/products/ajazz-aks068-pro
https://spaceholdings.net/collections/keyboards/products/sp-111
`
/* TODO
https://docs.google.com/spreadsheets/d/1kOHXAKuxkYMWo0s8xzkoVLM_iViYXjoVfkY-oCm0Tbc/edit#gid=0
*/