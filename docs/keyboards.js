window.keyboardData = [
{
	"name": "atreus62",
	"img": "atreus62.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 62,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"hotswap": "No",
	"switchProfile": "MX",
	"caseType": "Included",
	"source": "https://github.com/profet23/atreus62/",
	"kit": "!https://shop.profetkeyboards.com/category/atreus62"
},
{
	"name": "Atreus62_FT",
	"parent": "atreus62",
	"img": "atreus62-ft.jpg",
	"hotswap": true,
	"kit": "https://falbatech.click/products/Pre-soldered-Atreus62_FT-p613839930",
	"prebuilt": "https://falbatech.click/products/Atreus62_FT-Fully-Assembled-Custom-Mechanical-Keyboard-p630566564"
},
{
	"name": "Lotus 58",
	"img": "lotus58.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"pinkyStagger": 0,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Knob",
	"displays": {
		"min": 0,
		"max": 2
	},
	"firmware": "QMK",
	"software": "Vial",
	"assembly": [
		"PCB",
		"ThroughHole"
	],
	"wristPads": "None",
	"tilt": {
		"min": 0,
		"max": 20
	},
	"caseType": [
		"Included",
		"ThirdParty"
	],
	"source": "https://github.com/TweetyDaBird/Lotus-Keyboard",
	"kit": "![se] https://lectronz.com/stores/tweetys-wild-thinking",
	//"prebuilt": "![se] https://lectronz.com/stores/tweetys-wild-thinking",
	"layoutRef": "SKBC",
},
{
	"name": "Sofle Choc Wireless",
	"parent": "Sofle Choc",
	"img": "sofle_choc_wireless_with_niceview.jpg",
	"connection": ["Wired", "Bluetooth"],
	"keys": [58, 60],
	"innerKeys": [0, 1],
	"encoders": [0, 2],
	"firmware": "ZMK",
	"source": "https://github.com/db-ok/SofleChocWireless",
},
{
	"name": "ximi",
	"img": "ximi.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": [[36], [42]],
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": 3,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"encoders": 2,
	"trackballs": {
		"min": 0,
		"max": 2
	},
	"rockerSwitches": 2,
	"trackballSize": 34,
	"trackpads": {
		"min": 0,
		"max": 2
	},
	"pointingDevices": 2,
	"caseType": "Included",
	"kit": [
		"!https://fingerpunch.xyz/product/ximi/"
	]
},
{
	"name": "faux fox keyboard (ffkb) v3",
	"img": "ffkb.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [[36], [42]],
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": 3,
	"pinkyStagger": 0.7,
	"switchProfile": [
		"MX",
		"Choc"
	],
	"hotswap": true,
	"encoders": 2,
	"encoderType": ["Knob", "Wheel"],
	"pointingDevices": [0, 1],
	"trackballs": {
		"min": 0,
		"max": 1
	},
	"trackballSize": 34,
	"trackpads": {
		"min": 0,
		"max": 1
	},
	"pointingDevices": 1,
	"caseType": "Included",
	"kit": [
		"!https://fingerpunch.xyz/product/faux-fox-keyboard-v3/"
	]
},
{
	"name": "faux fox keyboard (ffkb) v4",
	"parent": "faux fox keyboard (ffkb) v3",
	"connection": "Wired",
	"switchProfile": [
		"MX",
		"Choc",
		"GateronLP",
	],
	"kit": [
		"!https://fingerpunch.xyz/product/faux-fox-keyboard-v4/"
	]
},
{
	"name": "Nyquist",
	"img": [
		"Nyquist.jpg"
	],
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": [[44], [60]],
	"rows": {
		"min": 3,
		"max": 4
	},
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": ["Yes", "No"],
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"firmware": "QMK",
	"software": "VIA",
	"encoderType": "Knob",
	"caseType": "Included",
	"kit": "!https://keeb.io/collections/nyquist-keyboard-collection",
	"prebuilt": "!https://keeb.io/collections/pre-built-keyboards/products/nyquist-keyboard-pre-built",
	"layoutRef": "SKBC",
},
{
	"name": "Keyboardio Atreus",
	"img": [
		"atreus.webp"
	],
	"shape": "Unibody",
	"stagger": "Column",
	"keys": 44,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"innerKeys": 1,
	"cornerKeys": 3,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "Custom",
	"software": "Custom",
	"caseType": "Included",
	"kit": "https://shop.yushakobo.jp/en/products/keyboardio-atreus-diy-kit",
	"prebuilt": "https://shop.keyboard.io/collections/keyboardio-atreus/products/keyboardio-atreus",
	"layoutRef": "SKBC"
},
{
	"name": "Atreus42_FT",
	"img": "Atreus42_FT.webp",
	"parent": "Keyboardio Atreus",
	"notes": ["Slightly tighter (and without a pair of middle keys) than the regular Atreus"],
	"keys": 42,
	"innerKeys": 0,
	"firmware": "QMK",
	"software": [],
	"kit": "https://falbatech.click/products/Pre-soldered-Atreus42_FT-p613853133",
	"prebuilt": "https://falbatech.click/products/Atreus42_FT-Fully-Assembled-Custom-Mechanical-Keyboard-p630587646",
},
{
	"name": "KLOR",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": [[36], [42]],
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": {
		"min": 3,
		"max": 4
	},
	"outerKeys": {
		"min": -1,
		"max": 0
	},
	"pinkyStagger": 0.5,
	"splay": "PinkyOnly",
	"switchProfile": "MX",
	"hotswap": "Yes",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Knob",
	"trackballs": {
		"min": 0,
		"max": 1
	},
	"displays": {
		"min": 0,
		"max": 2
	},
	"firmware": [
		"QMK",
		"ZMK",
		"KMK"
	],
	"caseType": "Included",
	"source": "https://github.com/GEIGEIGEIST/KLOR",
	"img": "KLOR_polydactyl_DES01.jpg",
	"notes": ["Also supports haptic feedback and speakers (?)"]
},
{
	"name": "picachoc36",
	"img": "picachoc36.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"hotswap": "No",
	"switchProfile": "Choc",
	"encoders": 1,
	"encoderType": "Knob",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/zzeneg/picachoc36"
},
{
	"name": "Honeydew",
	"img": "Honeydew.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": {
		"min": 63,
		"max": 64
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": 1,
	"cornerKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"encoders": {
		"min": 0,
		"max": 1
	},
	"encoderType": "Wheel",
	"trackballs": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/Ariamelon/Honeydew"
},
{
	"name": "stront",
	"img": "stront.jpg",
	"notes": [
		"Note: Separate MX/KS-33 and Choc PCBs"
	],
	"shape": "Split",
	"stagger": "Column",
	"keys": 38,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": -2,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc",
		"GateronLP"
	],
	"encoders": 2,
	"encoderType": [
		"Knob",
		"Wheel"
	],
	"trackpads": 1,
	"trackpadSize": 40,
	"displays": 1,
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/zzeneg/stront"
},
{
	"name": "pica40",
	"img": "pica40.jpg",
	"notes": ["MX hotswap only"],
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 40,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": -1,
	"pinkyStagger": 0.6,
	"splay": "PinkyOnly",
	"hotswap": ["Yes", "No"],
	"switchProfile": [
		"MX",
		"ChocV2"
	],
	"encoders": {
		"min": 1,
		"max": 2
	},
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/zzeneg/pica40"
},
{
	"name": "Corne GLP",
	"img": "corne-glp.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "GateronLP",
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"source": "https://showcase.beekeeb.com/corne-glp/",
	"kit": "!https://shop.beekeeb.com/product/corne-glp-kit/"
},
{
	"name": "catboard",
	"img": "catboard.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 3,
	"outerKeys": -1,
	"pinkyStagger": 0.25,
	"firmware": "Custom",
	"hotswap": "No",
	"switchProfile": "MX",
	"caseType": "Included",
	"web": "http://catboard.klava.org",
	"source": "https://github.com/ibnteo/catboard"
},
{
	"name": "uninarf",
	"img": "uninarf.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"splay": "PinkyOnly",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"firmware": "ZMK",
	"caseType": "None",
	"source": "https://github.com/sebastian-stumpf/uninarf"
},
{
	"name": "Fiðrildi",
	"img": "fidrildi-v4-wraith.jpg",
	"shape": "Unibody",
	"connection": "Wired",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.5,
	"switchProfile": "MX",
	"hotswap": "Yes",
	"encoders": 1,
	"encoderType": "Knob",
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/jstevej/fidrildi"
},
{
	"name": "Corax",
	"img": "Corax56.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [54, 56],
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"outerKeys": [-1, 0],
	"pinkyStagger": 0.66,
	"splay": "PinkyOnly",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 2,
	"encoderType": "Wheel",
	"displays": 2,
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/dnlbauer/corax-keyboard"
},
{
	"name": "Kaly",
	"img": "Kaly.jpg",
	"shape": "Split",
	"stagger": "Column",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "Choc",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "None",
	"source": "https://github.com/Dwctor/Kaly"
},
{
	"name": "CB34S",
	"img": "CB34S.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"source": "https://github.com/bubbleology/CB34S"
},
{
	"name": "compression (4c)",
	"img": "compression4c.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"displays": 2,
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/compressionKeyboards/compression4c",
	//"prebuilt": "!https://compressionkeyboards.com/collections/all"
},
{
	"name": "Charybdis",
	"img": "Charybdis-2.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": [3, 5],
	"trackballs": 1,
	"caseType": "Included",
	"hotswap": "No",
	"switchProfile": "MX",
	"source": "https://github.com/Bastardkb/Charybdis",
	"kit": "!https://bastardkb.com/charybdis/",
	"prebuilt": "!https://bastardkb.com/prebuilts/"
},
{
	"name": "Charybdis Mini",
	"parent": "Charybdis",
	"keys": 41,
	"rows": 3,
	"cols": 6,
	"thumbKeys": [2, 3],
	"img": "Charybdis-mini.jpg",
	"source": "https://github.com/Bastardkb/Charybdis",
	"kit": "!https://bastardkb.com/charybdis/",
	"prebuilt": "!https://bastardkb.com/prebuilts/"
},
{
	"name": "Charybdis Nano",
	"parent": "Charybdis",
	"keys": 35,
	"rows": 3,
	"cols": 5,
	"thumbKeys": [2, 3],
	"img": "Charybdis.jpg",
	"source": "https://github.com/Bastardkb/Charybdis",
	"kit": "!https://bastardkb.com/charybdis/",
	"prebuilt": "!https://bastardkb.com/prebuilts/"
},
{
	"name": "Rommana",
	"img": "Rommana.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"innerKeys": -1,
	"outerKeys": -1,
	"thumbKeys": 2,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"caseType": "Included",
	"source": "https://github.com/AlaaSaadAbdo/Rommana"
},
{
	"name": "Ghoul",
	"img": "Ghoul.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 40,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/tzarc/ghoul"
},
{
	"name": "Fissure",
	"img": "Fissure.jpg",
	"shape": ["Split", "Special"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 40,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": -1,
	"pinkyStagger": 1.2,
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"displays": 1,
	"tenting": "Fixed",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/crides/fissure"
},
{
	"name": "Fusion",
	"img": "Fusion.jpg",
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"rcols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 1.5,
	"switchProfile": "ChocMini",
	"trackpads": 1,
	"displays": 1,
	"caseType": "None",
	"source": "https://github.com/crides/fusion"
},
{
	"name": "Btrfld",
	"img": "btrfld.jpg",
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 46,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 5,
	"cornerKeys": 3,
	"tenting": ["None", "Legs"],
	"hotswap": "No",
	"switchProfile": "Choc",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/SolidHal/btrfld"
},
{
	"name": "sok42",
	"img": "sok42.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 84,
	"rows": 5,
	"cols": 7,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"switchProfile": "Optical",
	"software": "Custom",
	"caseType": "None",
	"source": "https://github.com/Dachtire/sok42"
},
{
	"name": "Lil Chonky Bois",
	"img": "lil-chonky-bois.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/sanderboer/chonkybois"
},
/*{ // off-sale?
	"name": "Harper",
	"img": "harper.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 62,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"cornerKeys": 4,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 2,
	"encoderType": "Knob",
	"firmware": "ZMK",
	"caseType": "Included",
	"prebuilt": [
		"![UA] https://t.me/splitted_space",
		"![UA] https://www.olx.ua/uk/list/user/gydXk/"
	]
},*/
{
	"name": "Torn",
	"img": "torn.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 42,
		"max": 44
	},
	"rows": 3,
	"cols": 6,
	"thumbKeys": {
		"min": 3,
		"max": 4
	},
	"pinkyStagger": 0.3,
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Knob",
	"hotswap": ["Yes", "No"],
	"switchProfile": ["MX", "Choc"],
	"firmware": "QMK",
	"software": "VIA",
	"assembly": "ThroughHole",
	"caseType": "Included",
	"extras": "[v:hipro case] https://github.com/rtitmuss/torn/blob/master/case/HiPro%20Case/readme.md",
	"source": "https://github.com/rtitmuss/torn"
},
{
	"name": "oddball",
	"img": "oddball.jpg",
	"shape": "Split",
	"stagger": "Column",
	"keys": {
		"min": 38,
		"max": 40
	},
	"rows": 3,
	"cols": 6,
	"thumbKeys": {
		"min": 1,
		"max": 2
	},
	"pinkyStagger": 0.3,
	"trackballs": {
		"min": 0,
		"max": 2
	},
	"hotswap": "No",
	"switchProfile": "MX",
	"tenting": "Fixed",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/atulloh/oddball"
},
{
	"name": "Choctopus44",
	"img": "choctopus44v2.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 1,
	"encoderType": "Knob",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/SlightHeadache/choctopus44",
	"prebuilt": "https://shop.beekeeb.com/product/presoldered-choctopus44-keyboard/"
},
{
	"name": "Santoku",
	"img": "Santoku.webp",
	"shape": [
		"Unibody",
		"Split"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"encoders": 1,
	"encoderType": "Wheel",
	"trackpoints": 1,
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"kit": "![us] https://gestaltinput.com/products/santoku-keyboard-kit-black"
},
{
	"name": "MiniDox",
	"img": "minidox.webp",
	"shape": "Split",
	"stagger": "Column",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 3,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Alps"],
	"firmware": "QMK",
	"ctlCount": 2,
	"caseType": "Included",
	"source": "https://github.com/That-Canadian/MiniDox_PCB",
	"kit": "https://shop.profetkeyboards.com/product/minidox-pcb-set",
	"prebuilt": "https://falbatech.click/products/MiniDox-Fully-Assembled-Custom-Mechanical-Keyboard-p631289446",
	"layoutRef": "SKBC"
},
{
	"name": "Microdox",
	"img": "microdox.webp",
	"shape": "Split",
	"stagger": "Column",
	"keys": {
		"min": 34,
		"max": 36
	},
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"encoders": [0, 2],
	"displays": 2,
	"firmware": "QMK",
	"caseType": "Included",
	"kit": "https://www.boardsource.xyz/products/microdox",
	"layoutRef": "SKBC",
},
{
	"name": "Kinesis Advantage360",
	"img": "kinesis-advantage360.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 76,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 6,
	"innerKeys": 3,
	"cornerKeys": 5,
	"pinkyStagger": 0.25,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "Custom",
	"wristPads": "Integrated",
	"caseType": "Included",
	"extras": [
		"[v:Carry case] https://www.thingiverse.com/thing:6634504",
	],
	"prebuilt": "!https://kinesis-ergo.com/products/#adv360"
},
{
	"name": "Kinesis Advantage 2",
	"img": "kinesis-advantage2.jpg",
	"shape": [
		"Unibody",
		"Keywell"
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 86,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 6,
	"cornerKeys": 4,
	"pinkyStagger": 0.25,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "Custom",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": "!https://kinesis-ergo.com/products/#advantage2"
},
{
	"name": "Thumbs Up!",
	"img": "thumbsup.jpg",
	"notes": [
		"A layered PCB forms a \"staircase\" of keys",
		"Creator has a variety of revisions with different key counts"
	],
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [38, 44, 46, 58],
	"rows": {
		"min": 3,
		"max": 4
	},
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": {
		"min": 4,
		"max": 5
	},
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc",
		"Alps"
	],
	"tenting": "Fixed",
	"firmware": "QMK",
	"caseType": "Included",
	"web": [
		"https://www.thumbsup.shop",
		"https://new.reddit.com/user/ak66666/submitted/",
		"https://thumbsupkeyboards.etsy.com"
	],
	"prebuilt": "!https://thumbsupkeyboards.etsy.com",
	"source": "https://github.com/ak66666"
},
{
	"name": "Planeta",
	"img": "planeta.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 1,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"kit": "!https://ergohaven.xyz/shop/tproduct/339856256-451576977141-diy-kits",
	"prebuilt": "!https://ergohaven.xyz/shop/tproduct/339856256-880659810681-planeta"
},
{
	"name": "K:02",
	"img": "k-02.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"displays": 2,
	"tenting": ["None", "Legs"],
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": [
		"https://github.com/ergohaven/K02",
		"https://oshwlab.com/yuriiq/k02",
	],
	"prebuilt": "!https://ergohaven.xyz/shop/tproduct/339856256-523210054391-k02"
},
{
	"name": "Abomination",
	"img": "abomination.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"innerKeys": 2,
	"pinkyStagger": 0.45,
	"splay": "PinkyOnly",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"trackpads": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/sebastian-stumpf/abomination"
},
{
	"name": "Sweep",
	"img": "sweep.jpg",
	"shape": "Split",
	"stagger": "Column",
	"notes": ["Hotswap/switches depend on variant"],
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"switchProfile": [
		"Choc",
		"ChocV2",
		"Alps"
	],
	"hotswap": [true, false],
	"keySpacing": "Choc",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"pinkyStagger": 0.7,
	"source": "https://github.com/davidphilipbarr/Sweep",
	"kit": [
		"https://holykeebs.com",
		"https://42keebs.eu/shop/kits/pro-micro-based/sweep-30-low-profile-split-ergo-kit/",
		"https://mechboards.co.uk/collections/kits/products/ferris-sweep-kit",
		"https://keebmaker.com/collections/kits",
		"https://keycapsss.com/keyboard-parts/pcbs/249/sweep-ferris-fork-split-keyboard-pcb"
	]
},
{
	"name": "splitreus62",
	"img": "splitreus62.jpg",
	"shape": "Split",
	"keys": 62,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"cornerKeys": 4,
	"pinkyStagger": 0.3,
	"switchProfile": [
		"MX",
		"Choc",
		"Alps"
	],
	"hotswap": false,
	"keySpacing": "MX",
	"caseType": "Included",
	"source": "https://github.com/Na-Cly/splitreus62"
},
{
	"name": "Spleeb",
	"img": "spleeb.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 62,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 3,
	"outerKeys": -1,
	"pinkyStagger": 0.7,
	"switchProfile": "MX",
	"hotswap": false,
	"encoders": 2,
	"encoderType": "Knob",
	"trackpads": 1,
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/chrishoage/spleeb"
},
{
	"name": "Smudge",
	"img": "smudge.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 1.5,
	"hotswap": "No",
	"switchProfile": "MX",
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/Sandalmoth/keyboards/tree/master/smudge"
},
{
	"name": "Lörtsy",
	"img": "lortsyboard.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 74,
		"max": 76
	},
	"rows": 5,
	"cols": 6,
	"thumbKeys": 2,
	"innerKeys": 1,
	"cornerKeys": 5,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/Cedutus/LortsyBoard"
},
{
	"name": "Essence",
	"img": "Essence.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 64,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 3,
	"cornerKeys": 1,
	"pinkyStagger": 0.25,
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"caseType": "Included",
	"source": "https://github.com/Hyper-works/Essence"
},
{
	"name": "Manta60",
	"img": "manta60.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 64,
		"max": 66
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": {
		"min": 4,
		"max": 5
	},
	"innerKeys": 3,
	"cornerKeys": 1,
	"hotswap": "No",
	"switchProfile": "MX",
	"caseType": "Included",
	"source": "https://github.com/KamoNanban/Manta60"
},
{
	"name": "Nyx",
	"img": "nyx.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 64,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/tadfisher/nyx-kb"
},
/*{
	"name": "Centromere Plus",
	"img": "Centromere-Plus.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Wireless"
	],
	"keys": {
		"min": 60,
		"max": 62
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": {
		"min": 3,
		"max": 4
	},
	"innerKeys": 3,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"firmware": "QMK",
	"caseType": "Included",
	"kit": "!https://southpawdesign.net/collections/all"
},*/
{
	"name": "NISSE",
	"img": "NISSE.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 76,
	"rows": 5,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 2,
	"outerKeys": 1,
	"tenting": "Fixed",
	"tilt": 10,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "Custom",
	"caseType": "Included",
	"web": "https://www.esrille.com/keyboard/",
	"prebuilt": "!https://www.esrille.com/keyboard/store.html",
	"layoutRef": "https://www.esrille.com/keyboard/#papercraft"
},
{
	"name": "Chocofly",
	"img": "chocofly.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 6,
	"pinkyStagger": 0.2,
	"splay": "PinkyOnly",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 1,
	"encoderType": "Wheel",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/vlkv/chocofly"
},
{
	"name": "Sotka",
	"img": "sotka.jpg",
	"notes": "Not pictured: you can have a partial row with 3 extra keys and a rotary encoder",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": {
		"min": 54,
		"max": 60
	},
	"switchProfile": "MX",
	"hotswap": false,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Knob",
	"caseType": "Included",
	"source": "https://github.com/pohjolaworks/Sotka"
},
{
	"name": "Frame 48",
	"img": "frame48.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 52,
		"max": 54
	},
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": {
		"min": 0,
		"max": 1
	},
	"cornerKeys": 3,
	"pinkyStagger": 0.4,
	"hotswap": "No",
	"switchProfile": "Choc",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Knob",
	"firmware": "QMK",
	"software": "VIA",
	"assembly": [
		"Handwired"
	],
	"caseType": "Included",
	"source": "https://github.com/gregsqueeb/Frame-48"
},
{
	"name": "Hotreus62",
	"img": "Hotreus62.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": 62,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"cornerKeys": 4,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/beekeeb/hotreus62",
	"kit": "!https://shop.beekeeb.com/product/hotreus62-pcb-kit/",
	"prebuilt": "!https://shop.beekeeb.com/product/pre-soldered-hotreus62/"
},
{
	"name": "ErgoTravelXT",
	"img": "ErgoTravelXT.jpg",
	"shape": [
		"Unibody",
		"Split"
	],
	"connection": "Wired",
	"keys": 56,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 2,
	"cornerKeys": 4,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"caseType": "Included",
	"source": "https://github.com/FIXMBR/ErgoTravelXT"
},
{
	"name": "Cheapino",
	"img": "cheapino.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"caseType": "Included",
	"source": "https://github.com/tompi/cheapino"
},
{
	"name": "Ergo S-1",
	"img": "S-1.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 68,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 6,
	"firmware": "ZMK",
	"hotswap": "No",
	"switchProfile": "MX",
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/wizarddata/Ergo-S-1",
	"kit": "!https://www.etsy.com/shop/WizardKeyboards"
},
{
	"name": "JONKEY",
	"img": "jonkey-v1.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 72,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 5,
	"cornerKeys": 5,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "MX",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/AtomicJon/jonkey"
},
{
	"name": "7x5-split-ergo",
	"img": "7x5-split-ergo.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 70,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"cornerKeys": 3,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"lighting": "Simple",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/kai9240/7x5-split-ergo"
},
{
	"name": "Protocol Seven",
	"img": "protocol-seven.jpg",
	"notes": "Supports a third switch type that I am unable to recognize",
	"shape": "Unibody",
	"stagger": "Column",
	"switchProfile": ["MX", "Choc", "Other"],
	"hotswap": false,
	"keys": 106,
	"rows": 5,
	"cols": 7,
	"mcols": 4,
	"thumbKeys": 2,
	"cornerKeys": 2,
	"navCluster": "Duo",
	"numpad": "Full",
	"pinkyStagger": 0.8,
	"caseType": "Included",
	"source": "https://github.com/dotleon/protocol_seven"
},
{
	"name": "Span",
	"img": "span.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"trackballs": {
		"min": 0,
		"max": 1
	},
	"trackpoints": {
		"min": 0,
		"max": 1
	},
	"displays": {
		"min": 0,
		"max": 1
	},
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/idank/spankbd",
	"kit": "!https://holykeebs.com/products/span",
	"prebuilt": "!https://holykeebs.com/products/span"
},
{
	"name": "Ergodonk",
	"img": "ergodonk.jpg",
	"shape": ["Split", "Half"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": -1,
	"outerKeys": 2,
	"hotswap": "No",
	"switchProfile": "MX",
	"assembly": "Handwired",
	"wristPads": "Integrated",
	"source": [
		"https://imgur.com/a/Lt5Mwwv",
		"https://www.thingiverse.com/thing:4892740"
	]
},
{
	"name": "Pluckey",
	"img": "pluckey.jpg",
	"shape": "Split",
	"stagger": "Column",
	"keys": {
		"min": 66,
		"max": 68
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": {
		"min": 5,
		"max": 6
	},
	"innerKeys": {
		"min": 3,
		"max": 4
	},
	"pinkyStagger": 0.6,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/floookay/pluckey"
},
{
	"name": "BumWings",
	"img": "bumwings_v001R64_rp2040zero_build_daily.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [[54], [64]],
	"rows": {
		"min": 3,
		"max": 4
	},
	"cols": 6,
	"rcols": 6,
	"thumbKeys": {
		"min": 2,
		"max": 6
	},
	"innerKeys": {
		"min": 2,
		"max": 4
	},
	"cornerKeys": 2,
	"navCluster": "Duo",
	"pinkyStagger": 0.7,
	"splay": "Yes",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"assembly": [
		"PCB",
		"ThroughHole"
	],
	"wristPads": "None",
	"caseType": "None",
	"source": "https://github.com/tubbytwins/bumwings-kbd"
},
{
	"name": "Bad Wings",
	"img": "bad-wings.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.6,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"trackpads": 1,
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"kit": "!https://shop.hazel.cc/products/bad-wings-v2"
},
{
	"name": "ExtraDox",
	"img": "extradox.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 90,
	"rows": 5,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 6,
	"innerKeys": 4,
	"outerKeys": 0,
	"cornerKeys": 5,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/blastrock/ExtraDox",
	//"prebuilt": "!https://github.com/blastrock/ExtraDox#buying-one" // all gone!
},
{
	"name": "Aether",
	"img": "aether.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 94,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 2,
	"innerKeys": 3,
	"cornerKeys": 3,
	"navCluster": "Arrows",
	"switchProfile": "MX",
	"pinkyStagger": 0.3,
	"firmware": "QMK",
	"assembly": "Handwired",
	"caseType": "Included",
	"web": "https://www.reddit.com/r/olkb/comments/nw8i3l/my_new_handwired_keyboard_with_a_layout_designed/",
	"source": "https://github.com/Y5U/Aether"
},
{
	"name": "ErgoArrows",
	"img": [
		"ErgoArrows.webp",
		"ErgoArrows-a.webp"
	],
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired"
	],
	"keys": 76,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"cornerKeys": 2,
	"navCluster": "Duo",
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "VIA",
	"wristPads": [
		"None",
		"Integrated"
	],
	"caseType": "Included",
	"kit": "!https://shop.yushakobo.jp/en/products/ergoarrows"
},
{
	"name": "Lyra",
	"img": "Lyra.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"switchProfile": ["MX", "Choc"],
	"hotswap": true,
	"keys": 70,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"pinkyStagger": 0.3,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/Malevolti/Lyra"
},
{
	"name": "CozyKeys Speedo",
	"img": "speedo.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 66,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"cornerKeys": 4,
	"navCluster": "Arrows",
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/cozykeys/speedo"
},
{
	"name": "Piantor",
	"img": "piantor.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 36,
		"max": 42
	},
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": [
		"Included",
		"ThirdParty"
	],
	"source": "https://github.com/beekeeb/piantor",
	"kit": [
		"!https://shop.beekeeb.com/product/piantor-keyboard-kit/",
		"https://keycapsss.com/diy-kits/237/piantor-split-keyboard-kit",
		"https://keycapsss.com/keyboard-parts/pcbs/239/piantor-split-keyboard-pcb"
	],
	"prebuilt": "!https://shop.beekeeb.com/product/pre-soldered-piantor-split-keyboard/"
},
{
	"name": "Rev57LP",
	"img": "Rev57LP.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 57,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": ["QMK", "ZMK"],
	"caseType": "Included",
	"source": "https://github.com/piit79/rev57lp",
	"kit": "https://42keebs.eu/shop/kits/pro-micro-based/rev57lp-50-low-profile-hotswap-ergo-kit/"
},
{
	"name": "Dactyl Manuform",
	"img": "dactyl-manuform.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 34,
		"max": 92
	},
	"rows": {
		"min": 3,
		"max": 5
	},
	"cols": {
		"min": 5,
		"max": 7
	},
	"thumbKeys": {
		"min": 2,
		"max": 6
	},
	"cornerKeys": {
		"min": 0,
		"max": 4
	},
	"switchProfile": ["MX", "Choc"],
	"caseType": "Included",
	"kit": "https://www.diykeyboards.com/keyboards/keyboard-kits/product/dactyl-manuform-kit",
	"source": "https://github.com/abstracthat/dactyl-manuform",
	"prebuilt": [
		"https://www.cyboard.digital/product-page/pre-built-dactyl-manuform",
		//"https://ohkeycaps.com/products/built-to-order-dactyl-manuform-keyboard",
		"https://k33b.com/shop/custom-dactyl-keyboard/",
		"https://skree.us/collections/all"
	]
},
{
	"name": "kagura42",
	"img": "kagura42.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.7,
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 3,
	"encoderType": "Knob",
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"kit": "!https://shop.dailycraft.jp/collections/kagura42",
	"prebuilt": "!https://shop.dailycraft.jp/collections/kagura42"
},
{
	"name": "Pragmatic 60",
	"img": "pragmatic-60.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/jamessa/Pragmatic",
	"kit": [
		"!https://www.pragmatic.com.tw/shop/60-mx-8"
	]
},
{
	"name": "Pragmatic 56",
	"img": "pragmatic-56.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": ["MX"],
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/jamessa/Pragmatic",
	"kit": [
		"![v:MX] https://www.pragmatic.com.tw/shop/pragmatic54-115",
		"![v:Choc] https://www.pragmatic.com.tw/shop/choc54-62",
	]
},
{
	"name": "Pragmatic 36",
	"img": "pragmatic-36.jfif",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.6,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": ["MX", "Choc"],
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/jamessa/Pragmatic",
	"kit": [
		"![v:MX] https://www.pragmatic.com.tw/shop/pragmatic36-105",
		"![v:Choc] https://www.pragmatic.com.tw/shop/wu-shi-36ai-zhou-89"
	]
},
{
	"name": "Pragmatic 42",
	"img": "pragmatic-42.jfif",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.6,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": ["MX", "Choc"],
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/jamessa/Pragmatic",
	"kit": [
		"![v:MX] https://www.pragmatic.com.tw/shop/pragmatic36-111",
		"![v:Choc] https://www.pragmatic.com.tw/shop/wu-shi-42ai-zhou-93"
	]
},
{
	"name": "Ergo68",
	"img": "Ergo68.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 68,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 3,
	"cornerKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"caseType": "Included",
	"kit": "!https://shop.yushakobo.jp/en/products/ergo68"
},
{
	"name": "Fulcrum (20)",
	"img": "fulcrum-20.jpg",
	"shape": "Split",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 20,
	"rows": 2,
	"cols": 4,
	"thumbKeys": 2,
	"pinkyStagger": 0.9,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"encoders": 2,
	"encoderType": "Knob",
	"dpads": 2,
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/dschil138/Fulcrum"
},
{
	"name": "Fulcrum (40)",
	"img": "fulcrum-40.jpg",
	"shape": "Split",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [[34], [40]],
	"rows": 3,
	"cols": [5, 6],
	"thumbKeys": 2,
	"pinkyStagger": 0.3,
	"splay": "No",
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"dpads": 2,
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/dschil138/Fulcrum"
},
{
	"name": "HillSideView",
	"img": "HillSideView.jpg",
	"notes": "A wireless fork of Hillside46 with nice!view e-paper displays",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [[40], [46]],
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": 5,
	"pinkyStagger": 0.8,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"trackpads": {
		"min": 0,
		"max": 1
	},
	"displays": 2,
	"firmware": "ZMK",
	"caseType": "Included",
	"web": [
		"https://www.reddit.com/r/ErgoMechKeyboards/comments/17opz7v/hillsideview_a_modified_hillside_46_with_niceview/",
		"https://imgur.com/a/YDMosnA"
	],
	"source": "https://github.com/wannabecoffeenerd/HillSideView/"
},
{
	"name": "Buteo",
	"img": "buteo.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"innerKeys": -1,
	"outerKeys": -1,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"encoders": 1,
	"encoderType": "Wheel",
	"trackpads": 1,
	"trackpadSize": 40,
	"caseType": "Included",
	"source": "https://github.com/pixelbreaker/buteo"
},
{
	"name": "hummingbird",
	"img": "hummingbird.jpeg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"innerKeys": -1,
	"outerKeys": -1,
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": "Choc",
	"caseType": "Included",
	"source": "https://github.com/PJE66/hummingbird"
},
{
	"name": "Zilpzalp",
	"img": "zilpzalp.jpg",
	"notes": "different versions with different spacings, switch compatability, and case options",
	"shape": [
		"Unibody",
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 28,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 2,
	"innerKeys": -1,
	"outerKeys": -2,
	"cornerKeys": 0,
	"navCluster": "None",
	"pinkyStagger": 1,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc",
		"GateronLP"
	],
	"keySpacing": [
		"MX",
		"Choc",
		"CFX",
		"MinChoc",
		"Other"
	],
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"assembly": "PCB",
	"wristPads": "None",
	"tilt": 0,
	"caseType": "ThirdParty",
	"source": "https://github.com/kilipan/zilpzalp",
	"kit": "https://keeb.supply/products/zilpzalp"
},
{
	"name": "Apodiformbird",
	"img": "apodiformbird.jpg",
	"shape": "Unibody",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 18,
		"max": 20
	},
	"rows": 2,
	"cols": 4,
	"thumbKeys": 2,
	"outerKeys": -1,
	"pinkyStagger": 0.8,
	"switchProfile": [
		"MX",
		"Choc"
	],
	"firmware": "KMK",
	"caseType": "None",
	"source": "https://github.com/Easontons/Apodiformbird"
},
{
	"name": "KLOTZ",
	"img": "KLOTZ.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"splay": "PinkyOnly",
	"switchProfile": "Choc",
	"hotswap": true,
	"encoders": 2,
	"encoderType": "Knob",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/GEIGEIGEIST/klotz"
},
{
	"name": "TOTEM",
	"img": "TOTEM.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"outerKeys": 1,
	"pinkyStagger": 0.8,
	"splay": "Yes",
	"hotswap": ["Yes", "No"],
	"switchProfile": "Choc",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/GEIGEIGEIST/TOTEM",
	"prebuilt": "!https://keeb.supply/products/geist-totem"
},
{
	"name": "Brk Out",
	"img": "brkout.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 1,
		"max": 2
	},
	"cornerKeys": 2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/weteor/BrkOut"
},
{
	"name": "DigDug",
	"img": "DigDug.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 45,
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 1,
		"max": 2
	},
	"outerKeys": 3,
	"cornerKeys": 3,
	"navCluster": "Arrows",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/weteor/DigDug"
},
{
	"name": "grumpy",
	"img": "grumpy.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": 28,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 1,
	"outerKeys": -1,
	"pinkyStagger": 1.5,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/weteor/Grumpy"
},
{
	"name": "Luna / ルナ",
	"img": "mindhatch-luna.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"innerKeys": -1,
	"outerKeys": -1,
	"pinkyStagger": 0.8,
	"splay": "Yes",
	"hotswap": ["Yes", "No"],
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"caseType": "None",
	"source": "https://github.com/mindhatch/keyboards#%E3%83%AB%E3%83%8A-luna"
},
{
	"name": "Lütt un Lütt",
	"img": "lutt-un-lutt.jpg",
	"notes": "According to the creator, encoders are intended for sporadic use, such as volume control.",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"encoders": 2,
	"encoderType": "Other",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/weteor/LuttUnLutt"
},
{
	"name": "cybr36",
	"img": "cybr36.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"switchProfile": "MX",
	"firmware": "ZMK",
	"caseType": "None",
	"source": "https://github.com/Sleepyboi7973/cybr36"
},
{
	"name": "arachnophobe",
	"img": "arachnophobe.jpg",
	"shape": "Unibody",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"innerKeys": -2,
	"outerKeys": -1,
	"pinkyStagger": 1.5,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"firmware": "ZMK",
	"wristPads": "Integrated",
	"caseType": "Included",
	"source": "https://github.com/sadekbaroudi/arachnophobe"
},
{
	"name": "Fifi",
	"img": "fifi.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"caseType": "None",
	"source": "https://github.com/raychengy/fifi_split_keeb",
	"layoutRef": "SKBC"
},
{
	"name": "chocofifi",
	"img": "chocofifi.jpeg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"caseType": "Included",
	"prebuilt": "https://shop.beekeeb.com/product/presoldered-chocofi-split-keyboard/",
	"source": "https://github.com/pashutk/chocofi"
},
{
	"name": "ut22",
	"img": "ut22.jpg",
	"shape": "Unibody",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 22,
	"rows": 2,
	"cols": 4,
	"thumbKeys": 2,
	"cornerKeys": 1,
	"pinkyStagger": 0.4,
	"splay": "PinkyOnly",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"displays": 1,
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/bubbleology/UT22"
},
{
	"name": "MM60Ergo",
	"img": "mm60ergo.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"switchProfile": "MX",
	"keys": 64,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"trackpoints": 1,
	"software": "Custom",
	"assembly": "Handwired",
	"source": "https://github.com/SKZBadHabit/MM60Ergo"
},
{
	"name": "IIICC",
	"img": "iiicc.jpg",
	"notes": "Not counting the 12-key macropad",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 50,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 5,
	"outerKeys": 2,
	"pinkyStagger": 0.3,
	"switchProfile": [
		"Choc",
		"ChocV2",
		"KXSwitch"
	],
	"dpads": 2,
	"firmware": "QMK",
	"tilt": {
		"min": -5,
		"max": 5
	},
	"caseType": "Included",
	"source": "https://github.com/kbjunky/IIICC"
},
{
	"name": "Lunakey",
	"img": "lunakey.jpg",
	"shape": "Split",
	"stagger": "Column",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"firmware": "KMK",
	"caseType": "None",
	"source": "https://github.com/yoichiro/lunakey"
},
{
	"name": "Le Chiffre",
	"img": "Le-Chiffre.jpg",
	"notes": "See Le Chiffre BLE for Bluetooth version",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.3,
	"switchProfile": [
		"MX",
		"Choc",
		"Alps"
	],
	"hotswap": false,
	"encoders": 1,
	"encoderType": "Knob",
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/tominabox1/Le-Chiffre-Keyboard"
},
{
	"name": "splaytoraid",
	"img": "splaytoraid.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 36,
		"max": 40
	},
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": 3,
	"outerKeys": -1,
	"pinkyStagger": 0.7,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"firmware": [
		"QMK",
		"ZMK",
		"KMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/freya-irl/splaytoraid40",
	"kit": "https://keeb.supply/products/splaytoraid-messenger-edition",
	"prebuilt": "https://keeb.supply/products/splaytoraid-messenger-edition"
},
{
	"name": "DracuLad",
	"img": "draculad.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 34,
		"max": 36
	},
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"pinkyStagger": 0.7,
	"hotswap": "No",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"encoders": {
		"min": 2,
		"max": 4
	},
	"trackballs": {
		"min": 0,
		"max": 2
	},
	"trackballSize": 4.4,
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/MangoIV/dracuLad",
	"kit": [
		"https://www.littlekeyboards.com/products/draculad-pcb-kit",
		"https://keycapsss.com/keyboard-parts/pcbs/166/draculad-split-keyboard-pcb",
	],
	"layoutRef": "SKBC",
},
{
	"name": "cocot46plus",
	"img": "cocot46plus.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"pinkyStagger": 0.4,
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"trackballs": 1,
	"trackballSize": 34,
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/aki27kbd/cocot46plus",
	"kit": "https://aki27.booth.pm/items/3879034"
},
{
	"name": "pinkies out v2",
	"img": "pinkies-out.jpg",
	"notes": "Not counting this as a 4x7 since bottom inner keys are rotated.",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 66,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 4,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"encoders": 2,
	"encoderType": [
		"Knob",
		"Wheel"
	],
	"trackpads": {
		"min": 0,
		"max": 1
	},
	"trackpadSize": 34,
	"caseType": "Included",
	"kit": "https://fingerpunch.xyz/product/pinkies-out-v2/"
},
{
	"name": "revxlp",
	"img": "revxlp.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 35,
		"max": 42
	},
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"thumbKeys": 3,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://gitlab.com/lpgalaxy/revxlp"
},
{
	"name": "Flynn",
	"img": "flynn.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 40,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 2,
	"pinkyStagger": 0.8,
	"switchProfile": "Choc",
	"displays": 1,
	"firmware": "QMK",
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/joshyeram/flynn-handwiredKeyboard"
},
{
	"name": "Quetzal",
	"img": "Quetzal.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 104,
	"rows": 5,
	"cols": 7,
	"numpad": "Full",
	"thumbKeys": 4,
	"cornerKeys": 5,
	"pinkyStagger": 0.2,
	"switchProfile": "MX",
	"hotswap": false,
	"firmware": "PRK",
	"caseType": "Included",
	"web": "https://www.reddit.com/r/MechanicalKeyboards/comments/104kcvw/this_is_my_first_commission_i_call_it_the_quetzal/",
	"source": "https://github.com/doesntfazer/Quetzal"
},
{
	"name": "Cockpit",
	"img": "cockpit.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"navCluster": "Arrows",
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 2,
	"displays": 1,
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/ozkan/Cockpit-Keyboard"
},
{
	"name": "Zerosprey42",
	"img": "zerosprey42.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/beekeeb/zerosprey42",
	"kit": "!https://shop.beekeeb.com/product/zerosprey42-monoblock-rp2040-keyboard/"
},
{
	"name": "Darknight",
	"img": "Darknight.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"hotswap": "No",
	"switchProfile": "MX",
	"assembly": "Handwired",
	"tenting": ["None", "Legs"],
	"caseType": "Included",
	"source": "https://github.com/macroxue/keyboard-diy",
	"layoutRef": "SKBC",
},
{
	"name": "swepp",
	"img": "swepp.jpg",
	"shape": "Split",
	"connection": "Wired",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.6,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/sebastian-stumpf/swepp"
},
{
	"name": "Birdy44",
	"img": "birdy44.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"splay": "PinkyOnly",
	"pinkyStagger": 0.9,
	"hotswap": "No",
	"switchProfile": "Choc",
	"trackpads": 2,
	"trackpadSize": 40,
	"assembly": "Handwired",
	"tenting": "Legs",
	"caseType": "Included",
	"source": "https://github.com/RaphCoder13/Birdy44"
},
{
	"name": "Vesuveus",
	"img": "Vesuveus.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"cornerKeys": 3,
	"pinkyStagger": 0.8,
	"switchProfile": "MX",
	"firmware": "KMK",
	"assembly": "Handwired",
	"source": "https://github.com/RaffOwO/vesuveus"
},
{
	"name": "juriform36",
	"img": "juriform36.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.7,
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"displays": 2,
	"firmware": "ZMK",
	"assembly": "Handwired",
	"caseType": "Included",
	"web": "https://lemmy.world/post/4453514",
	"source": "https://github.com/jurica/juriform36"
},
{
	"name": "cocot36plus",
	"img": "cocot36plus.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": "MX",
	"trackballs": 1,
	"trackballSize": 34,
	"firmware": "QMK",
	"software": "Vial",
	"source": "https://github.com/aki27kbd/cocot36plus",
	"kit": "https://cocotkeebs.com/en/collections/all"
},
{
	"name": "Endeavour",
	"img": "endeavour.jpeg",
	"shape": "Monoblock",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": {
		"min": 31,
		"max": 40
	},
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 1,
		"max": 4
	},
	"cornerKeys": {
		"min": 0,
		"max": 4
	},
	"caseType": "Included",
	"source": "https://github.com/ScatteredDrifter/Endeavour/tree/main"
},
{
	"name": "Barghoot",
	"img": "Barghoot.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 43,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 4,
	"innerKeys": 1,
	"cornerKeys": 4,
	"swichProfile": ["MX", "Choc"],
	"hotswap": true,
	"encoders": 2,
	"encoderType": "Knob",
	"trackballs": 1,
	"displays": 1,
	"caseType": "Included",
	"source": "https://github.com/AlaaSaadAbdo/battoota/tree/main/boards/40keys/Barghoot"
},
{
	"name": "Nijuni",
	"img": "Nijuni.jpeg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 42,
		"max": 44
	},
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": {
		"min": 0,
		"max": 1
	},
	"pinkyStagger": 0.4,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Alps"
	],
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/krikun98/nijuni"
},
{
	"name": "chakra56",
	"img": "chakra56.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": 1,
	"pinkyStagger": 0.4,
	"switchProfile": ["GateronLP", "Choc"],
	"keySpacing": "MX",
	"encoders": 2,
	"encoderType": "Knob",
	"assembly": "Handwired",
	"caseType": "Included",
	"web": "https://www.reddit.com/r/olkb/comments/x0iaqs/was_designing_my_own_3d_printed_split_but_it/",
	"source": "https://www.printables.com/model/268802-chakra-low-profile-split-keyboard"
},
{
	"name": "tamago60",
	"img": "tamago60.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": [60, 62],
	"rows": 4,
	"cols": 6,
	"thumbKeys": [3, 4],
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": [
		"Choc",
		"ChocV2"
	],
	"keySpacing": "MX",
	"joysticks": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/eggsworks/tamago60"
},
{
	"name": "PLA_NCK",
	"img": "PLA_NCK.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 48,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "GateronLP",
	"displays": 2,
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/shanna/pla_nck"
},
{
	"name": "shortstack",
	"img": "shortstack.jpg",
	"notes": "Uses Kailh X switches",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 48,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": "No",
	"switchProfile": "KXSwitch",
	"firmware": "QMK",
	"source": "https://github.com/hazels-garage/shortstack"
},
{
	"name": "Thorium",
	"img": "thorium.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/note96e/thorium"
},
{
	"name": "OK35",
	"img": "ok35.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 70,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"switchProfile": ["MX", "Choc"],
	"hotswap": false,
	"firmware": "QMK",
	"assembly": [
		"PCB",
		"ThroughHole"
	],
	"source": "https://github.com/mothdotmonster/OK35",
	//"kit": "!https://shop.moth.monster/product/ok35"
},
{
	"name": "Jaye 44",
	"img": "Jaye44.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.6,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"kit": "![ru]https://t.me/eddbrds",
	"prebuilt": "![ru]https://t.me/eddbrds"
},
{
	"name": "TSBYM",
	"img": "tsbym.jpg",
	"notes": ["\"The Space Between You and Me\""],
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 4,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"encoders": {
		"min": 0,
		"max": 1
	},
	"encoderType": "Knob",
	"trackballs": {
		"min": 0,
		"max": 1
	},
	"trackballSize": 38,
	"trackpads": {
		"min": 0,
		"max": 2
	},
	"trackpadSize": 38,
	"pointingDevices": [0, 2],
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/cgxeiji/cgxkb/tree/main/tsbym"
},
{
	"name": "Pi5",
	"img": "Pi5Keyboard.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"cornerKeys": 1,
	"hotswap": "No",
	"switchProfile": [
		"MX",
		"Choc",
		"ChocV2",
		"GateronLP"
	],
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/luke-schutt/Pi5Keyboard"
},
{
	"name": "Briq",
	"img": "briq.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 0,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"caseType": "Included",
	"source": "https://github.com/kunsteak/Briq"
},
{
	"name": "X-2",
	"img": "x-2.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": [
		"No",
		"Yes"
	],
	"switchProfile": [
		"MX",
		"Choc"
	],
	"firmware": "QMK",
	"source": "https://github.com/rgoulter/keyboard-labs"
},
{
	"name": "Block",
	"img": "block-kbd.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 48,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"caseType": "Included",
	"source": "https://github.com/bncpr/block-kbd"
},
{
	"name": "Storyboard",
	"img": "storyboard.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/cbskii/storyboard-keyboard"
},
{
	"name": "Lumberjack",
	"img": "lumberjack.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": [58, 60],
	"rows": 4,
	"cols": 6,
	"thumbKeys": [2, 3],
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "ThroughHole",
	"caseType": "Included",
	"source": "https://github.com/peej/lumberjack-keyboard"
},
{
	"name": "Ajisai",
	"img": "Ajisai.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"pinkyStagger": 0.6,
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": "Handwired",
	"source": [
		"https://github.com/dcored13/zmk-master",
		"https://www.thingiverse.com/thing:5468398"
	]
},
{
	"name": "Ortholily",
	"img": "ortholily58.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"switchProfile": "MX",
	"lighting": "None",
	"assembly": "Handwired",
	"source": [
		"https://www.printables.com/model/245613-the-ortholily-a-3d-printed-split-ortholinear-mecha",
		"https://media.printables.com/media/prints/245613/other_files/2211474_a5c6d880-6fb0-466b-a4b0-46097d004c83/ortholily-guide.pdf"
	]
},
{
	"name": "Gleb's Sexy Acrylic",
	"img": "gleb-acrylic-1.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 4,
	"pinkyStagger": 0.6,
	"splay": "PinkyOnly",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 4,
	"encoderType": [
		"Knob",
		"Wheel"
	],
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://gitlab.com/gleb_sexy/keyboard-1"
},
{
	"name": "split_fire",
	"img": "split_fire.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.4,
	"hotswap": "No",
	"switchProfile": "MX",
	"joysticks": 1,
	"lighting": [
		"None",
		"RGB"
	],
	"firmware": "QMK",
	"assembly": "Handwired",
	"source": "https://github.com/anz507/split_fire"
},
{
	"name": "Proteus67",
	"img": "Proteus67.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 66,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 2,
	"cornerKeys": 4,
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"lighting": "Underglow",
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"source": "https://github.com/gzowski/Proteus67"
},
{
	"name": "Allium58",
	"img": "allium58.jpg",
	"notes": "Based on Lily58 Pro",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"outerKeys": 0,
	"cornerKeys": 0,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "GateronLP",
	"displays": 2,
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/beekeeb/Allium58",
	"kit": "!https://shop.beekeeb.com/product/allium58-glp-wired-kit/",
	"prebuilt": [
		"!https://shop.beekeeb.com/product/allium58-glp-wireless-kit/",
		"!https://shop.beekeeb.com/product/allium58-glp-wired-kit/"
	]
},
{
	"name": "unnamed 36 split",
	"img": "36-x.jpg",
	"notes": "Choc V1 or Kailh X",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"hotswap": "No",
	"switchProfile": [
		"Choc",
		"KXSwitch"
	],
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"caseType": "None",
	"source": "https://github.com/dilshod/36-choc-key-ortholinear-split"
},
{
	"name": "Basilisk",
	"img": "basilisk.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"switchProfile": "Choc",
	"encoders": 2,
	"encoderType": "Wheel",
	"lighting": "None",
	"firmware": "QMK",
	"assembly": "Handwired",
	"source": "https://github.com/radlinskii/basilisk"
},
{
	"name": "Mün 2",
	"img": "Mun2.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 70,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 3,
	"cornerKeys": 5,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 6
	},
	"lighting": "RGB",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/RGBKB/Keyboard-files/tree/main/Mun2"
},
{
	"name": "Barobord",
	"img": "barobord.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 40,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"cornerKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"encoders": 2,
	"trackballs": [0, 1],
	"displays": [0, 1],
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "Vial",
	"source": "https://github.com/sadekbaroudi/barobord",
	"kit": "https://fingerpunch.xyz/product/barobord/"
},
{
	"name": "Big Barobord",
	"img": "big-barobord.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 52,
	"rows": 4,
	"cols": 5,
	"thumbKeys": 3,
	"innerKeys": 1,
	"cornerKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"encoders": {"min": 0, "max": 1},
	"encoderType": ["Knob", "Wheel"],
	"trackballs": {"min": 0, "max": 1},
	"displays": {"min": 0, "max": 1},
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "Vial",
	"extras": "[v:cases] https://github.com/sadekbaroudi/fingerpunch/tree/master/keyboards/bigbarobord/cases",
	"kit": "https://fingerpunch.xyz/product/big-barobord/"
},
{
	"name": "Heron v1",
	"img": "Heron-v1.jpg",
	"shape": [
		"Unibody",
		"Keywell"
	],
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.2,
	"switchProfile": "Choc",
	"lighting": "None",
	"assembly": "Handwired",
	"web": [
		"https://postimg.cc/gallery/Vwfqb1Q",
		"https://www.youtube.com/shorts/eb4dZot1eeI"
	],
	"source": "https://github.com/Sneftel/heron"
},
{
	"name": "Flow",
	"img": "flow.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.6,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"trackballs": 1,
	"trackballSize": 38,
	"assembly": "Handwired",
	"source": "https://github.com/jsallan/flow"
},
/*{
	"name": "KeyMouse Alpha",
	"img": "keymouse-alpha.webp",
	"notes": "Featuring a handful of smaller buttons that aren't keys.",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 1,
	"pinkyStagger": 0.6,
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 2,
	"encoderType": "Wheel",
	"lighting": "Simple",
	"firmware": "Custom",
	"software": "Custom",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": "https://www.keymouse.com/catalog/keymouse/keymouse-alpha-109-3d-printed-assembled"
},
{
	"name": "KeyMouse Track",
	"img": "keymouse-track.webp",
	"notes": "Featuring a handful of smaller buttons that aren't keys.",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 70,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"cornerKeys": 3,
	"pinkyStagger": 0.4,
	"hotswap": "No",
	"switchProfile": "MX",
	"trackballs": 2,
	"lighting": "Simple",
	"firmware": "Custom",
	"software": "Custom",
	"wristPads": "Integrated",
	"caseType": "Included",
	"prebuilt": "https://www.keymouse.com/catalog/keymouse/keymouse-track-125-3d-printed-assembled"
},
{
	"name": "city42",
	"img": "city42.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"trackpads": 1,
	"trackpadSize": 40,
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "VIA",
	"caseType": "Included",
	"prebuilt": "https://controller.works/products/city42-ergonomic-keyboard",
	"pointingDevices": 1
},*/
{
	"name": "Sugar Glider",
	"shape": "Unibody",
	"img": "sugar-glider.jpg",
	"keys": {
		"min": 44,
		"max": 47
	},
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": {
		"min": 0,
		"max": 1
	},
	"pinkyStagger": 0.5,
	"switchProfile": [
		"MX",
		"Choc"
	],
	"encoders": {
		"min": 3,
		"max": 4
	},
	"encoderType": [
		"Knob",
		"Wheel"
	],
	"trackpads": {
		"min": 0,
		"max": 1
	},
	"lighting": "RGB",
	"firmware": "QMK",
	"caseType": "Included",
	"kit": "https://mechwild.com/product/sugar-glider/"
},
{
	"name": "Cut Slope",
	"img": "Cut-Slope.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"displays": 1,
	"lighting": "None",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/hazels-garage/cut-slope",
	"kit": "https://shop.hazel.cc/products/cut-slope"
},
{
	"name": "Zireael",
	"img": "zireael.jpg",
	"shape": "Split",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/Mposiblee/Zireael"
},
{
	"name": "Pteron 4x6",
	"img": "pteron.jpg",
	"notes": "Has 3x5, 3x6, and 4x6 variants.",
	"shape": "Unibody",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.3,
	"switchProfile": "MX",
	"hotswap": false,
	"firmware": "QMK",
	"assembly": ["Handwired", "PCB"],
	"source": [
		"[v: handwired] https://github.com/FSund/pteron-keyboard",
		"[v: PCB] https://github.com/kraken-jokes/pteron-pcb"
	],
	"layoutRef": "SKBC"
},
{
	"name": "Pteron 3x6",
	"parent": "Pteron 4x6",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"assembly": ["Handwired"],
	"source": "https://github.com/FSund/pteron-keyboard",
},
{
	"name": "Pteron 3x5",
	"parent": "Pteron 4x6",
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"source": [
		"[v: handwired] https://github.com/FSund/pteron-keyboard",
		"[v: PCB] https://github.com/harshitgoel96/pteron36-split-keyboard"
	]
},
{
	"name": "Closis",
	"img": "closis.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "MinChoc",
	"trackballs": 1,
	"trackballSize": 4.4,
	"lighting": "None",
	"firmware": "QMK",
	"assembly": "Handwired",
	"source": "https://github.com/dschil138/closis-keyboard",
	"pointingDevices": 1
},
{
	"name": "Explorer Mountain",
	"img": "explorer-mountain.webp",
	"notes": "Stagger of each pair of columns can be adjusted.",
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"assembly": [
		"PCB",
		"Adjustable"
	],
	"source": "https://github.com/DreaM117er/Explorer-Keyboard-Mountian"
},
{
	"name": "Ergotonic 49",
	"img": "Ergotonic49.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 49,
	"rows": 3,
	"cols": 6,
	"rcols": 7,
	"thumbKeys": 3,
	"innerKeys": 1,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 3
	},
	"encoderType": "Knob",
	"lighting": "RGB",
	"caseType": "Included",
	"kit": "https://shop.yushakobo.jp/products/2942"
},
{
	"name": "ErgoChoco",
	"img": "ErgoChoco.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"lighting": "Simple",
	"caseType": "Included",
	"source": "https://github.com/Choco617/ErgoChoco-PCB"
},
{
	"name": "Crowboard",
	"img": "crowboard.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 34,
		"max": 36
	},
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"lighting": "None",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "None",
	"source": "https://github.com/doesntfazer/CrowBoard"
},
{
	"name": "Triboard",
	"img": "triboard.jpg",
	"notes": "2 thumb keys when wireless, 3 thumb keys when wired.",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": {
		"min": 34,
		"max": 36
	},
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"pinkyStagger": 1,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"firmware": [
		"QMK",
		"ZMK",
		"KMK"
	],
	"caseType": "None",
	"source": "https://github.com/tarneaux/triboard"
},
{
	"name": "Ergonaut One",
	"img": "ergonaut-one.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": "GateronLP",
	"displays": {
		"min": 0,
		"max": 2
	},
	"lighting": "None",
	"firmware": "ZMK",
	"caseType": "Included",
	"web": "https://ergonautkb.com/docs/keyboards/ergonaut-one/intro/",
	"source": "https://github.com/ergonautkb"
},
{
	"name": "Sentinel",
	"img": "sentinel.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 37,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.6,
	"switchProfile": "MX",
	"trackballs": 1,
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/protieusz/Sentinel"
},
{
	"name": "DragonFruit",
	"img": "dragonfruit.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"switchProfile": "MX",
	"pointingDevices": 1,
	"trackballs": 1,
	"displays": 1,
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/protieusz/DragonFruit"
},
{
	"name": "Le Capybara",
	"img": "le-capybara.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 34,
		"max": 37
	},
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.3,
	"switchProfile": "Topre",
	"hotswap": false,
	"encoders": 1,
	"encoderType": "Knob",
	"displays": 1,
	"caseType": "Included",
	"source": "https://github.com/sporkus/le_capybara_keyboard"
},
{
	"name": "Seismos",
	"img": [
		"Seismos-1.jpg",
		"Seismos-2.jpg"
	],
	"notes": "Rails allow adjusting stagger on per-column basis.",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"switchProfile": "Choc",
	"encoders": 2,
	"encoderType": "Knob",
	"firmware": [
		"ZMK",
		"KMK"
	],
	"assembly": "Adjustable",
	"caseType": "Included",
	"source": "https://github.com/ReSummit/Seismos"
},
{
	"name": "Horizon",
	"img": "horizon-choc-mx-top.jpg",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 52,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"cornerKeys": 4,
	"hotswap": "No",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": [
		"MX",
		"Choc"
	],
	"lighting": "None",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"source": "https://github.com/skarrmann/horizon"
},
{
	"name": "Morizon",
	"parent": "Horizon",
	"img": "morizon-mx-top.jpg",
	"notes": "Like Horizon, but with an extra row",
	"keys": 66,
	"rows": 4,
	"cols": 6,
	"innerKeys": 2,
	"source": "https://github.com/skarrmann/morizon",
},
{
	"name": "Keyball46",
	"img": "keyball46.jpg",
	"notes": "Slightly asymmetrical",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 5,
	"rcols": 6,
	"thumbKeys": 3,
	"innerKeys": 1,
	"cornerKeys": {
		"min": 2,
		"max": 3
	},
	"pinkyStagger": 0.4,
	"switchProfile": "MX",
	"hotswap": true,
	"trackballs": 1,
	"firmware": "QMK",
	"software": [
		"VIA",
		"Remap"
	],
	"source": "https://github.com/yowkees/keyball",
},
{
	"name": "Keyball39",
	"img": "keyball39.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 39,
	"rows": 3,
	"cols": 5,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"cornerKeys": {
		"min": 1,
		"max": 3
	},
	"pinkyStagger": 0.4,
	"switchProfile": "MX",
	"hotswap": true,
	"trackballs": 1,
	"firmware": "QMK",
	"software": [
		"VIA",
		"Remap"
	],
	"source": "https://github.com/yowkees/keyball",
	"kit": [
		"https://shop.yushakobo.jp/products/5357",
		"https://shirogane-lab.net/items/64b8f8693ee3fd0045280190"
	],
},
{
	"name": "Keyball44",
	"img": "keyball44.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"pinkyStagger": 0.4,
	"switchProfile": "MX",
	"hotswap": true,
	"trackballs": 1,
	"firmware": "QMK",
	"software": [
		"VIA",
		"Remap"
	],
	"source": "https://github.com/yowkees/keyball",
	"kit": [
		"https://shirogane-lab.net/items/64b7a006eb6dbe00346cd0c5",
		"https://holykeebs.com/products/keyball44",
	],
	"prebuilt": "https://holykeebs.com/products/keyball44"
},
{
	"name": "Keyball61",
	"img": "keyball61.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 61,
	"rows": 4,
	"cols": 6,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"innerKeys": 1,
	"cornerKeys": {
		"min": 2,
		"max": 4
	},
	"pinkyStagger": 0.4,
	"switchProfile": "MX",
	"hotswap": true,
	"trackballs": 1,
	"firmware": "QMK",
	"software": [
		"VIA",
		"Remap"
	],
	"source": "https://github.com/yowkees/keyball",
	"kit": [
		"https://shop.yushakobo.jp/products/5358",
		"https://shirogane-lab.net/items/64b8ed191435c1002bc4cd30"
	],
},
{
	"name": "Killer Whale",
	"img": "killer-whale.webp",
	"notes": "Supports multiple thumb modules and replacing corner keys with more wheels.",
	"shape": [
		"Split",
		"Special"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 52,
		"max": 56
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": {
		"min": 2,
		"max": 4
	},
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Wheel",
	"trackballs": {
		"min": 0,
		"max": 1
	},
	"dpads": {
		"min": 0,
		"max": 1
	},
	"assembly": "Adjustable",
	"caseType": "Included",
	"source": [
		"[v:jp]https://github.com/Taro-Hayashi/KillerWhale",
		"[v:en]https://github.com/Taro-Hayashi/KillerWhale/blob/main/README_EN.md"
	],
	"kit": [
		"!https://tarohayashi.booth.pm/",
		"!https://shop.yushakobo.jp/en/products/7948"
	]
},
{
	"name": "Smol",
	"img": "smol.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 1,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 2,
	"encoderType": [
		"Knob",
		"Wheel"
	],
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/zzeneg/smol"
},
{
	"name": "atreus52",
	"img": "atreus52.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 52,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"cornerKeys": 4,
	"pinkyStagger": 0.3,
	"switchProfile": "MX",
	"hotswap": true,
	"caseType": "Included",
	"source": "https://github.com/ergomechstore/Atreus52"
},
{
	"name": "Wave",
	"img": "built_wave_1.jpeg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": [
		"No",
		"Yes"
	],
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 2,
	"encoderType": [
		"Knob",
		"Wheel"
	],
	"lighting": "None",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/etiennecollin/wave"
},
{
	"name": "Egboard",
	"img": "egboard.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 4,
	"pinkyStagger": 0.2,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "Custom",
	"assembly": "Handwired",
	"source": "https://github.com/ArchUsr64/egboard"
},
{
	"name": "elephant42",
	"img": "elephant42.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"outerKeys": -1,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "MX",
	"displays": { "min": 0, "max": 2 },
	"lighting": [
		"None",
		"RGB"
	],
	"firmware": "QMK",
	"source": "https://github.com/illness072/elephant42",
	"layoutRef": "SKBC"
},
{
	"name": "gameboard",
	"img": "gameboard.jpg",
	"shape": [
		"Split",
		"Half"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 62,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"outerKeys": -1,
	"cornerKeys": 0,
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": [
		"MX",
		"GateronLP"
	],
	"dpads": {
		"min": 1,
		"max": 2
	},
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "Vial",
	"source": "https://github.com/zzeneg/gameboard"
},
{
	"name": "Lynx",
	"img": [
		"lynx-2.webp",
		"lynx-1.webp",
		"lynx-3.webp"
	],
	"notes": [
		"This keyboard is too far outside my classification system.",
		"Uses mouse switches with custom caps for keys."
	],
	"shape": [
		"Split",
		"Special"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 42,
		"max": 62
	},
	"rows": 4,
	"cols": 5,
	"thumbKeys": {
		"min": 4,
		"max": 11
	},
	"innerKeys": -2,
	"outerKeys": 2,
	"cornerKeys": 4,
	"pinkyStagger": 1,
	"hotswap": "No",
	"switchProfile": "Other",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Wheel",
	"pointingDevices": {
		"min": 0,
		"max": 2
	},
	"joysticks": {
		"min": 0,
		"max": 2
	},
	"firmware": "Custom",
	"software": "Custom",
	"wristPads": "Detachable",
	"caseType": "Included",
	"web": "https://www.lynxware.org",
	"source": "https://www.lynxware.org/diy",
	"prebuilt": "https://lynxware.shop/"
},
{
	"name": "Churn",
	"img": "Churn.jpeg",
	"notes": "Column stagger can be adjusted in the .scad file",
	"shape": "Unibody",
	"stagger": ["Column", "Ortho"],
	"connection": "Wired",
	"keys": 38,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 4,
	"cornerKeys": 1,
	"pinkyStagger": 0.8,
	"splay": "No",
	"hotswap": "No",
	"switchProfile": "GateronLP",
	"lighting": "None",
	"assembly": ["Handwired", "Parametric"],
	"source": "https://github.com/luke-schutt/keyboards/tree/main/Churn"
},
{
	"name": "Churn Plus",
	"parent": "Churn",
	"img": "churn-65.png",
	"keys": 65,
	"rows": 4,
	"cols": 6,
	"rcols": 7,
	"thumbKeys": 5,
	"cornerKeys": 3,
	"navCluster": "Inline",
	"splay": "PinkyOnly",
	"source": "inherit"
},
{
	"name": "ETERNAL Keypad",
	"img": "ETERNAL-keypad.jpg",
	"shape": [
		"Split",
		"Half"
	],
	"stagger": "Ortho",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 72,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 3,
	"innerKeys": 3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"lighting": "Underglow",
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "VIA",
	"source": "https://github.com/duckyb/eternal-keypad"
},
{
	"name": "articulation70",
	"img": [
		"articulation70.jpg",
		"articulation70a.jpg"
	],
	"notes": "Mini-numpad/navigation blocks can be broken off",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": [[46], [58], [70]],
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 2,
	"navCluster": [
		"None",
		"Full"
	],
	"numpad": [
		"None",
		"Mini"
	],
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"caseType": "Included",
	"source": "https://github.com/mylestunglee/articulation70"
},
{
	"name": "RART45",
	"img": "rart45.webp",
	"notes": "Note: gerbers only",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 53,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "VIA",
	"assembly": "ThroughHole",
	"web": "https://www.reddit.com/r/MechanicalKeyboards/comments/psdcmt/my_daily_driver_pisses_everyone_off_ergo_45_with/",
	"source": "https://github.com/alabahuy/RART/tree/master/RART45"
},
{
	"name": "Chortyl",
	"img": "chortyl.jpg",
	"shape": [
		"Split",
		"Keywell"
	],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.5,
	"hotswap": [
		"No",
		"Yes"
	],
	"switchProfile": "MX",
	"firmware": "QMK",
	"source": "https://github.com/jdart/chortyl"
},
{
	"name": "Humla",
	"img": "humla-1.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.2,
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"source": "https://github.com/jimmerricks/humla"
},
{
	"name": "cheapis",
	"img": "cheapis_v0.1_built.jpg",
	"notes": "Consists of two halves under 100x100mm both",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.7,
	"switchProfile": [
		"MX",
		"Choc",
		"GateronLP"
	],
	"keySpacing": "MX",
	"firmware": "QMK",
	"caseType": "None",
	"source": "https://github.com/dotleon/cheapis"
},
{
	"name": "Corne XIAO",
	"img": "corne-xiao.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": [[36], 42],
	"rows": 3,
	"cols": {
		"min": 5,
		"max": 6
	},
	"rcols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 1
	},
	"encoderType": "Knob",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/friction07/corne-xiao/tree/main/rev2"
},
{
	"name": "TeeShirt",
	"img": "TeeShirt.jpg",
	"notes": "Includes 3 case sizes",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 42,
		"max": 43
	},
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 1
	},
	"displays": {
		"min": 0,
		"max": 1
	},
	"firmware": [
		"QMK",
		"ZMK"
	],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/dcpedit/teeshirt"
},
{
	"name": "Atreyu",
	"img": "atreyu.jpg",
	"notes": "Like Atreis, but with two extra keys.",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 5,
	"pinkyStagger": 0.3,
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/climent/atreyu"
},
{
	"name": "Atreyu v2",
	"img": "atreyu-v2.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": {
		"min": 58,
		"max": 60
	},
	"rows": 4,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 4,
	"innerKeys": {
		"min": 0,
		"max": 2
	},
	"cornerKeys": 1,
	"pinkyStagger": 0.3,
	"switchProfile": [
		"MX",
		"Choc"
	],
	"hotswap": true,
	"keySpacing": [
		"MX",
		"Choc"
	],
	"encoders": {
		"min": 0,
		"max": 2
	},
	"firmware": [
		"QMK",
		"ZMK"
	],
	"caseType": "Included",
	"source": "https://github.com/climent/atreyu"
},
{
	"name": "Urchin",
	"img": "urchin.webp",
	"notes": "A wireless-first keyboard inspired by the Sweep.",
	"parent": "Sweep",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Bluetooth", "WiredHalf"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 2,
	"innerKeys": 1,
	"outerKeys": 1,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.7,
	"splay": "No",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": "PCB",
	"ctlCount": 2,
	"ctlFootprint": "Nice!Nano",
	"ctlPinCount": 24,
	"ctlName": "nRF52840",
	"tenting": ["Legs", "Mount"],
	"caseType": ["Included", "ThirdParty"],
	"source": "https://github.com/duckyb/urchin",
	"kit": "https://shop.beekeeb.com/product/urchin-diy-kit/",
	"prebuilt": "https://shop.beekeeb.com/product/soldered-urchin-wireless-split-keyboard/",
	"buildGuide": "https://www.youtube.com/watch?v=CHSh1-dJq24&t=462s"
},
{
	"name": "IK",
	"img": "ik.jpg",
	"shape": "Split",
	"stagger": "Column",
	"keys": 52,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": 0,
	"outerKeys": -1,
	"cornerKeys": 0,
	"hotswap": "No",
	"switchProfile": "GateronLP",
	"keySpacing": "MX",
	"firmware": "QMK",
	"software": "Custom",
	"caseType": "Included",
	"web": "https://www.reddit.com/r/ErgoMechKeyboards/comments/1ami7za/presenting_the_ik_a_52_key_lowprofile_split_using/",
	"source": "https://github.com/ianmaclarty/ik"
},
{
	"name": "Phobos",
	"img": "phobos.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 66,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 4,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 6
	},
	"encoderType": "Knob",
	"lighting": [
		"RGB",
		"Underglow"
	],
	"firmware": "QMK",
	"prebuilt": "https://www.rgbkb.net/collections/phobos"
},
{
	"name": "SectorC",
	"img": "SectorC.webp",
	"notes": "Not much is known about these",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 5,
	"pinkyStagger": 0.5,
	"splay": "Yes",
	"switchProfile": "MX",
	"lighting": "RGB",
	"source": "https://github.com/omkbd/Sector"
},
{
	"name": "SectorD",
	"parent": "SectorC",
	"img": "SectorD.webp",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 1,
	"source": "inherit"
},
{
	"name": "SectorH",
	"parent": "SectorC",
	"img": "SectorH.webp",
	"keys": 64,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 1,
	"cornerKeys": 4,
	"pinkyStagger": 0,
	"source": "inherit"
},
{
	"name": "ReRedox",
	"parent": "Redox",
	"img": "ReRedox.webp",
	"notes": "A Redox redesign that reduces the size of inner keys and adds a display",
	"hotswap": "No",
	"displays": 1,
	"assembly": "Handwired",
	"source": "https://www.printables.com/pl/model/383665-reredox-redesign-of-a-redesign"
},
{
	"name": "DELPHI",
	"img": "DELPHI.webp",
	"shape": [
		"Monoblock",
		"Split"
	],
	"notes": "Can also be a monoblock if you'd like that",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": {
		"min": 40,
		"max": 42
	},
	"rows": 3,
	"cols": 6,
	"thumbKeys": {
		"min": 2,
		"max": 3
	},
	"pinkyStagger": 1,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"source": "https://github.com/JRiggles/DELPHI-kbd"
},
{
	"name": "Zodiark",
	"img": "Zodiark.webp",
	"notes": "Based on Sofle V2, structurally closer to Redox/ErgoDash",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 64,
		"max": 70
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 2,
	"cornerKeys": 4,
	"pinkyStagger": 0.4,
	"hotswap": "Yes",
	"switchProfile": [
		"MX",
		"Choc"
	],
	"keySpacing": "MX",
	"encoders": {
		"min": 0,
		"max": 6
	},
	"lighting": "RGB",
	"firmware": "QMK",
	"web": "https://www.splitlogic.xyz/",
	"source": "[v:\"soon\"] https://github.com/Aleblazer",
	"kit": "https://www.splitlogic.xyz/shop"
},
{
	"name": "0xPM",
	"img": "0xPM.webp",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"switchProfile": [
		"MX",
		"Choc"
	],
	"hotswap": true,
	"keySpacing": "MX",
	"firmware": "FAK",
	"caseType": "Included",
	"source": "https://github.com/llmerlos/0xPM"
},
{
	"name": "slabV",
	"img": "SlabV.webp",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"hotswap": [
		"No",
		"Yes"
	],
	"switchProfile": "MX",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/brickbots/slabv"
},
{
	"name": "Elora",
	"img": "Elora.webp",
	"notes": "Supports \"modules\" for additional functionality",
	"shape": "Split",
	"keys": 62,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 1,
	"pinkyStagger": 0.7,
	"hotswap": ["No", "Yes"],
	"switchProfile": ["MX", "Choc"],
	"keySpacing": "MX",
	"encoders": {"min": 0, "max": 6},
	"encoderType": "Knob",
	"pointingDevices": {"min": 0, "max": 2},
	"joysticks": {"min": 0, "max": 2},
	"displays": {"min": 0, "max": 2},
	"lighting": "Underglow",
	"firmware": "QMK",
	"software": "Vial",
	"kit": "https://splitkb.com/products/elora",
	"prebuilt": "[v:MX only!] https://splitkb.com/products/elora"
},
{
	"name": "Redpoll",
	"img": "Redpoll.webp",
	"shape": "Unibody",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"pinkyStagger": 0.7,
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": ["Handwired", "Parametric"],
	"web": "https://feierabendprojekte.wordpress.com/2024/01/13/my-new-travel-companion/",
	"source": [
		"[v:case] https://github.com/Azel4231/scad-keyboards",
		"[v:firmware] https://github.com/Azel4231/zmk-config"
	]
},
{
	"name": "Signum 3.0",
	"img": [
		"signum3.0_assembled_sm.jpg",
		"signum_3.0_pcb_options.jpg"
	],
	"notes": "Each column has 5-6 possible stagger options",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 48,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 3,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "Adjustable",
	"caseType": "None",
	"kit": "http://www.troyfletcher.net/shop.html",
	"prebuilt": "http://www.troyfletcher.net/shop.html"
},
{
	"name": "Signum 3.1",
	"img": [
		"signum_3.1_assembled.webp",
		"signum_3.1_pcb_small.jpg"
	],
	"notes": "Each column has 5-6 possible stagger options",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 3,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "Adjustable",
	"caseType": "None",
	"kit": "http://www.troyfletcher.net/shop.html",
	"prebuilt": "http://www.troyfletcher.net/shop.html"
},
{
	"name": "StarShip-Centurion",
	"img": "starship-centurion.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 39,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"innerKeys": 3,
	"pinkyStagger": 0.7,
	"hotswap": "No",
	"switchProfile": "MX",
	"trackballSize": 34,
	"lighting": "Simple",
	"caseType": "Included",
	"source": "https://github.com/protieusz/StarShip-Centurion"
},
{
	"name": "YAEMK",
	"img": "YAEMK.webp",
	"notes": "Pairs of thumb keys can be replaced with 2Us",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {
		"min": 64,
		"max": 66
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": {
		"min": 4,
		"max": 6
	},
	"innerKeys": 3,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 2,
	"encoderType": "Knob",
	"displays": {
		"min": 0,
		"max": 2
	},
	"lighting": "RGB",
	"firmware": "QMK",
	"caseType": "Included",
	"web": "https://karlk90.github.io/yaemk-split-kb/",
	"source": "https://github.com/KarlK90/yaemk-split-kb",
	"layoutRef": "https://karlk90.github.io/yaemk-split-kb/yaemk_layout_tester_a4.pdf"
},
{
	"name": "Kimiko",
	"img": "kimiko.webp",
	"shape": "Split",
	"stagger": "Column",
	"keys": {
		"min": 60,
		"max": 62
	},
	"rows": 4,
	"cols": 6,
	"thumbKeys": {
		"min": 6,
		"max": 7
	},
	"innerKeys": {
		"min": 0,
		"max": 1
	},
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {
		"min": 0,
		"max": 2
	},
	"encoderType": "Knob",
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "Vial",
	"caseType": "Included",
	"kit": "https://keycapsss.com/keyboard-parts/pcbs/265/kimiko-rev2-split-keyboard-pcb?c=6",
	"buildGuide": "https://github.com/Keycapsss/Kimiko"
},
{
	"name": "Anglerfish",
	"img": "Anglerfish.jpg",
	"notes": [
		"\"Anglerfish, a split keyboard with 3x5 column staggered keys, two thumb keys, and a trackpoint.",
		"",
		"The Trackpoint can be placed on either side, and the PCB is a reversible design.\""
	],
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"innerKeys": 0,
	"outerKeys": 0,
	"cornerKeys": 0,
	"navCluster": "None",
	"numpad": "None",
	"splay": "No",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Other",
	"encoders": 0,
	"pointingDevices": 1,
	"trackballs": 0,
	"trackpads": 0,
	"trackpoints": 1,
	"dpads": 0,
	"displays": 0,
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": "PCB",
	"wristPads": "None",
	"tenting": ["Fixed", "Legs"],
	"source": "https://github.com/vinniefranco/anglerfish-splitk-keeb",
	"layoutRef": "https://github.com/vinniefranco/anglerfish-splitk-keeb/blob/main/assets/pcb/anglerfish.kicad_pcb"
},
{
	"name": "crabapplepad",
	"img": "crabapplepad.jpeg",
	"notes": "A folding keyboard with a spot for Magic Trackpad in the middle. Uses Kailh X-switches",
	"shape": [
		"Unibody",
		"Special"
	],
	"stagger": "Column",
	"connection": [
		"Wired",
		"Bluetooth"
	],
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "KXSwitch",
	"lighting": "None",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/kumekay/crabapplepad"
},
{
	"name": "IF-CORNE",
	"img": "if-corne.webp",
	"notes": "Runs (a fork of) Vial, but cannot be re-flashed by end user.",
	"parent": "Corne/crkbd",
	"connection": "Wireless",
	"switchProfile": "MX",
	"software": [
		"Vial",
		"Custom"
	],
	"prebuilt": "https://www.ergokbd.com/products/if-corne-wireless2-4g-hotswap-split-mechanical-keyboard-pre-soldered-acrylic-vial-programmable-corne-crkb"
},
{
	"name": "Maltron L90",
	"img": "Maltron-L90.webp",
	"notes": [
		"Photo from ErgoCanada.",
		"One of the longer-running keyboards.",
		"There is also a flat version of this keyboard that a bit of a weird spot."
	],
	"shape": ["Unibody", "Keywell"],
	"stagger": "Column",
	"keys": 126,
	"rows": 5,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 7,
	"numpad": "Full",
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": "MX",
	"pointingDevices": {"min": 0, "max": 1},
	"trackballs": {"min": 0, "max": 1},
	"lighting": "None",
	"firmware": "Custom",
	"prebuilt": "https://www.maltron.com/store/p20/Maltron_L90_dual_hand_fully_ergonomic_%283D%29_keyboard_-_US_English.html"
},
{
	"name": "Unicorne",
	"img": "unicorne.webp",
	"notes": "Not to be confused with BoardSource's Unicorne, a split Corne variant.",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {"min": 42, "max": 44},
	"rows": 3,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": {"min": 3, "max": 4},
	"pinkyStagger": 0.6,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {"min": 0, "max": 2},
	"encoderType": "Knob",
	"displays": {"min": 0, "max": 1},
	"lighting": "Underglow",
	"assembly": "PCB",
	"source": "https://github.com/yanghu/unicorne"
},
{
	"name": "Architeuthis dux (a.dux)",
	"img": "adux.webp",
	"shape": "Split",
	"stagger": "Column",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 1,
	"splay": "Yes",
	"hotswap": ["No", "Yes"],
	"assembly": "Diodeless",
	"switchProfile": "Choc",
	"source": "https://github.com/tapioki/cephalopoda/tree/main/Architeuthis%20dux"
},
{
	"name": "Razer36 / Rzr36",
	"img": "razer36.webp",
	"shape": "Split",
	"connection": "Bluetooth",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "Choc",
	"caseType": "Included",
	"source": "https://github.com/MReavley/Razer36"
},
{
	"name": "Prime52",
	"img": "prime52.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 3,
	"innerKeys": 2,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": ["Choc", "ChocV2"],
	"encoders": 4,
	"encoderType": ["Knob", "Wheel"],
	"pointingDevices": 2,
	"joysticks": 2,
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "Vial",
	"assembly": "PCB",
	"caseType": "Included",
	"source": "https://github.com/DreaM117er/Prime52/"
},
{
	"name": "Ferris 0.1",
	"img": "ferris.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 2,
	"hotswap": "No",
	"switchProfile": ["MX", "Choc", "ChocMini"],
	"keySpacing": "MX",
	"firmware": ["QMK", "ZMK"],
	"assembly": "PCB",
	"caseType": "None",
	"source": [
		"[v:Choc] https://github.com/pierrechevalier83/ferris/blob/main/0.1/base/readme.md",
		"[v:Mini] https://github.com/pierrechevalier83/ferris/blob/main/0.1/low/readme.md",
		"[v:High (MX)] https://github.com/pierrechevalier83/ferris/blob/main/0.1/high/readme.md",
	]
},
{
	"name": "Ferris 0.1 - Compact",
	"parent": "Ferris 0.1",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"source": "https://github.com/pierrechevalier83/ferris/blob/main/0.1/compact/readme.md"
},
{
	"name": "Ferris 0.2",
	"parent": "Ferris 0.1",
	"switchProfile": ["Choc", "ChocMini"],
	"keySpacing": "Choc",
	"source": [
		"[v:Compact] https://github.com/pierrechevalier83/ferris/blob/main/0.2/compact/readme.md",
		"[v:Mini] https://github.com/pierrechevalier83/ferris/blob/main/0.2/mini/readme.md"
	]
},
{
	"name": "Ferris 0.2 - Bling",
	"parent": "Ferris 0.1",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"tenting": "Mount",
	"caseType": "Included",
	"source": "https://github.com/pierrechevalier83/ferris/blob/main/0.2/bling/readme.md"
},
{
	"name": "Ferris 0.2 - High",
	"parent": "Ferris 0.1",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"source": "https://github.com/pierrechevalier83/ferris/blob/main/0.2/high/readme.md"
},
{
	"name": "Zaphod Lite",
	"img": "zaphod-lite.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"displays": 1,
	"lighting": "None",
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://gitlab.com/lpgalaxy/zaphod/-/tree/main/lite"
},
{
	"name": "Demeter",
	"img": "demeter.webp",
	"notes": "Features reachy thumbs",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.8,
	"splay": "PinkyOnly",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": ["QMK", "ZMK"],
	"assembly": ["PCB", "Diodeless"],
	"source": "https://github.com/davidphilipbarr/demeter"
},
{
	"name": "Duet",
	"img": "duet.jpg",
	"notes": "A split keyboard with a magnetic connector",
	"shape": ["Unibody", "Split", "Special"],
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 40,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": -1,
	"pinkyStagger": 0.15,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"encoders": 2,
	"encoderType": "Knob",
	"displays": {"min": 0, "max": 1},
	"firmware": "ZMK",
	"caseType": "Included",
	"source": "https://github.com/zzeneg/duet"
},
{
	"name": "Rhymestone",
	"img": "rhymestone.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 40,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"displays": {"min": 0, "max": 2},
	"lighting": "RGB",
	"firmware": "QMK",
	"caseType": "Included",
	"source": "https://github.com/marksard/Keyboards",
	"kit": [
		"https://keebd.com/products/rhymestone-40-split-keyboard-kit",
		"https://www.boardsource.xyz/products/Rhymestone",
		"https://customkbd.com/products/rhymestone-keyboard-kit"
	]
},
{
	"name": "Sofle Hybrid",
	"img": "ergomech-sofle-hybrid.jpg",
	"notes": "Replaces the right encoder with a 5-way switch",
	"parent": "Sofle Choc",
	"connection": ["Wired", "Bluetooth"],
	"switchProfile": ["MX", "Choc"],
	"encoders": 1,
	"encoderType": "Wheel",
	"dpads": 1,
	"firmware": ["QMK", "ZMK"],
	"prebuilt": [
		"https://ergomech.store/shop/sofle-hybrid-aluminum-version-exclusive-403",
		"https://ergomech.store/shop/sofle-hybrid-sandwich-style-423"
	]
},
{
	"name": "Sofle GLP",
	"parent": "Sofle Hybrid",
	"img": "sofle-glp.webp",
	"switchProfile": "GateronLP",
	"prebuilt": "https://ergomech.store/shop/sofle-glp-aluminum-version-exclusive-gateron-low-profile-443",
},
{
	"name": "tamatama",
	"img": "tamatama.jpg",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 28,
	"rows": 3,
	"cols": 4,
	"thumbKeys": 2,
	"pinkyStagger": 0.6,
	"hotswap": "No",
	"switchProfile": "Choc",
	"trackballs": 2,
	"firmware": "QMK",
	"assembly": "Handwired",
	"source": "https://github.com/dlip/tamatama",
	"pointingDevices": 2
},
{
	"name": "JESK56",
	"img": "jesk56.jpg",
	"notes": "Uses a novel type of key matrix to have adequate rollover on a unibody diodeless keyboard.",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"hotswap": "No",
	"switchProfile": "MX",
	"assembly": "Diodeless",
	"caseType": "Included",
	"source": "https://github.com/triliu/JESK56"
},
{
	"name": "Mantis",
	"img": "mantis-x3.jpg",
	"notes": "Layered design for hexagonal keycaps",
	"shape": ["Unibody", "Special"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 40,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 4,
	"outerKeys": 1,
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": "Choc",
	"tenting": "Fixed",
	"caseType": "Included",
	"source": "https://github.com/fxkuehl/mantis"
},
{
	"name": "Abyss",
	"img": "abyss.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.9,
	"splay": "Yes",
	"hotswap": ["No", "Yes"],
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"assembly": ["PCB", "Diodeless"],
	"caseType": "None",
	"source": "https://github.com/kvietcong/the-abyss"
},
{
	"name": "AWKB",
	"img": "awkb.jpeg",
	"shape": "Split",
	"stagger": "Column",
	"keys": {"min": 35, "max": 36},
	"rows": 3,
	"cols": 5,
	"thumbKeys": {"min": 2, "max": 3},
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {"min": 0, "max": 1},
	"trackballs": 1,
	"firmware": "QMK",
	"caseType": "None",
	"source": "https://github.com/wj-zhe/awkb",
	"pointingDevices": 1
},
{
	"name": "Ch55p34",
	"img": "Ch55p34.jpg",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "FAK",
	"source": "https://github.com/doesntfazer/Ch55p34-keyboard"
},
{
	"name": "Kai Ascend",
	"img": "ascend.jpg",
	"notes": "Uses Choc V1 switches for thumb keys",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"outerKeys": 1,
	"pinkyStagger": 0.7,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 2,
	"displays": 2,
	"firmware": "ZMK",
	"source": "https://github.com/kaihchang/Ascend_splay_split_keyboard"
},
{
	"name": "Cygnus",
	"img": "cygnus.jpg",
	"notes": [
		"A few variants of the keyboard exist.",
		"Uses mini-PCBs for switches."
	],
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": [{"min": 36, "max": 36}, {"min": 42, "max": 42}],
	"rows": 3,
	"cols": {"min": 5, "max": 6},
	"thumbKeys": 3,
	"pinkyStagger": 0.5,
	"switchProfile": "MX",
	"firmware": ["QMK", "ZMK"],
	"assembly": "Handwired",
	"source": "https://github.com/juhakaup/keyboards/tree/main/Cygnus%20v1.0"
},
{
	"name": "Cygnus (4x6)",
	"parent": "Cygnus",
	"img": "cygnus-4x6.webp",
	"rows": 4,
	"keys": 54,
	"cols": 6,
	"web": "https://github.com/juhakaup/keyboards/blob/main/Cygnus%20v1.0/4x6_build_notes.md",
	"source": "https://github.com/juhakaup/keyboards/tree/main/Cygnus%20v1.0"
},
{
	"name": "FAW36",
	"img": "FAW36.jpg",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": ["Wired", "Bluetooth"],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": {"min": 0, "max": 2},
	"encoderType": "Knob",
	"firmware": "ZMK",
	"source": [
		"https://github.com/Germain-Gadel/faw36",
		"https://github.com/Germain-Gadel/zmk-config-faw36"
	],
	"kit": "https://keycapsss.com/keyboard-parts/pcbs/253/faw36-ortholinear-split-keyboard-pcb"
},
{
	"name": "Niztyl",
	"img": "niztyl.jpg",
	"notes": "Uses omnipolar hall-effect sensors",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"hotswap": "No",
	"switchProfile": "Other",
	"assembly": "Handwired",
	"source": "https://github.com/geoffder/dometyl-keyboard/tree/main/things/niztyl"
},
{
	"name": "luakeeb",
	"img": "luakeeb.jpg",
	"notes": [
		"Not related to Lua programming language in any way.",
		"Requires a custom case to use trackballs."
	],
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": [{"min": 36, "max": 36}, {"min": 42, "max": 42}],
	"rows": 3,
	"cols": {"min": 5, "max": 6},
	"thumbKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 2,
	"trackballs": {"min": 0, "max": 2},
	"trackballSize": 4.4,
	"lighting": "RGB",
	"firmware": ["QMK", "ZMK"],
	"caseType": "Included",
	"kit": "https://fingerpunch.xyz/product/luakeeb/"
},
{
	"name": "Porcupine",
	"img": "porcupine_prototype_final.jpg",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": [{"min": 36, "max": 36}, {"min": 38, "max": 38}, {"min": 42, "max": 42}],
	"rows": 3,
	"cols": {"min": 5, "max": 6},
	"thumbKeys": {"min": 3, "max": 4},
	"pinkyStagger": 1,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "QMK",
	"tenting": "Mount",
	"caseType": "None",
	"source": "https://github.com/anarion80/porcupine"
},
{
	"name": "Corne/crkbd V4",
	"img": "corne-v4.webp",
	"notes": "Inner keys can be replaced with encoders.",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {"min": 42, "max": 46},
	"rows": 3,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 3,
	"innerKeys": {"min": 0, "max": 2},
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc", "ChocV2"],
	"keySpacing": "MX",
	"encoders": {"min": 0, "max": 4},
	"encoderType": "Knob",
	"displays": {"min": 0, "max": 2},
	"lighting": ["None", "RGB"],
	"caseType": "Included",
	"extras": [
		"[v:Wireless choc case] https://www.printables.com/pl/model/972917-corne-choc-wireless-v4-case",
	],
	"source": [
		"[v:MX] https://github.com/foostan/crkbd/blob/main/docs/corne-cherry/v4/buildguide_en.md",
		"[v:Choc] https://github.com/foostan/crkbd/blob/main/docs/corne-chocolate/v4/buildguide_en.md"
	]
},
{
	"name": "Gull",
	"img": "gull.webp",
	"notes": "No handwiring, only flexible PCBs and acrylic plates",
	"shape": ["Unibody", "Keywell", "Special"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"hotswap": "No",
	"switchProfile": "Choc",
	"assembly": "PCB",
	"caseType": "Included",
	"source": "https://github.com/Sneftel/gull"
},
{
	"name": "SOWGull",
	"parent": "Gull",
	"img": "SOWGull.webp",
	"shape": ["Split", "Keywell", "Special"],
	"source": "https://github.com/Sneftel/gull"
},
{
	"name": "Cornepad",
	"img": "cornepad.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 52,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"numpad": "Mini",
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 2,
	"encoderType": "Knob",
	"firmware": "QMK",
	"software": "Vial",
	"assembly": "Handwired",
	"source": "https://from2d.com/freebies/cornepad/"
},
/*{
	"name": "SoflePLUS Trackpad",
	"img": "sofle-plus-tp.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"numpad": "None",
	"splay": "No",
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": "MX",
	"encoders": 1,
	"encoderType": ["Knob", "Wheel"],
	"pointingDevices": 0,
	"trackballs": 0,
	"trackpads": 1,
	"displays": 1,
	"lighting": "Underglow",
	"firmware": "QMK",
	"software": "Vial",
	"assembly": "PCB",
	"ctlFootprint": "Pro Micro",
	"ctlName": "RP2040",
	"wristPads": "None",
	"tenting": "None",
	"caseType": "Included",
	"web": "!https://xcmkb.com",
	"prebuilt": [
		"!https://xcmkb.com/products/sofleplus-trackpad-mx",
		"!https://xcmkb.com/products/sofleplus-trackpad-lp"
	]
},*/
{
	"name": "Lea",
	"img": "Lea.webp",
	"notes": "A Sofle V2-like keyboard with underglow and an ARM Cortex-M0+ STM32 controller.",
	"parent": "Sofle V2",
	"connection": "Wired",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"lighting": ["RGB", "Underglow"],
	"firmware": "QMK",
	"software": "Vial",
	"ctlName": "Other",
	"caseType": "Included",
	"prebuilt": "https://splitted.space/keyboards/lea"
},
{
	"name": "Cleo",
	"img": "Cleo.webp",
	"parent": "Corne/crkbd",
	"shape": "Split",
	"notes": "A Corne (V3)-like keyboard with ARM Cortex-M0+ STM32",
	"connection": "Wired",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"lighting": "RGB",
	"caseType": "Included",
	"prebuilt": "https://splitted.space/keyboards/cleo"
},
{
	"name": "Shrimp42",
	"img": "Shrimp42.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.9,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": ["MX", "Alps"],
	"firmware": "QMK",
	"software": "Vial",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlPinCount": 24,
	"ctlName": "ATmega32U4",
	"caseType": "Included",
	"source": "https://github.com/GreenMashedPotato/Shrimp42"
},
{
	"name": "ErgoDash Mini",
	"img": "ergodash-mini.webp",
	"parent": "ErgoDash",
	"keys": 56,
	"rows": 3,
	"innerKeys": 2,
	"source": "https://github.com/omkbd/ErgoDash/tree/master/mini",
	"kit": [
		"https://shop.yushakobo.jp/en/products/ergodash-mini",
		"https://keeb-finder.com/keyboards/ergodash-mini-keyboard-kit"
	]
},
{
	"name": "Skean",
	"img": "Skean.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": 1,
	"navCluster": "None",
	"numpad": "None",
	"splay": "No",
	"hotswap": "Yes",
	"switchProfile": ["MX", "Alps"],
	"keySpacing": "MX",
	"encoders": 0,
	"pointingDevices": 0,
	"displays": 0,
	"firmware": "ZMK",
	"assembly": "PCB",
	"ctlCount": 2,
	"ctlFootprint": "Other",
	"ctlPinCount": 0,
	"ctlName": "nRF52840",
	"wristPads": "None",
	"tenting": "None",
	"source": "https://github.com/krikun98/Skean"
},
{
	"name": "Jian",
	"img": "Jian.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": 0,
	"outerKeys": 1,
	"cornerKeys": 0,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.5,
	"switchProfile": ["MX", "Choc", "Alps"],
	"encoders": 0,
	"pointingDevices": 0,
	"trackballs": 0,
	"trackpads": 0,
	"trackpoints": 0,
	"dpads": 0,
	"displays": 0,
	"lighting": ["Simple", "Underglow"],
	"firmware": "QMK",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlPinCount": 24,
	"web": [
		"https://t.me/KgOfHedgehogs"
	],
	"source": "https://github.com/KGOH/Jian-Info?tab=readme-ov-file",
},
{
	"name": "Jorian 840",
	"img": "jorian840.webp",
	"parent": "Jian",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": 0,
	"outerKeys": 1,
	"cornerKeys": 0,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Alps", "Other"],
	"encoders": 0,
	"pointingDevices": 0,
	"trackballs": 0,
	"trackpads": 0,
	"trackpoints": 0,
	"dpads": 0,
	"displays": 0,
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": "PCB",
	"ctlCount": 2,
	"ctlFootprint": ["Onboard/SMD", "Other"],
	"ctlPinCount": 0,
	"ctlName": "nRF52840",
	"wristPads": "None",
	"tenting": "None",
	"web": "http://www.keyboard-layout-editor.com/#/gists/4b6c2af67148f58ddd6c6b2976c4370f",
	"source": "https://github.com/krikun98/jorian840?tab=readme-ov-file",
},
{
	"name": "Mitosis",
	"img": "Mitosis.webp",
	"notes": "Uses 3x nrf51822 chips ",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wireless",
	"keys": 46,
	"rows": 3,
	"cols": 5,
	"thumbKeys": {"min": 4, "max": 8},
	"cornerKeys": {"min": 0, "max": 4},
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.5,
	"switchProfile": "MX",
	"encoders": 0,
	"pointingDevices": 0,
	"firmware": "QMK",
	"assembly": "PCB",
	"ctlCount": 4,
	"ctlFootprint": ["Pro Micro", "Onboard/SMD", "Other"],
	"ctlPinCount": 24,
	"ctlName": ["ATmega32U4", "Other"],
	"source": "https://github.com/babarrett/mitosis-docs/blob/master/mitosis-README.md",
	"prebuilt": "https://flashquark.com/product/gb-mitosis-wireless-split-ergonomic-keyboard-w-acrylic-case/"
},
{
	"name": "Naked48LED",
	"img": "naked48.webp",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": ["Wired", "Bluetooth"],
	"keys": 48,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 6,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"lighting": "RGB",
	"ctlFootprint": "Pro Micro",
	"ctlName": ["RP2040", "ATmega32U4", "nRF52840"],
	"kit": [
		"https://www.littlekeyboards.com/products/naked48led-keyboard-kit",
		"https://salicylic-acid3.booth.pm/items/1271568"
	]
},
{
	"name": "Naked60BMP",
	"parent": "Naked48LED",
	"img": "naked60.webp",
	"keys": 60,
	"rows": 4,
	"kit": "https://www.littlekeyboards.com/products/naked60bmp-keyboard-kit"
},
{
	"name": "Frigate",
	"img": "Frigate.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": [[32], [34]],
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.75,
	"splay": "No",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"trackpads": 1,
	"firmware": "QMK",
	"software": "Vial",
	"ctlCount": 1,
	"ctlFootprint": "RP2040-Zero",
	"ctlName": "RP2040",
	"caseType": "Included",
	"web": "https://www.reddit.com/r/ErgoMechKeyboards/comments/13fpjps/frigate_early_adopters_is_now_available_to_order/",
	"source": [
		"https://github.com/doesntfazer/frigate",
		"https://github.com/doesntfazer/Keyboard-Dweebs-Firmware-repository/tree/main/VIAL-QMK/Frigate"
	]
},
{
	"name": "Goshawk",
	"img": "Goshawk.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"outerKeys": 1,
	"pinkyStagger": 0.5,
	"splay": "Yes",
	"hotswap": "No",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"firmware": "ZMK",
	"assembly": "Handwired",
	"ctlCount": 1,
	"ctlFootprint": "Nice!Nano",
	"ctlPinCount": 20,
	"ctlName": "nRF52840",
	"source": [
		"https://github.com/taylorzr/goshawk?tab=readme-ov-file",
		"https://github.com/taylorzr/zmk-config/tree/master/config/boards/shields/goshawk"
	]
},
{
	"name": "MagWave44",
	"img": "MagWave44.webp",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.5,
	"splay": "PinkyOnly",
	"switchProfile": "GateronLP",
	"encoders": {"min": 0, "max": 2},
	"encoderType": "Knob",
	"lighting": "Simple",
	"firmware": "QMK",
	"software": "Vial",
	"assembly": ["PCB", "Handwired"],
	"ctlCount": 2,
	"ctlFootprint": ["Pro Micro", "RP2040-Zero"],
	"ctlPinCount": 23,
	"ctlName": ["RP2040", "ATmega32U4"],
	"tenting": "Mount",
	"source": "https://github.com/DreaM117er/MagWave44"
},
{
	"name": "Tightyl",
	"img": "Tightyl.webp",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 2,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "Handwired",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlName": "ATmega32U4",
	"caseType": "Included",
	"source": "https://github.com/okke-formsma/dactyl-manuform-tight"
},
{
	"name": "hypergolic",
	"img": "hypergolic.webp",
	"notes": [
		"iambroom lists all these as inspirations on the low profile keyboard subreddit (14 May 2021): \"Meishi (foostan), 5plit, Kyria, Gergoplex, Ferris, Corne, Squiggle, Absolem, Pseudoku's drawings (Tron?), Jian, Jorian, Apoptosis, Miniaxe\"",
		"https://discord.com/channels/669011382284451861/812354221839351868/842713617417764894"
	],
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.8,
	"splay": "Yes",
	"hotswap": "No",
	"switchProfile": ["Choc", "ChocMini"],
	"keySpacing": "Choc",
	"encoders": 0,
	"pointingDevices": 0,
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": ["PCB", "Diodeless"],
	"ctlCount": 2,
	"ctlFootprint": "Nice!Nano",
	"ctlPinCount": 26,
	"ctlName": "nRF52840",
	"caseType": "None",
	"source": "https://github.com/davidphilipbarr/hypergolic"
},
{
	"name": "ADuck",
	"img": "ADuck.webp",
	"parent": "Architeuthis dux (a.dux)",
	"shape": "Split",
	"connection": ["Wired", "Bluetooth"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.5,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 0,
	"pointingDevices": 0,
	"displays": 0,
	"firmware": ["QMK", "ZMK"],
	"assembly": ["PCB", "Diodeless"],
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlPinCount": 24,
	"ctlName": ["ATmega32U4", "nRF52840"],
	"tenting": "None",
	"source": "https://github.com/lapidot/ADuck"
},
{
	"name": "48keys",
	"img": "48keys.webp",
	"notes": [
		"This board only exists as a 3D model AFAICT. According to creator's reddit profile, he never built it.",
		"https://www.reddit.com/user/ihihbs/submitted/"
	],
	"shape": "Unibody",
	"keys": 48,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"cornerKeys": 3,
	"pinkyStagger": 0.5,
	"splay": "No",
	"assembly": "Handwired",
	"source": "https://github.com/luke-schutt/keyboards/blob/main/48keys/48keys.stl"
},
{
	"name": "trochilidae - Rufous",
	"img": "rufous.webp",
	"notes": [
		"The GitHub repo indicates two separate keyboards, Rufous and Berylline.",
		"",
		"Both are generated with Ergogen"
	],
	"parent": "hummingbird",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.75,
	"splay": "Yes",
	"hotswap": "No",
	"switchProfile": ["MX", "Choc", "ChocV2", "ChocMini"],
	"keySpacing": ["MX", "MinMX", "Choc"],
	"encoders": 0,
	"pointingDevices": 0,
	"assembly": ["PCB", "Adjustable"],
	"ctlCount": 1,
	"ctlFootprint": "XIAO",
	"ctlPinCount": 14,
	"ctlName": ["RP2040", "nRF52840"],
	"source": "https://github.com/jcmkk3/trochilidae"
},
{
	"name": "trochilidae - Berylline",
	"img": "berylline.webp",
	"notes": [
		"The GitHub repo indicates two separate keyboards, Rufous and Berylline.",
		"",
		"Both are generated with Ergogen"
	],
	"parent": "trochilidae - Rufous",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 30,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.75,
	"splay": "Yes",
	"hotswap": "No",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": ["MX", "MinMX", "Choc"],
	"encoders": 0,
	"pointingDevices": 0,
	"firmware": "ZMK",
	"assembly": ["PCB", "Adjustable"],
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlPinCount": 14,
	"ctlName": "nRF52840",
	"tenting": "Mount",
	"source": "https://github.com/jcmkk3/trochilidae"
},
{
	"name": "Pierce",
	"img": "Pierce.webp",
	"notes": "Uses 2-3 YJ-14015 / Core51822 (B) for 2.4ghz wireless. Uses Pro Micro for either one half (wired) or the dongle (full wireless) for QMK. Both halves are connected wirelessly regardless.  Requires ST-Link programmer to program wireless chips.",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Wireless"],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.75,
	"splay": "No",
	"hotswap": "No",
	"switchProfile": ["MX", "Choc", "Alps"],
	"keySpacing": "MX",
	"encoders": 0,
	"pointingDevices": {"min": 0, "max": 1},
	"trackpoints": {"min": 0, "max": 1},
	"displays": 0,
	"lighting": "Unknown",
	"firmware": "QMK",
	"assembly": "PCB",
	"ctlCount": {"min": 3, "max": 4},
	"ctlFootprint": ["Pro Micro", "Onboard/SMD"],
	"ctlPinCount": {"min": 24, "max": 36},
	"ctlName": ["ATmega32U4", "Other"],
	"source": "https://github.com/durken1/pierce/blob/master/README.md",
	"kit": "https://shop.beekeeb.com/product/wireless-pierce-2-keyboard-kit/"
},
{
	"name": "gurt-portable",
	"img": "gurt-portable.webp",
	"notes": "Uses three (3) YJ-14015 / Core51822 (B) for 2.4ghz wireless. Uses Pro Micro dongle for QMK. Requires ST-Link programmer to program wireless chips.",
	"parent": "Pierce",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wireless",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.5,
	"splay": "PinkyOnly",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 0,
	"pointingDevices": 0,
	"trackpoints": 0,
	"displays": 0,
	"lighting": "Unknown",
	"firmware": "QMK",
	"assembly": "PCB",
	"ctlCount": 4,
	"ctlFootprint": ["Pro Micro", "Onboard/SMD"],
	"ctlPinCount": {"min": 24, "max": 36},
	"ctlName": ["ATmega32U4", "Other"],
	"source": "https://github.com/CarlFabian/gurt-portable?tab=readme-ov-file"
},
{
	"name": "CREPE",
	"img": "CREPE.webp",
	"shape": "Monoblock",
	"stagger": "Ortho",
	"connection": ["Wired", "Bluetooth"],
	"keys": 40,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"hotswap": "No",
	"switchProfile": "KXSwitch",
	"lighting": "None",
	"firmware": ["QMK", "ZMK"],
	"ctlCount": 1,
	"ctlFootprint": "Pro Micro",
	"caseType": "None",
	"source": "https://github.com/hazels-garage/crepe"
},
{
	"name": "dust",
	"img": "dust.webp",
	"notes": "\"dust is my attempt at making the thinnest sweep-alike.\"",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "KXSwitch",
	"lighting": "None",
	"firmware": ["QMK", "ZMK"],
	"ctlCount": 2,
	"ctlFootprint": "XIAO",
	"caseType": "None",
	"source": "https://github.com/hazels-garage/dust"
},
/*{
	"name": "mini42",
	"img": "mini42.webp",
	"notes": "A Corne-like keyboard with Choc spacing",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"lighting": ["RGB", "Underglow"],
	"firmware": "QMK",
	"software": ["VIA", "Vial"],
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"caseType": "Included",
	"prebuilt": "https://controller.works/products/mini42-low-profile-ergonomic-keyboard"
},*/
{
	"name": "BR/KN",
	"img": "brkn.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 28,
	"rows": 3,
	"cols": 4,
	"thumbKeys": 2,
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "CFX",
	"trackballs": 2,
	"trackballSize": 16,
	"lighting": "Underglow",
	"firmware": "QMK",
	"ctlCount": 2,
	"ctlFootprint": "RP2040-Zero",
	"caseType": "Included",
	"source": "https://github.com/miketronic/brkn-keyboard",
},
{
	"name": "vfk-001",
	"img": "vfk-001.webp",
	"notes": "A folding vertical dactyl-style keyboard with removable stabilizer in the middle",
	"shape": ["Split", "Keywell", "Special"],
	"stagger": "Row",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"trackballs": {"min": 0, "max": 1},
	"trackballSize": 34,
	"lighting": "None",
	"firmware": "QMK",
	"assembly": "Handwired",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"tenting": "Legs",
	"caseType": "Included",
	"source": "https://github.com/v0Ch/vfk-001"
},
{
	"name": "Chimera Ortho",
	"img": "chimera-ortho.webp",
	"notes": "Feel free to submit a correction if you figure out the gerber",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wireless",
	"keys": 46,
	"rows": 3,
	"cols": 7,
	"thumbKeys": 2,
	"switchProfile": "MX",
	"caseType": "Included",
	"source": "https://github.com/jawn-smith/Chimera"
},
{
	"name": "Rock On V1",
	"img": "rock-on-v1.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 66,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 4,
	"cornerKeys": 5,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"displays": {"min": 0, "max": 1},
	"lighting": "RGB",
	"firmware": "QMK",
	"ctlCount": 1,
	"ctlFootprint": ["Elite-C", "Nice!Nano"],
	"caseType": "Included",
	"kit": "https://fingerpunch.xyz/product/rock-on/"
},
{
	"name": "Rock On V2",
	"img": "rock-on-v2.webp",
	"parent": "Rock On V1",
	"keys": {"min": 64, "max": 66},
	"encoders": {"min": 0, "max": 2},
	"encoderType": ["Knob", "Wheel"],
	"pointingDevices": {"min": 0, "max": 1},
	"trackballs": {"min": 0, "max": 1},
	"trackpads": {"min": 0, "max": 1},
	"kit": "https://fingerpunch.xyz/product/rock-on-v2/"
},
{
	"name": "Rock On V3",
	"img": "rock-on-v3.webp",
	"parent": "Rock On V1",
	"keys": {"min": 66, "max": 69},
	"encoders": {"min": 0, "max": 3},
	"pointingDevices": {"min": 0, "max": 1},
	"trackballs": {"min": 0, "max": 1},
	"trackpads": {"min": 0, "max": 1},
	"kit": "https://fingerpunch.xyz/product/rock-on-v3/"
},
{
	"name": "eek!",
	"img": "eek.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": "MX",
	"ctlCount": 1,
	"ctlFootprint": "Pro Micro",
	"caseType": "Included",
	"source": "https://github.com/Klackygears/eek_doc"
},
{
	"name": "ergoTHWACK",
	"img": "ergoTHWACK.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 69,
	"rows": 4,
	"cols": 6,
	"thumbKeys": {"min": 4, "max": 5},
	"innerKeys": {"min": 1, "max": 3},
	"cornerKeys": 4,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "GateronLP",
	"encoders": 3,
	"encoderType": "Knob",
	"trackpoints": 1,
	"lighting": ["RGB", "Underglow"],
	"firmware": "ZMK",
	"ctlCount": 2,
	"wristPads": "Integrated",
	"tenting": "Legs",
	"caseType": "Included",
	"web": "https://www.claytonbford.com/portfolio/ergothwack",
	"source": "https://github.com/claybford/ergothwack",
	"pointingDevices": 1
},
{
	"name": "Kurp",
	"img": "kurp.webp",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": ["Wired", "Bluetooth"],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"hotswap": "No",
	"switchProfile": "Choc",
	"displays": {"min": 0, "max": 1},
	"lighting": "None",
	"firmware": ["QMK", "ZMK"],
	"ctlFootprint": "Pro Micro",
	"caseType": "Included",
	"source": "https://github.com/hazels-garage/kurp"
},
{
	"name": "PolyKybd Split72",
	"img": "polykybd.webp",
	"notes": "Featuring little displays in keys",
	"shape": ["Split", "Special"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 72,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 3,
	"cornerKeys": 4,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 1,
	"trackpads": 1,
	"displays": 2,
	"lighting": "Simple",
	"firmware": "QMK",
	"ctlCount": 2,
	"source": "https://github.com/thpoll83/PolyKybd",
	"kit": "https://github.com/thpoll83/PolyKybd"
},
{
	"name": "Form Uno",
	"img": "form-uno.webp",
	"notes": "Based on Corne; also has an option for \"arrow row\"",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": {"min": 3, "max": 4},
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"ctlCount": 1,
	"ctlName": "!RP2040 Tiny",
	"caseType": "Included",
	"source": "https://github.com/phamfoo/form-uno"
},
{
	"name": "Form Neo",
	"img": "form-neo.webp",
	"notes": "A low[er]-profile version of Form Uno",
	"parent": "Form Uno",
	"source": "https://github.com/phamfoo/form-neo"
},
{
	"name": "Wubbo",
	"img": "wubbo.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"outerKeys": 1,
	"splay": "PinkyOnly",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"ctlCount": 2,
	"ctlName": "!nRF52840",
	"caseType": "Included",
	"source": "https://github.com/cacheworks/Wubbo"
},
{
	"name": "cool536",
	"img": "cool536.webp",
	"shape": "Split",
	"stagger": "Column",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": "MX",
	"encoders": {"min": 2, "max": 4},
	"encoderType": "Knob",
	"trackballs": {"min": 0, "max": 1},
	"trackballSize": 4.4,
	"lighting": "None",
	"firmware": "QMK",
	"software": "Remap",
	"ctlCount": 1,
	"ctlFootprint": "Pro Micro",
	"source": "https://github.com/telzo2000/cool536",
	"kit": "https://booth.pm/en/items/4190386"
},
{
	"name": "UnSplit",
	"img": "unsplit.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"keys": 44,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.7,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"ctlCount": 1,
	"ctlFootprint": ["Onboard/SMD", "!ATMega32u4-AU"],
	"source": "https://github.com/swiftrax/UnSplit"
},
{
	"name": "crowkb",
	"img": "crowkb.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 46,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 5,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": ["QMK", "ZMK"],
	"ctlCount": 2,
	"caseType": "Included",
	"source": "https://github.com/c-botz/crowkb/tree/main"
},
{
	"name": "SpUnLy58",
	"img": "SpUnLy58.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"outerKeys": 0,
	"cornerKeys": 0,
	"pinkyStagger": 1,
	"splay": "Yes",
	"hotswap": ["No", "Yes"],
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"ctlCount": 1,
	"ctlFootprint": "Nice!Nano",
	"caseType": "Included",
	"source": "https://github.com/Giraffasax/SpUnLy58",
	"layoutRef": "SKBC"
},
{
	"name": "Desolation",
	"img": "Desolation.webp",
	"notes": "And 4 pushbuttons!",
	"shape": "Unibody",
	"stagger": "Ortho",
	"connection": "WiredHalf",
	"keys": [[22], [28], [34]],
	"rows": 3,
	"cols": {"min": 3, "max": 5},
	"thumbKeys": 2,
	"pushButtons": 4,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "CFX",
	"displays": {"min": 0, "max": 1},
	"lighting": "None",
	"firmware": "ZMK",
	"ctlCount": 1,
	"caseType": "Included",
	"source": "https://github.com/miketronic/Desolation",
	//"prebuilt": "https://tufgek.myshopify.com/"
},
{
	"name": "Inland MK-47",
	"img": "inland-mk-47.webp",
	"shape": "Monoblock",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 47,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 5,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"lighting": "RGB",
	"firmware": "QMK",
	"caseType": "Included",
	"prebuilt": "https://www.microcenter.com/product/661264/inland-47-keys-hot-swappable-rgb-wired-mechanical-keyboard"
},
{
	"name": "Tulip62",
	"img": "Tulip62.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Bluetooth",
	"keys": 62,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.8,
	"switchProfile": "MX",
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": "Handwired",
	"ctlCount": 2,
	"tenting": "Fixed",
	"web": "https://www.reddit.com/r/ErgoMechKeyboards/comments/1farymh/my_first_keyboard_i_designed_calling_it_the_tulip/",
	"source": "https://github.com/shardvark1/Tulip62"
},
{
	"name": "reJESK",
	"img": "reJESK.webp",
	"parent": "Redox",
	"shape": "Unibody",
	"connection": "Wired",
	"hotswap": "Unspecified",
	"switchProfile": "MX",
	"lighting": "None",
	"firmware": "QMK",
	"assembly": ["PCB", "Diodeless"],
	"ctlCount": 1,
	"tenting": "None",
	"caseType": "Included",
	"source": "https://github.com/triliu/reJESK?tab=readme-ov-file"
},
{
	"name": "Hexatana",
	"img": "Hexatana.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"lighting": "RGB",
	"firmware": ["QMK", "ZMK"],
	"software": "Vial",
	"ctlCount": 1,
	"ctlName": "RP2040",
	"caseType": "None",
	"source": "https://github.com/ThePurox/Hexatana-RGB"
},
{
	"name": "Caldera",
	"img": "Caldera.webp",
	"shape": "Split",
	"connection": "Bluetooth",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 3,
	"pinkyStagger": 0.5,
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"lighting": "None",
	"firmware": "ZMK",
	"tenting": "Fixed",
	"source": "https://github.com/christianselig/caldera-keyboard"
},
{
	"name": "Ashwing66",
	"img": "ashwing66.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {"min": 66, "max": 67},
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"outerKeys": 1,
	"cornerKeys": 2,
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": "MX",
	"encoders": {"min": 0, "max": 1},
	"encoderType": "Knob",
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "VIA",
	"source": "https://github.com/gzowski/Ashwing66",
	"kit": "https://www.etsy.com/uk/listing/1765077057/ashwing66-mechanical-keyboard-pcb"
},
{
	"name": "Lagrange",
	"img": "Lagrange.webp",
	"notes": "Dactyl-like with a novel thumb cluster",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 70,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 8,
	"cornerKeys": 1,
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": "MX",
	"lighting": "None",
	"firmware": "QMK",
	"assembly": "Handwired",
	"source": "https://github.com/dpapavas/lagrange-keyboard"
},
{
	"name": "TAP4",
	"img": "tap4.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 42,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 6,
	"pinkyStagger": 0.5,
	"splay": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": "MX",
	"firmware": ["QMK", "ZMK"],
	"caseType": "Included",
	"source": "https://github.com/lapidot/TAP4"
},
{
	"name": "Wren",
	"img": "wren.webp",
	"notes": [
		"Lily58-like with modules. The 4x3/4x4 block can be broken off and turned into a macropad.",
		"YAL note: it's pretty funny that several crow-themed keyboards are all on the smaller side and Wren is bigger than an average (real-life) wren."
	],
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": [[56], [66], [72], [82], [88]],
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"navCluster": ["None", "Full"],
	"numpad": ["None", "Mini"],
	"pinkyStagger": 0.3,
	"hotswap": "No",
	"switchProfile": "MX",
	"encoders": 2,
	"encoderType": "Knob",
	"lighting": "None",
	"firmware": "QMK",
	"ctlCount": 2,
	"caseType": "Included",
	"source": "https://github.com/oliviahanley/wren-keyboard"
},
{
	"name": "Moon60",
	"img": "Moon60.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"innerKeys": 1,
	"pinkyStagger": 0.4,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": "MX",
	"displays": {"min": 0, "max": 2},
	"firmware": "QMK",
	"wristPads": "Detachable",
	"caseType": "Included",
	"source": "https://github.com/Tymut/Moon60"
},
{
	"name": "Tako",
	"img": "Tako.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.7,
	"hotswap": "No",
	"switchProfile": "Topre",
	"caseType": "Included",
	"firmware": ["QMK", "ZMK"],
	"source": "https://github.com/ssbb/tako",
	"buildGuide": "https://github.com/ssbb/tako/blob/main/docs/buildguide.md"
},
{
	"name": "Lucca 58 HE",
	"img": "lucca58he.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"pinkyStagger": 0.4,
	"switchProfile": "HallEffect",
	"displays": {"min": 0, "max": 2},
	"lighting": ["RGB", "Underglow"],
	"firmware": "KMK",
	"caseType": "Included",
	"source": "https://github.com/Maka8295/Lucca-58HE"
},
{
	"name": "Helix HS Choc",
	"img": "helixhschoc.webp",
	"notes": "It's Helix, but with hot-swappable Choc V1 switches",
	"parent": "Helix",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"source": "https://github.com/cipulot/helixhschoc"
},
{
	"name": "FelixKeeb",
	"img": "felixkeeb.webp",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": ["Wired", "Bluetooth"],
	"keys": [[50], [64]],
	"rows": {"min": 3, "max": 4},
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 1,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc"],
	"keySpacing": "MX",
	"displays": {"min": 0, "max": 2},
	"firmware": ["QMK", "ZMK"],
	"software": "Vial",
	"caseType": "Included",
	"source": "https://github.com/beekeeb/FelixKeeb",
	"prebuilt": [
		"![v:Wired MX] https://shop.beekeeb.com/product/pre-soldered-rp2040-felix-keeb/",
		"![v:BT MX] https://shop.beekeeb.com/product/wireless-felix-keeb/",
		"![v:BT Choc] https://shop.beekeeb.com/product/wireless-felixkeeb-choc/"
	]
},
{
	"name": "Nomad",
	"img": "nomad.webp",
	"notes": "\"based largely on the Sofle Choc\"",
	"shape": "Split",
	"stagger": "Row",
	"connection": "Wired",
	"keys": 68,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 3,
	"cornerKeys": 4,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"displays": 2,
	"lighting": "RGB",
	"firmware": "QMK",
	"assembly": ["PCB", "Reversible"],
	"ctlCount": 2,
	"source": "https://github.com/fiendie/NomadKeyboard"
},
{
	"name": "Lintilla",
	"img": "lintilla.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Bluetooth", "WiredHalf"],
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"rcols": 6,
	"thumbKeys": 3,
	"innerKeys": 3,
	"outerKeys": 2,
	"cornerKeys": 0,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 1,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Other",
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": ["PCB", "Reversible"],
	"ctlCount": 2,
	"ctlFootprint": "XIAO",
	"ctlName": "nRF52840",
	"wristPads": "None",
	"tenting": "None",
	"caseType": "Included",
	"web": "https://github.com/ctranstrum/lintilla",
	"source": "https://github.com/ctranstrum/lintilla",
	"buildGuide": "https://github.com/ctranstrum/lintilla/blob/main/BUILD.md",
	"layoutRef": "https://github.com/ctranstrum/lintilla/blob/main/pcb/lintilla.kicad_pcb"
},
{
	"name": "Sheriff",
	"img": "sheriff.webp",
	"notes": "NB! Top row is MX profile, rest is Gateron LP",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 64,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"outerKeys": 3,
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": ["MX", "GateronLP", "Other"],
	"encoders": 2,
	"encoderType": "Wheel",
	"firmware": ["QMK", "ZMK"],
	"assembly": ["PCB", "Reversible"],
	"caseType": "Included",
	"source": "https://github.com/AJGamma/sheriff-keyboard"
},
{
	"name": "Musashi60",
	"img": [
		"musashi60-tented.webp",
		"musashi60.webp"
	],
	"notes": "There are a bunch of distinct versions of this keyboard, including flat, tented, and experiments.",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {"min": 58, "max": 60},
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 2,
	"pinkyStagger": 0.4,
	"splay": "Yes",
	"hotswap": ["No", "Yes"],
	"switchProfile": "MX",
	"firmware": ["QMK", "KMK"],
	"tenting": ["None", "Fixed"],
	"caseType": "Included",
	"source": "https://github.com/hamano/musashi60"
},
{
	"name": "Ixxoid Dactyl Manuform",
	"img": "ixxoid-dactyl.webp",
	"notes": "YAL note: ah, big dactyl. Uses Amoeba PCBs!",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 86,
	"rows": 5,
	"cols": 7,
	"thumbKeys": 6,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"assembly": "Handwired",
	"caseType": "Included",
	"source": "https://github.com/ixxoid/dactyl-keyboard"
},
{
	"name": "akohekohe",
	"img": "akohekohe.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 26,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 1,
	"innerKeys": -1,
	"outerKeys": -2,
	"splay": "Yes",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": ["Choc", "MinChoc"],
	"firmware": "ZMK",
	"assembly": "PCB",
	"ctlCount": 1,
	"ctlFootprint": "XIAO",
	"ctlName": ["RP2040", "nRF52840"],
	"source": "https://github.com/grassfedreeve/akohekohe"
},
{
	"name": "Wilson26",
	"img": "wilson26.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 26,
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": 1,
	"innerKeys": -1,
	"outerKeys": -2,
	"cornerKeys": 0,
	"pinkyStagger": 0.5,
	"splay": "No",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "MX",
	"firmware": "QMK",
	"ctlFootprint": "!xiao rp2040",
	"source": "https://github.com/StephanMoeller/wilson26"
},
{
	"name": "Smallcat",
	"img": "smallcat.webp",
	"notes": "A 26-key split keyboard, featuring the purr-fect code reviewer",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 26,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"innerKeys": -2,
	"outerKeys": -2,
	"splay": "Yes",
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "QMK",
	"assembly": "PCB",
	"ctlFootprint": "RP2040-Zero",
	"source": "https://github.com/smallwat3r/smallcat"
},
{
	"name": "Forager",
	"img": "Forager.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Bluetooth", "WiredHalf"],
	"keys": 34,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 2,
	"pinkyStagger": 0.4,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"assembly": "PCB",
	"ctlCount": 2,
	"ctlFootprint": "XIAO",
	"ctlName": "nRF52840",
	"wristPads": "None",
	"tenting": ["None", "Legs"],
	"caseType": "Included",
	"source": "https://github.com/carrefinho/forager"
},
{
	"name": "The Southerly",
	"img": "Southerly.webp",
	"notes": "Home built split keyboard which is based on the ZSA Voyager keyboard, using ergogen, kicad & fusion360 tools for keyboard design. ",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.235,
	"splay": "No",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Other",
	"lighting": "RGB",
	"firmware": "QMK",
	"assembly": "PCB",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"wristPads": "None",
	"tenting": "Legs",
	"caseType": "Included",
	"source": "https://github.com/WibblyGhost/southerly-split-keeb"
},
{
	"name": "Hephaestes38",
	"img": "Hephaestes38.webp",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 38,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 2,
	"outerKeys": -1,
	"cornerKeys": 0,
	"pinkyStagger": 0.6,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"displays": 1,
	"lighting": "None",
	"firmware": "ZMK",
	"software": "Remap",
	"assembly": "PCB",
	"ctlCount": 1,
	"ctlFootprint": "Nice!Nano",
	"ctlName": "nRF52840",
	"caseType": "ThirdParty",
	"source": "https://github.com/DeppressedCabbage/Hephaestes38-zmk/tree/main"
},
{
	"name": "cambkb",
	"img": "cambkb.webp",
	"shape": "Split",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": 1,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "GateronLP",
	"firmware": "Custom",
	"assembly": ["PCB", "Reversible"],
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"caseType": "None",
	"source": "https://github.com/cosimini/cambkb"
},
{
	"name": "Doro56",
	"img": "Doro56.webp",
	"notes": "Uses standard keycap sizes!",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 1,
	"pinkyStagger": 0.1,
	"splay": "PinkyOnly",
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 2,
	"encoderType": "Knob",
	"firmware": "ZMK",
	"assembly": ["PCB", "Reversible"],
	"ctlCount": 2,
	"ctlFootprint": "Nice!Nano",
	"caseType": "Included",
	"source": "https://github.com/gehennaXXIV/Doro56"
},
{
	"name": "Snowflake",
	"img": "Snowflake.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 64,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"innerKeys": 2,
	"outerKeys": 1,
	"cornerKeys": 1,
	"pinkyStagger": 0.7,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"keySpacing": "Other",
	"firmware": "QMK",
	"assembly": "PCB",
	"ctlCount": 2,
	"ctlFootprint": "Onboard/SMD",
	"wristPads": "Detachable",
	"caseType": "Included",
	"source": "https://github.com/kbranch/snowflake_keyboard"
},
{
	"name": "ErgoSNM",
	"img": "ErgoSNM.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth", "WiredHalf"],
	"keys": 64,
	"rows": 4,
	"cols": 6,
	"thumbKeys": {"min": 0, "max": 6},
	"cornerKeys": 5,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"trackballs": 1,
	"trackballSize": 40,
	"lighting": "None",
	"firmware": ["QMK", "ZMK"],
	"assembly": "PCB",
	"ctlCount": 2,
	"ctlFootprint": "Onboard/SMD",
	"ctlName": ["RP2040", "nRF52840"],
	"tenting": "Fixed",
	"caseType": "Included",
	"source": "https://github.com/siderakb/ergo-snm-keyboard",
	"buildGuide": "https://siderakb.ziteh.dev/docs/ergosnm/intro"
},
{
	"name": "ximega",
	"img": "ximega.webp",
	"shape": "Split",
	"stagger": "Column",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"pinkyStagger": 0.8,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc", "GateronLP"],
	"pointingDevices": {"min": 0, "max": 2},
	"trackballs": {"min": 0, "max": 2},
	"trackpads": {"min": 0, "max": 2},
	"trackpoints": {"min": 0, "max": 2},
	"rockerSwitches": 2,
	"displays": {"min": 0, "max": 2},
	"lighting": "RGB",
	"firmware": "QMK",
	"assembly": "PCB",
	"ctlFootprint": "Onboard/SMD",
	"ctlName": "RP2040",
	"caseType": "Included",
	"kit": "https://fingerpunch.xyz/product/ximega-v1/"
},
{
	"name": "tranquility",
	"img": "tranquility.webp",
	"notes": "No published firmware?",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.8,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "Unknown",
	"assembly": "Handwired",
	"ctlFootprint": "Elite-C",
	"caseType": "Included",
	"source": "https://github.com/cyanophage/tranquility"
},
{
	"name": "Silakka54",
	"img": "Silakka54.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 54,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.2,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"assembly": ["PCB", "Reversible"],
	"ctlCount": 2,
	"ctlFootprint": "RP2040-Zero",
	"ctlName": "RP2040",
	"caseType": "Included",
	"extras": "[v: Tenting platform] https://www.printables.com/model/1128583-silakka54-tenting-platform",
	"web": "https://squalius-cephalus.github.io/silakka54/",
	"source": "https://github.com/Squalius-cephalus/silakka54",
	"prebuilt": ["[n:As of 2025 the keyboard is sold by numerous Chinese sellers] ?"],
	"buildGuide": "https://squalius-cephalus.github.io/silakka54/buildguide.html"
},
{
	"name": "Dodo",
	"img": "Dodo.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 6,
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": 2,
	"encoderType": "Knob",
	"displays": 2,
	"firmware": "Unknown",
	"ctlFootprint": "XIAO",
	"source": "https://github.com/gorbit99/dodo-keyboard"
},
{
	"name": "Iyada",
	"img": "Iyada.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 50,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"innerKeys": 2,
	"cornerKeys": 2,
	"pinkyStagger": 0.3,
	"hotswap": "Yes",
	"switchProfile": ["MX", "Choc", "GateronLP"],
	"keySpacing": "MX",
	"encoders": 4,
	"encoderType": ["Knob", "Wheel"],
	"trackpads": 2,
	"trackpadSize": 40,
	"displays": 2,
	"lighting": "RGB",
	"firmware": "QMK",
	"assembly": "PCB",
	"source": "https://github.com/gargum/Iyada",
	"pointingDevices": 2
},
{
	"name": "Qimera",
	"img": "Qimera.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 54,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.5,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"firmware": "ZMK",
	"ctlCount": 2,
	"ctlFootprint": "Nice!Nano",
	"caseType": "Included",
	"source": "https://github.com/AbeerVaishnav13/Qimera-keyboard"
},
{
	"name": "Scylla",
	"img": "Scylla.webp",
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": "MX",
	"firmware": "QMK",
	"software": "Vial",
	"assembly": ["PCB", "Handwired"],
	"caseType": "Included",
	"web": "https://bastardkb.com/dactyls/",
	"source": "!https://github.com/Bastardkb/Scylla",
	"kit": "!https://bastardkb.com/product/scylla-kit/",
	"prebuilt": "!https://bastardkb.com/product/scylla-prebuilt-preorder-2/",
	"buildGuide": "https://docs.bastardkb.com/bg_scylla/01index.html"
},
{
	"name": "Phasmic Keyboard",
	"img": "PhasmicKeyboard.webp",
	"notes": "Featuring adjustable columns and thumb clusters!",
	"shape": ["Split", "Keywell"],
	"stagger": ["Column", "Ortho"],
	"connection": "Wired",
	"keys": 60,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 6,
	"hotswap": "No",
	"switchProfile": "Choc",
	"firmware": "QMK",
	"assembly": ["Handwired", "Adjustable"],
	"ctlCount": 2,
	"ctlFootprint": "Pi Pico",
	"source": "https://github.com/tanguanhong89/ThePhasmicKeyboard"
},
{
	"name": "Unsplitted ergo Keyberon V1",
	"img": "keyberon-f4.webp",
	"notes": "Parametric!",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 4,
	"pinkyStagger": 0.4,
	"hotswap": "No",
	"switchProfile": ["MX", "Choc"],
	"firmware": "Custom",
	"assembly": ["Handwired", "Parametric"],
	"caseType": "Included",
	"source": "https://github.com/TeXitoi/keyberon-f4",
	"buildGuide": "https://github.com/TeXitoi/keyberon-grid/blob/master/BUILDING.md"
},
{
	"name": "REVIUNGDASH47",
	"img": "REVIUNGDASH47.webp",
	"notes": "Inspired by the Reviung41 (& ERGODASH) hence the name!",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": {"min": 47, "max": 48},
	"rows": 3,
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"lighting": "Underglow",
	"firmware": "QMK",
	"software": "Vial",
	"ctlCount": 1,
	"ctlFootprint": "Pro Micro",
	"caseType": "Included",
	"source": "https://github.com/tumler/ReviungDash/tree/master/reviungdash47",
	"buildGuide": "https://reviung.com/build-guide/391/"
},
{
	"name": "REVIUNGDASH52",
	"parent": "REVIUNGDASH47",
	"img": "REVIUNGDASH52.webp",
	"notes": "Inspired by the Reviung41 (& ERGODASH) hence the name!",
	"keys": 52,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 4,
	"source": "https://github.com/tumler/ReviungDash/tree/master/reviungdash52",
	"buildGuide": "https://reviung.com/build-guide/391/"
},
{
	"name": "Israfel",
	"img": "Israfel.webp",
	"notes": "A 50%-ish ortho keyboard with standard keycap sizes and LEGO-compatible frame",
	"shape": ["Unibody", "Split"],
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": 56,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": -1,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "ChocV2",
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "Vial",
	"ctlCount": 2,
	"ctlFootprint": "Onboard/SMD",
	"caseType": "Included",
	"prebuilt": "https://kbdcraft.store/products/israfel",
	"buildGuide": "https://kbdcraft.store/pages/opensource"
},
{
	"name": "Thingamaboard V2",
	"img": "Thingamaboard-v2.webp",
	"notes": "Limited information in the repository",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 50,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 4,
	"cornerKeys": 3,
	"pinkyStagger": 0.1,
	"hotswap": "No",
	"switchProfile": "Choc",
	"firmware": "Custom",
	"ctlCount": 1,
	"ctlFootprint": "Onboard/SMD",
	"ctlName": "RP2040",
	"caseType": "Included",
	"source": "https://github.com/jackbrad1ey/thingamaboard_v2"
},
{
	"name": "Sofle Pico",
	"img": "sofle-pico.webp",
	"notes": "Most similar to Sofle Choc in layout stagger, but uses hotswap MX switches and RP2040 controllers.",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 58,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 5,
	"pinkyStagger": 0.25,
	"hotswap": "Yes",
	"switchProfile": "MX",
	"encoders": 2,
	"encoderType": "Knob",
	"trackballs": {"min": 0, "max": 1},
	"trackballSize": 4.4,
	"displays": {"min": 0, "max": 2},
	"lighting": "RGB",
	"firmware": "QMK",
	"software": "VIA",
	"ctlFootprint": "!RP2040",
	"ctlName": "RP2040",
	"web": "https://www.soflepico.com/",
	"source": "https://github.com/JellyTitan/Sofle-Pico",
	"buildGuide": "https://www.soflepico.com/build/build-guide"
},
{
	"name": "Apiaster",
	"img": "Apiaster.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 50,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"outerKeys": -1,
	"pinkyStagger": 0.5,
	"hotswap": "No",
	"switchProfile": ["MX", "Choc", "ChocV2"],
	"keySpacing": "MX",
	"firmware": "ZMK",
	"assembly": ["PCB", "Reversible"],
	"ctlCount": 2,
	"ctlFootprint": "RP2040-Zero",
	"caseType": "Included",
	"source": "https://github.com/nmunnich/apiaster"
},
{
	"name": "lapka",
	"img": "lapka.jpg",
	"notes": "Wireless ergonomic split keyboard for those who have paws (:",
	"shape": "Split",
	"connection": "Bluetooth",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"numpad": "None",
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": ["Choc", "ChocV2"],
	"encoders": 0,
	"displays": 0,
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": ["PCB", "Diodeless"],
	"ctlCount": 2,
	"ctlFootprint": "Nice!Nano",
	"ctlName": "nRF52840",
	"caseType": "Included",
	"web": "https://github.com/braindefender/lapka",
	"source": "https://github.com/braindefender/lapka",
	"buildGuide": [
		"https://github.com/braindefender/lapka/blob/master/Guide/build-guide-en.md",
		"https://github.com/braindefender/lapka/blob/master/Guide/build-guide-ru.md"
	]
},
{
	"name": "Charlieflex",
	"img": "Charlieflex.webp",
	"notes": "Choc unibody splayed ergo keyboard with 30-32 keys and an encoder using a xiao",
	"shape": "Unibody",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": [[30], [31], [32]],
	"rows": 3,
	"cols": 5,
	"rcols": 5,
	"thumbKeys": {"min": 1, "max": 2},
	"innerKeys": 2,
	"outerKeys": 0,
	"cornerKeys": 0,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.75,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": ["Choc", "ChocV2"],
	"keySpacing": "MX",
	"encoders": 1,
	"encoderType": "Knob",
	"lighting": "None",
	"firmware": "ZMK",
	"assembly": "PCB",
	"ctlCount": 1,
	"ctlFootprint": "XIAO",
	"ctlPinCount": 10,
	"ctlName": ["RP2040", "nRF52840"],
	"wristPads": "None",
	"tenting": "None",
	"caseType": "Included",
	"source": "https://github.com/ctranstrum/chuck",
	"buildGuide": "https://github.com/ctranstrum/chuck/blob/main/BUILD.md",
	"layoutRef": "https://github.com/ctranstrum/chuck/raw/main/images/chuck.png"
},
{
	"name": "Crosses 4x6",
	"img": "crosses-54.webp",
	"shape": ["Split", "Special"],
	"stagger": "Column",
	"connection": "Wired",
	"keys": 54,
	"rows": 4,
	"cols": 6,
	"thumbKeys": 3,
	"pinkyStagger": 0.6,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"trackballs": {"min": 0, "max": 2},
	"displays": {"min": 0, "max": 2},
	"firmware": "QMK",
	"software": "Vial",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlName": "RP2040",
	"tenting": "Fixed",
	"caseType": ["Included", "ThirdParty"],
	"kit": "https://ergokeyboards.com/products/crosses-modular-keyboard",
	"prebuilt": "https://ergokeyboards.com/products/crosses-modular-keyboard"
},
{
	"name": "Crosses 3x6",
	"img": "crosses-42.webp",
	"parent": "Crosses 4x6",
	"keys": 42,
	"rows": 3,
	"cols": 6,
	"kit": "https://ergokeyboards.com/products/crosses-modular-keyboard",
	"prebuilt": "https://ergokeyboards.com/products/crosses-modular-keyboard"
},
{
	"name": "Crosses 3x5",
	"img": "crosses-36.webp",
	"parent": "Crosses 4x6",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"kit": "https://ergokeyboards.com/products/crosses-modular-keyboard",
	"prebuilt": "https://ergokeyboards.com/products/crosses-modular-keyboard"
},
{
	"name": "minikbd",
	"img": [
		"mini-kbd.webp",
		"mini-kbd-aux.webp",
	],
	"notes": "Focusing on an easy to build columnar, diodeless split keyboard. Different options for TRRS or 4 pin mini-DIN. Supports Choc v1 and Choc Mini.",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 36,
	"rows": 3,
	"cols": 5,
	"thumbKeys": 3,
	"navCluster": "None",
	"numpad": "None",
	"pinkyStagger": 0.5,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": ["Choc", "ChocMini"],
	"keySpacing": "Choc",
	"firmware": ["QMK", "ZMK", "KMK"],
	"assembly": ["PCB", "ThroughHole", "Diodeless", "Reversible"],
	"ctlCount": 2,
	"ctlFootprint": "RP2040-Zero",
	"ctlName": "RP2040",
	"wristPads": "None",
	"tenting": "None",
	"caseType": "None",
	"web": "https://github.com/axhixh/mini-kbd",
	"source": "https://github.com/axhixh/mini-kbd/blob/main/license",
	"layoutRef": "https://github.com/axhixh/mini-kbd/blob/main/images/choc-v1-pcb.png"
},
{
	"name": "Explorer Blank",
	"img": [
		"explorer-blank-4.webp",
		"explorer-blank-5.webp"
	],
	"notes": "Featuring a Pretty Big knob and a trackpad",
	"shape": "Split",
	"stagger": "Ortho",
	"connection": "Wired",
	"keys": [[48], [60]],
	"rows": {"min": 3, "max": 4},
	"cols": 6,
	"thumbKeys": 3,
	"cornerKeys": 4,
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"encoders": 1,
	"encoderType": "Knob",
	"trackpads": 1,
	"firmware": "QMK",
	"software": "Vial",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlName": "RP2040",
	"caseType": "Included",
	"source": "https://github.com/DreaM117er/Explorer-Keyboard-Blank",
	"prebuilt": "https://shop.beekeeb.com/product/pre-soldered-blank-split-keyboard-with-trackpad-rotary/",
	"pointingDevices": 1
},
{
	"name": "Hillside Dactyl 50",
	"img": "Hillside-Dactyl-50.webp",
	"notes": [
		"A small contoured-keywell ergonomic keyboard with three choc-spaced rows of six.",
		"- Connection: It can be wired (QMK or ZMK) or wireless (ZMK) with RP2040 or Nice!Nano as the intended boards",
		"- Hotswap is with Mill-Max sockets, not easier Kailh ones.",
		"- Controller: I'm describing using the Hillside shield."
	],
	"shape": ["Split", "Keywell"],
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth", "WiredHalf"],
	"keys": 50,
	"rows": 3,
	"cols": 6,
	"thumbKeys": 5,
	"cornerKeys": 2,
	"pinkyStagger": 0.6,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"pointingDevices": 0,
	"displays": 2,
	"lighting": ["Simple", "Underglow"],
	"firmware": ["QMK", "ZMK"],
	"assembly": "Handwired",
	"ctlCount": 2,
	"ctlFootprint": "Pro Micro",
	"ctlPinCount": 24,
	"ctlName": ["RP2040", "nRF52840"],
	"tenting": ["Fixed", "Mount"],
	"caseType": "Included",
	"source": "https://github.com/mmccoyd/hillside_dactyl_50",
	"buildGuide": "https://github.com/mmccoyd/hillside_dactyl_50/wiki"
},
{
	"name": "Turing Split",
	"img": "turing-split-keyboard.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": ["Wired", "Bluetooth"],
	"keys": 52,
	"rows": 4,
	"cols": 5,
	"thumbKeys": 6,
	"pinkyStagger": 0.5,
	"splay": "Yes",
	"hotswap": "Yes",
	"switchProfile": "Choc",
	"keySpacing": "Choc",
	"encoders": {"min": 0, "max": 2},
	"encoderType": "Knob",
	"displays": {"min": 0, "max": 2},
	"firmware": "ZMK",
	"assembly": ["PCB", "Reversible"],
	"ctlCount": 2,
	"ctlFootprint": "Nice!Nano",
	"caseType": "Included",
	"web": "https://www.reddit.com/r/ErgoMechKeyboards/comments/1mqhgm0/i_designed_a_fully_custom_split_ergo_keyboard_at/",
	"source": "https://github.com/lordbagel42/turing-split-keyboard"
},
{
	"name": "SplittoDogu",
	"img": "SplittoDogu.webp",
	"shape": "Split",
	"stagger": "Column",
	"connection": "Wired",
	"keys": 74,
	"rows": 4,
	"cols": 7,
	"thumbKeys": 4,
	"innerKeys": 3,
	"cornerKeys": 3,
	"pinkyStagger": 0.6,
	"switchProfile": "MX",
	"encoders": 6,
	"encoderType": "Knob",
	"displays": 2,
	"firmware": "QMK",
	"ctlCount": 2,
	"ctlFootprint": "Elite-C",
	"caseType": "Included",
	"source": "https://github.com/tstrube/SplittoDogu"
},
"2025-08-15"
];
window.keyboardTODOs = `
More Maltron keyboards
44s Claw44
44s Jorne
60u https://github.com/ardakilic/woodpecker-keyboard/
34s https://github.com/aroum/kalmar
48u https://github.com/foostan/corneliuskbd
45u https://fingerpunch.xyz/product/vulpes-majora/
36s https://github.com/andrewjrae/rae-dux
36s https://github.com/j-w-e/wysteria https://new.reddit.com/r/ErgoMechKeyboards/comments/1c83kz3/wysteria_my_new_36key/
60s K:03
60s High Plains Drifter
48s https://satt.booth.pm/items/1644450 https://github.com/satt99/caravelle-build-guide
36s https://github.com/snsten/Klein
36u https://kbd.news/NewType-36-2358.html
36u https://kbd.news/Trio-2356.html
54u https://github.com/sini6a/phnx https://new.reddit.com/r/ErgoMechKeyboards/comments/1cgn2fk/phnx_ergonomic_custom_mechanical_keyboard/
50s https://github.com/JPricey/dactyl-high-profile
50s Low Profile Dactyl https://github.com/omurovec/dactyl-high-profile
44s https://github.com/llmerlos/0xLM
40s Stront40 https://github.com/zzeneg/stront
BrownSugar Flex modular keyboard https://www.reddit.com/r/MechanicalKeyboards/comments/mqncao/modular_keyboard/
44u https://kbd.news/VColChoc44-1029.html
40s https://github.com/ChrisChrisLoLo/beyblock20
40u https://new.reddit.com/r/ErgoMechKeyboards/comments/1cr2kk1/ad_scottowing_pcb_edition_available_now/
36s https://github.com/raeedcho/temper
34u https://github.com/smores56/osprette
34s https://github.com/smores56/sephirette
34s https://github.com/smores56/clog-v2 https://github.com/smores56/clog-v4
44s https://github.com/lapidot/2BKeyboard
44s https://kbd.news/FCS42S-keyboard-1317.html
44s https://github.com/Squalius-cephalus/silakka44
42 https://github.com/choubbikeyboards/scaffold
34s https://github.com/geoffder/dometyl-keyboard/tree/main/things/dartyl_choc
36s https://github.com/soundmonster/samoklava
58s https://github.com/foureight84/sofle-keyboard-pimoroni
42s https://github.com/klouderone/cornev4promicroedition
58s Sofle with caveats! https://www.doioshop.com/products/sofle-split-keyboard-bluetooth-dual-mode-mechanical-keyboard-kit?VariantsId=10249 https://www.reddit.com/r/ErgoMechKeyboards/comments/1d4xeqh/comment/l6k8vu3/
42s https://github.com/allymparker/crkbd/tree/main/corneroll https://new.reddit.com/r/ErgoMechKeyboards/comments/1d5ltaq/corneroll_wireless_hotswap_niceview_with/
58s https://github.com/zxku/Allium58CAD/blob/main/readme.md
Svalboard (and how does that map to column-row classification)
42s https://github.com/Vaarai/Cornia https://new.reddit.com/r/ErgoMechKeyboards/comments/1ddoohp/first_ergo_build_from_scratch/
36s dove36
42s https://github.com/chelming/swept-crkbd
36u https://github.com/dohn-joh/alias
46s https://mtnkbd.com/products/lets-tango-case
36u https://github.com/mikeholscher/zmk-config-mikefive https://new.reddit.com/r/ErgoMechKeyboards/comments/1e4xl8q/3d_cad_file_and_kicad_footprint_of_kailh_pg1316s/
36u https://github.com/rschenk/egret https://github.com/rschenk/re-gret
32s https://github.com/dlip/tenshi https://new.reddit.com/r/ErgoMechKeyboards/comments/1ebsjye/tenshi_split_keyboard_with_slideadjustable/
38u https://github.com/jeffdhooton/jingis38 https://new.reddit.com/r/ErgoMechKeyboards/comments/1ec0cyf/38key_columnstagger_board_build/
58s Sofle Choc with V2 pinky stagger https://42keebs.eu/shop/kits/pro-micro-based/sofle-choc-hotswap-split-ergo-50-kit/
18s https://github.com/Aodrulez/zenFlow
30u https://github.com/AlaaSaadAbdo/battoota/tree/main/boards/30keys/Ghazal https://new.reddit.com/r/ErgoMechKeyboards/comments/1eibqxn/ghazal_a_30_key_wireless_unibody_with_integrated/
42s https://github.com/yangit/flactyl https://new.reddit.com/r/ErgoMechKeyboards/comments/13qep4y/after_4_year_lurking_and_2_years_building_my_own/
36s https://fingerpunch.xyz/product/baby-yoda-keyboard/
44s https://github.com/TeXitoi/keyseebee
42u https://github.com/levitatingpineapple/atreus
32u https://github.com/protieusz/Fanta-Manta/tree/main
32s https://github.com/bennytrouser/NostrumX
40u KUSOboard https://github.com/covah901/KUSOboard
46s https://github.com/kobakos/Splay46
50s https://github.com/tewtham/dactyl-typesafe
42u https://github.com/kapee1/osprey-remix
44s https://github.com/focusaurus/kipra-keyboard
42s https://github.com/Squalius-cephalus/silakka44
62s r-track https://gitlab.com/keyboards1/dm_r_track/-/tree/master/boolean
76s https://www.printables.com/model/314112-dactyl-manuball
30u https://github.com/doesntfazer/Goober
66s https://new.reddit.com/r/ErgoMechKeyboards/comments/1f9kvsl/zodiarkpi_new_build/
34s https://github.com/flinguenheld/chew
75%s https://fornellas.github.io/3d_printed_keyboard/
that's a lot of keyboards https://oshwhub.com/joba/works
42s https://github.com/triliu/Heawood42
36s https://github.com/RasmusKoit/pipar
34s https://github.com/eggsworks/solanum
42s KLOR with Choc V1 support https://github.com/sadekbaroudi/KLOR
42u Treble https://github.com/kkckrnz/treble
66s https://github.com/brucedjones/dactyl-stabilized https://photos.app.goo.gl/FvHTLifnzGaTiMUD9
36s Waterfowl
44s https://new.reddit.com/r/ErgoMechKeyboards/comments/1fyxy85/imperial44_v1_are_now_open_sourced/
48s https://github.com/danbiba/zmk-config-biba40
39u https://github.com/cyril279/keyboards/tree/main/revlp
36u https://github.com/eggsworks/le-oeuf
34s https://github.com/randcanary/mkpico/
46s https://github.com/anywhy-io/flake https://github.com/tangbonze/zmk-config-flake/tree/main/mx_case
34s https://github.com/anothermimich/k02
46u delast https://www.reddit.com/r/ErgoMechKeyboards/comments/1hj4xlt/delast_the_last_one_for_me/
28s https://github.com/ThePurox/zplitzalp
66s https://kbd.news/Chunky2040-Rev2-2006.html
42s jarne https://lim.au/#/hardware https://shop.chenonetta.com/product/jarne-the-ultimate-keyboard/
36s https://github.com/penk/EDC36
36s https://github.com/DuBento/puffer https://www.reddit.com/r/ErgoMechKeyboards/comments/1htjdbi/puffer/
36u glitter36 https://shop.yushakobo.jp/products/10301
36s https://github.com/rmuraglia/menura-kb
https://github.com/dlip/harite-v2
36u https://github.com/OldMan6955/TheEndgame2024 https://github.com/quark-works/TheEndgame2024-BLE
36u https://github.com/penk/Haori36-MX
24s https://kbd.news/Diamond-2418.html
20s https://github.com/miketronic/10x2?tab=readme-ov-file
36u https://github.com/TeXitoi/keymini/
61u https://github.com/floookay/barnacle
42s roBa https://kbd.news/roBa-2550.html
36s https://github.com/n1tsu/n36tsu
42s https://github.com/Dooez/thoren-build
36u https://github.com/tamago324/nowt36
54s https://github.com/im-AMS/StackOverChonk
36u https://github.com/penk/LoremIpsum36
44s https://keeb.io/products/chiri-ce-keyboard-kit
a bunch of keyboards https://github.com/MakerJake01/MakerJakes-keyboards
40s https://github.com/RaphCoder13/Porg40
62s https://github.com/HellSingCoder/LimeKeyboard/tree/main
42s https://www.reddit.com/r/ErgoMechKeyboards/comments/1ios33a/3d_printed_ergonomic_split_keyboard/
64s https://github.com/kbranch/snowflake_keyboard
32u https://github.com/TvrdRadKeyboards/orasnica
44s https://github.com/erikpeyronson/erkbd
36s https://github.com/GroooveBob/DASBOB
36s swweeep https://github.com/sadekbaroudi/sweep36#swweeep
62s https://github.com/qmk/qmk_firmware/tree/master/keyboards/handwired/tractyl_manuform
42s https://github.com/Magnum-Monk/KeebIsSplit/tree/v1.0
44s https://github.com/crolbar/yuki
46s Geulis https://www.tokopedia.com/kbdksp/geulis-40-split-keyboard-full-built-6-kolom-24707
34u https://github.com/subottimale/Claudia
56s https://github.com/Squalius-cephalus/muikku_keyboards
62u https://github.com/tahnok/harkonnen
40u https://github.com/ChrisChrisLoLo/keezyboost40
68s nomad v2 https://www.reddit.com/r/ErgoMechKeyboards/comments/1k25sv0/nomad_opensource_diy_lowprofile_split_ergo/
36u https://github.com/unspecworks/gamma-omega
58s https://clicketysplit.ca/pages/leeloo
34u https://github.com/kilipan/lobotomy
58s https://github.com/kissetfall/Lily58-Pro-RE
34s https://www.jogmekeebs.com/?product=yetis-keyboard
70% http://www.hck.sk/k80cs/
60% https://github.com/LSChyi/ex-dactyl-keyboard
40% https://www.thingiverse.com/thing:4828205
40u crowkb_wing https://github.com/c-botz/crowkb
34s rkbrd https://github.com/prepor/rkbrd/tree/main/3
54s bug54 https://github.com/ogruendel/bug54-zmk-config
64s mtk64 https://mentako-ya.myshopify.com
36s https://github.com/thrly/tempest
34s zaphod (EC) https://gitlab.com/lpgalaxy/zaphod-ecbrox https://github.com/petejohanson/zaphod-ecbrox-zmk-module
36s https://github.com/flhps/splaybreak-keyboard
48s Cornix
54s https://github.com/lordxax/sildactyl54
36s https://github.com/fooker/mnhttn
48s https://github.com/venc0r/mnhttn
54u https://github.com/swaziloo/cinque
36u aronia https://www.reddit.com/r/ErgoMechKeyboards/comments/1loilwj/aronia_keyboard_ultracompact_36key_foldable/
36u https://github.com/dohn-joh/heatwave
36s https://github.com/Palpatineli/slimkeeb36
44s https://github.com/thewickest/smash-b
42s PartialGauss https://www.reddit.com/r/ErgoMechKeyboards/comments/1ls8iq4/partialgauss_designed_my_first_keyboard_a/
60% Dactyl Lynx https://www.reddit.com/r/ErgoMechKeyboards/comments/1lua90r/the_dactyl_lynx/
56s Iris LM https://keeb.io/products/iris-lm-keyboard-kit
42s https://www.reddit.com/r/ErgoMechKeyboards/comments/1m4dbpw/raven_my_second_keyboard_design_3d_printed_kicad/
42s https://github.com/Cipulot/CorneECRevival
42s https://github.com/buztard/kyrne/
36s https://github.com/davidphilipbarr/popcorn
36u https://github.com/vuoz/chalk
54s https://github.com/TheEternalComrade/The-Prince54
26u https://github.com/smallwat3r/smallcat
54u https://github.com/tuxedocurly/mantaray_keyboard
38s https://github.com/Hex-4/glyph/blob/main/JOURNAL.md
36s https://github.com/tobiasarndt/Kuniboard
64s YMDK Sofle https://ymdkey.com/products/ymdk-sofle-wireless-split-keyboard-2-4ghz-64-keys-ergonomic-hotswappable-60-layout-3d-pla-vial-all-key-programmable-mini-independent-gaming-keyboard-kit
60u https://github.com/Glitch860/Num64
62s https://github.com/mzizzi/mzizzi-split62
32u https://github.com/carrefinho/visorbearer
30u https://github.com/StephanMoeller/mike-typeson
42s https://ergomech.store/shop/zenith-executive-edition-524#attr=1109,1111
`;

/* Other TODOs
https://keyboardfinder.click

choc-spaced lily58? https://keebd.com/products/lily58-choc-asembled-keyboard
Note to self: add a separate "this keyboard is a mouse" tag
https://new.reddit.com/r/ErgoMechKeyboards/comments/1dgxxf6/interesting_idea_maybe_what_if_the_keyboard_was/
https://mechkey.org/ergonomics-keyboards
https://github.com/Cipulot

aliexpress
Sofle with inner keys https://www.aliexpress.us/item/3256808570920954.html
Kpax Mote V3

Vendors:
https://keyboard-hoarders.com/products/sofle-choc-wireless-split-mechanical-keyboard-shadowseries?variant=42590143086680

Ortho blocks:
61m https://github.com/xommmmmmmm/QueueNineChimera
56m https://github.com/eswai/QOL56
75m id75
62m https://github.com/swift502/Krtkus
48m https://github.com/MakerJake01/J46K
https://keebd.com/products/contra-40-keyboard-kit
https://docs.google.com/spreadsheets/d/1kOHXAKuxkYMWo0s8xzkoVLM_iViYXjoVfkY-oCm0Tbc/edit?gid=0#gid=0
48m https://github.com/skarrmann/tackle
https://docs.google.com/spreadsheets/d/1kOHXAKuxkYMWo0s8xzkoVLM_iViYXjoVfkY-oCm0Tbc/edit#gid=0
https://github.com/certainly1182/MoonBoard
https://www.reddit.com/r/olkb/comments/1iq4bly/kheops70_ortholinear_analog_he_keyboard/
https://vi.aliexpress.com/item/1005008051327383.html
75m https://github.com/peej/orthgyle-keyboard
40m https://github.com/victorlucachi/void40
80% https://github.com/dcpedit/tklish
65% https://www.printables.com/model/619164-the-typem-custom-ortholinear-keyboard

Cases
rev41 https://github.com/Boom123bam/reviung41-Acrylic-case/tree/main
urchin https://www.reddit.com/r/ErgoMechKeyboards/comments/1ipdsmb/presenting_coral_a_case_for_the_urchin_keyboard/

Generators:
https://github.com/pashutk/ergopad
https://github.com/gicappa/diy-mechanical-keyboard

https://new.reddit.com/r/crkbd/comments/1afrhbn/custom_gasketmount_case_complete/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1dvjcxc/comment/lbox6ab/?utm_source=reddit&utm_medium=web2x&context=3
https://github.com/petejohanson/mk-family-tree

https://www.slicemk.com/collections/all
todo: Helix can have encoders?

Trickery:
https://new.reddit.com/r/ErgoMechKeyboards/comments/1agtge9/wireless_split_ortho_setup_with_two_numpads/
https://new.reddit.com/r/olkb/comments/kho4do/poor_mans_40_planck_two_wireless_keypads_deltaco/
https://github.com/JanLunge/keyboards/tree/main/hotswap_socket
https://ryanis.cool/cosmos/plum-twist/
https://kbd.news/3D-printed-hotswap-sockets-V4-750.html
https://kbd.news/Hot-swap-socket-holders-1669.html
https://epomaker.com/products/epomaker-vial-adapter
https://github.com/rschenk/zmk-component-raytac-dongle

Conversions:
https://github.com/dcpedit/pillzmod

Research:
https://new.reddit.com/r/ErgoMechKeyboards/comments/hudjyt/current_research_on_ergonomics_keyboard_design/

Keypads:
http://fingerpunch.xyz/product/kucheza/
https://www.lemokey.com/products/lemokey-x0-qmk-wired-mechanical-gaming-keypad
https://www.amazon.com/dp/B0BRFSB1LN/ref=sbl_dpx_pc-accessories-keyboards_B00ZR7POQQ_0
https://github.com/kb-elmo/GameHand
https://gitlab.com/to1ne/marconi16
https://github.com/bobbicodes/trochee
https://github.com/Staacks/inkkeys
https://github.com/klouderone/SeagullMacropad
Koolerton macropads
https://github.com/takashicompany/dogtag
Aula Excalibur
https://www.hackster.io/news/sherbet-is-a-beautiful-diy-ergonomic-keyboard-for-serious-gaming-11981c53602e
RedThunder RGB
Azeron Cyborg
https://haute42.com/haute-board-mini/
keeb supply stress
ZUOYA HE30
Delux T9, T11
https://github.com/htx-studio/One-Handed-Keyboard
10 https://github.com/turtle-bazon/PNCATEHO/tree/master/light/pcb

Unreleased:
https://new.reddit.com/r/ErgoMechKeyboards/comments/1dltr3y/hammerhead42_final_prototype_for_a_unibody_split/
Naya Create
https://www.arrowmechanics.com/produkty
https://www.reddit.com/r/MechanicalKeyboards/comments/1g16rug/jarne_blade_the_lowest_profile_split/
https://github.com/Geobert/snowslide_site
https://www.reddit.com/r/ErgoMechKeyboards/comments/1hlaffe/the_mantaray_a_new_open_source_design_based_on/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1i3an3j/first_keyboard_builddesign_magpie/
https://old.reddit.com/r/ErgoMechKeyboards/comments/1i7vztv/nury_mini_color/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1id23wr/cases_for_a_tiny_keyboard_i_am_working_on_not_yet/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1idaqxf/meet_merlin_v1/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1j3985i/bayleaf_a_wireless_split_keyboard/ https://www.graz.io/articles/bayleaf-wireless-keyboard
https://www.reddit.com/r/ErgoMechKeyboards/comments/1hd48z5/pg1316s_prototype/
https://humancomputing.io/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1kqvws7/serenity/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1lp6bxr/kaizen_a_split_ergo_unibody/
https://www.reddit.com/r/ErgoMechKeyboards/comments/1lruphf/couldnt_buy_a_mikefive_so_i_made_my_own/
https://www.kickstarter.com/projects/1866868344/wing-45-true-wireless-ergo-columnar-split-keyboard
https://posture.works/baseform/
TAIKO-01

WIP:
https://github.com/peej/bicycle-keyboard

Gone / out of stock for now?
85u suika85ergo https://shop.yushakobo.jp/en/products/9015

Obsolete:
TypeMatrix
Datadesk SmartBoard

things to be aware of:
glue dactyl/charybdis https://www.reddit.com/r/ErgoMechKeyboards/comments/1jg791x/is_it_good/
*/
