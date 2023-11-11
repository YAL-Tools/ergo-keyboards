package ;
import type.EncoderType;
import type.Firmware;
import type.HotSwap;
import type.KeySpacing;
import type.Software;
import type.Connection;
import type.SwitchProfile;
import type.Assembly;
import type.Shape;
import type.Splay;
import type.WristPads;
import type.CaseType;

/**
 * ...
 * @author YellowAfterlife
 */
class ColStagBoards {
	public static function init(keyboards:Array<ColStagKeyboard>) {
		function add(kb:ColStagKeyboard) {
			kb.stagger ??= Column;
			kb.shape ??= Split;
			keyboards.push(kb);
		}
		var pimoroniSize = 4.4;
		var kb:ColStagKeyboard;
		
		kb = new ColStagKeyboard("Corne/crkbd");
		kb.setMatrix(42, 6, 3);
		kb.setExtras(3);
		kb.setHotswap([MX, Choc]);
		kb.displays = [0, 2];
		kb.source = "https://github.com/foostan/crkbd";
		kb.kit = [
			"https://splitkb.com/collections/keyboard-kits/products/aurora-corne",
			"https://holykeebs.com",
			"https://new.boardsource.xyz/products/unicorne",
			"https://nextkeyboard.club/product-tag/corne-v3-0-1-mx/",
			"https://customkbd.com/collections/split-keyboards/products/corne-classic-kit",
			"https://42keebs.eu/shop/kits/pro-micro-based/corne-chocolate-low-profile-hotswap-split-ergo-40-kit/",
			"https://www.diykeyboards.com/keyboards/keyboard-kits/product/corne-keyboard-kit",
			"https://keebd.com/products/corne-cherry-v3-rgb-keyboard-kit",
			"https://keebd.com/products/corne-choc-low-profile-rgb-keyboard-kit",
			"https://keyhive.xyz/shop/corne-v3",
			"https://mechboards.co.uk/collections/kits/products/helidox-corne-kit",
			"https://shop.yushakobo.jp/en/products/corne-chocolate",
			"https://www.littlekeyboards.com/collections/corne-pcb-kits",
			"https://keebmaker.com/collections/kits",
			"[US] https://www.etsy.com/listing/1113750577/corne-light-v2-pcb",
		];
		kb.prebuilt = [
			"https://customkbd.com/collections/split-keyboards/products/corne-classic-kit",
		];
		kb.extras = [
			"https://keyhive.xyz/shop/aluminum-corne-helidox-case",
		];
		kb.img = "crkbd.jpg";
		add(kb);
		
		function addSofle(kb:ColStagKeyboard) {
			kb.keys ??= 58;
			kb.cols = 6;
			kb.rows = 4;
			kb.setExtras(5);
			kb.encoders ??= 2;
			kb.displays ??= [0, 2];
			kb.setQMK([VIA, Vial]);
			add(kb);
		}
		kb = new ColStagKeyboard("Sofle");
		kb.setHotswap([MX, Choc]);
		kb.caseType = [Included, ThirdParty];
		kb.web = "https://josefadamcik.github.io/SofleKeyboard/";
		kb.source = "https://github.com/josefadamcik/SofleKeyboard";
		kb.kit = [
			"https://keebd.com/en-us/products/sofle-v2-keyboard-kit",
			"https://splitkb.com/collections/keyboard-kits/products/aurora-sofle-v2?variant=46912405635419",
			"https://mechboards.co.uk/collections/kits/products/sofle-kit",
			"https://customkbd.com/collections/split-keyboards",
			"https://42keebs.eu/shop/kits/pro-micro-based/sofle-v2-hotswap-split-ergo-50-kit-black/",
			"https://keebd.com/products/sofle-v2-1-rgb-keyboard-kit",
			"https://keebd.com/products/sofle-v2-1-choc-keyboard-kit",
			"https://www.littlekeyboards.com/products/sofle-rgb-pcb-kit",
			"https://keebmaker.com/collections/kits",
		];
		kb.prebuilt = [
			"https://falba.tech/https-falba-tech-buy-a-custom-keyboard-sofle/",
			"https://shop.beekeeb.com/product/pre-soldered-sofle-rgb-mx/",
			"https://ergomech.store/shop?search=&order=&attrib=&attrib=&attrib=&attrib=&attrib=11-22&attrib=",
		];
		kb.extras = [
			"https://shop.beekeeb.com/product/sofle-2-tented-case/",
		];
		kb.img = "sofle.jpg";
		addSofle(kb);
		
		kb = new ColStagKeyboard("Sofle Choc");
		kb.setHotswap(Choc, MX);
		kb.caseType = [Included, ThirdParty];
		kb.web = "https://josefadamcik.github.io/SofleKeyboard/";
		kb.source = "https://github.com/josefadamcik/SofleKeyboard";
		kb.kit = [
			"https://42keebs.eu/shop/kits/pro-micro-based/sofle-choc-hotswap-split-ergo-50-kit-black/",
			"https://splitkb.com/collections/keyboard-kits/products/aurora-sofle-v2?variant=46912405668187",
			"https://www.littlekeyboards.com/products/sofle-choc-pcb-kit",
		];
		kb.prebuilt = [
			"https://falba.tech/sofle-low-profile/",
			"https://ergomech.store/shop/sofle-choc-ergomech-store-revision-47",
		];
		kb.img = "sofle-choc.jpg";
		kb.pinkyStagger = 0.3;
		addSofle(kb);
		
		kb = new ColStagKeyboard("Sofle PLUS (xcmkb)");
		kb.setMatrix(58, 6, 4);
		kb.setExtras(5);
		kb.displays = 2;
		kb.encoders = 2;
		kb.encoderType = [Knob, Wheel];
		kb.setHotswap(MX);
		kb.trackballs = 1;
		kb.trackballSize = pimoroniSize;
		kb.caseType = Included;
		kb.web = "https://github.com/superxc3/xcmkb/tree/main/list%20of%20items/list%20of%20keyboards/60percent/sofle/sofleplus";
		kb.prebuilt = "!https://github.com/superxc3/xcmkb";
		kb.img = "xcmkb-sofle-plus.jpg";
		kb.notes = "A number of small improvements over regular Sofle.";
		add(kb);
		
		kb = {
			name: "Soufflé",
			pinkyStagger: 0.7,
			encoders: [1, 2],
			source: "https://github.com/climent/SouffleKeyboard",
			img: "Soufflé.jpg"
		};
		kb.setMatrix([58, 59], 6, 4);
		kb.setExtras(5, 0, 0, 1);
		kb.setHotswap(MX);
		kb.caseType = Included;
		kb.setQMK([VIA, Vial]);
		add(kb);
		
		kb = {
			name: "Lily58",
			source: "https://github.com/kata0510/Lily58",
			kit: [
				"!https://shop.yushakobo.jp/products/lily58-pro/",
				"https://mechboards.co.uk/collections/kits/products/lily58-kit",
				"https://splitkb.com/collections/keyboard-kits/products/aurora-lily58",
				"https://holykeebs.com/products/trackball-lily58-low-profile",
				"https://www.boardsource.xyz/products/lulu",
				"https://42keebs.eu/shop/kits/pro-micro-based/lily58-pro-hotswap-split-ergo-50-kit-black-white/",
				"https://customkbd.com/collections/split-keyboards/products/lily-58-pro-keyboard-kit",
				"https://keebd.com/products/lily58-pro-keyboard-kit",
				"https://www.littlekeyboards.com/collections/lily58-pcb-kits",
				"https://keyhive.xyz/shop/lily58",
			],
			prebuilt: [
				"https://customkbd.com/collections/split-keyboards/products/lily-58-pro-keyboard-kit",
				"https://ergomech.store/shop/sofle-v2-sandwich-style-12",
				"https://ergomech.store/shop/lily58-enclose-case-15",
			],
			extras: [
				"[US] https://capsuledeluxe.com/tag/manta58/",
			],
			img: "lily58.jpg",
		};
		kb.setMatrix(58, 6, 4);
		kb.setExtras(4, 1, 0, 0);
		kb.caseType = Included;
		kb.setHotswap([MX, Choc], MX);
		add(kb);
		
		kb = new ColStagKeyboard("Kyria");
		kb.setMatrix(48, 6, 3);
		kb.setExtras(6);
		kb.setHotswap([MX, Choc]);
		kb.encoders = 2;
		kb.pinkyStagger = 0.6;
		kb.caseType = Included;
		kb.source = "https://github.com/splitkb/kyria";
		kb.kit = "!https://splitkb.com/products/kyria-rev3-pcb-kit";
		kb.img = "Kyria.jpg";
		add(kb);
		
		function addEgg(kb:ColStagKeyboard) {
			kb.setMatrix(58, 6, 4);
			kb.thumbKeys = 4;
			kb.cornerKeys = 4;
			kb.hotswap = HotSwap.Yes;
			kb.caseType = Included;
			add(kb);
		}
		addEgg({
			name: "Egg58",
			switchProfile: Choc,
			connection: Wired,
			firmware: QMK,
			software: VIA,
			source: "https://github.com/eggsworks/egg58",
			kit: "!https://eggs.works/products/egg58-diy-kit",
			prebuilt: "!https://eggs.works/products/egg58",
			img: "egg58.jpg",
		});
		addEgg({
			name: "Egg58bt",
			switchProfile: Choc,
			connection: Bluetooth,
			firmware: ZMK,
			source: "https://github.com/eggsworks/egg58/blob/master/egg58bt",
			img: "egg58bt.jpg",
		});
		
		kb = {
			name: "Eskarp",
			assembly: Handwired,
			switchProfile: MX,
			firmware: Firmware.Custom,
			trackpads: [0,1],
			source: "https://github.com/rwalkr/eskarp",
			img: "eskarp.jpg",
		};
		kb.caseType = Included;
		kb.setMatrix(60, 6, 4);
		kb.setExtras(6, 0, 0, 5);
		add(kb);
		
		kb = {
			name: "Pangaea",
			assembly: Assembly.Adjustable,
			encoders: [0, 2],
			source: "https://github.com/e3w2q/Pangaea-keyboard",
			img: "Pangaea.jpg",
			notes: "Pinky columns and thumb row can be moved and rotated."
		};
		kb.splay = Optional;
		kb.setMatrix([58, 60], 6, 4);
		kb.setExtras(5);
		add(kb);
		
		kb = {
			name: "Mask",
			thumbKeys: 6,
			switchProfile: CherryULP,
			source: "https://github.com/marcoster/mask",
			img: "mask-ulp.webp",
		};
		kb.caseType = None;
		kb.setMatrix(60, 6, 4);
		add(kb);
		
		kb = {
			name: "Dao Choc BLE",
			thumbKeys: [2, 3],
			connection: [Bluetooth, Wired],
			source: "https://github.com/yumagulovrn/dao-choc-ble",
			prebuilt: "https://shop.beekeeb.com/product/pre-soldered-wireless-dao-choc-ble-keyboard/",
			img: "dao-choc-ble.jfif",
		};
		kb.caseType = Included;
		kb.setMatrix([42, 44], 6, 3);
		kb.setHotswap(Choc, Choc);
		add(kb);
		
		kb = {
			name: "Cantaloupe",
			thumbKeys: 3,
			cornerKeys: 3,
			encoders: 2,
			source: "https://github.com/Ariamelon/Cantaloupe",
			img: "Cantaloupe.jpg",
		};
		kb.caseType = Included;
		kb.setHotswap(MX);
		kb.setMatrix(60, 6, 4);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "Untitled keyboard",
			thumbKeys: 5,
			connection: [Wired, Bluetooth],
			source: "https://github.com/AnthonyAmanse/untitled-keyboard/",
			firmware: ZMK,
			img: "AnthonyAmanse-untitled.jpg"
		}
		kb.caseType = None;
		kb.setMatrix(60, 6, 4);
		kb.setHotswap(Choc, Choc);
		add(kb);
		
		kb = {
			name: "Pinky4",
			thumbKeys: 4,
			source: "https://github.com/tamanishi/Pinky4",
			img: "Pinky4.jpg",
			kit: "https://www.littlekeyboards.com/products/pinky4-keyboard-kit",
			extras: "https://www.littlekeyboards.com/collections/pinky4-cases",
			notes: "Uses Choc switches for thumb keys"
		};
		kb.setMatrix(64, 7, 4);
		kb.setHotswap(MX);
		add(kb);
		
		function addAvalanche(kb:ColStagKeyboard) {
			kb.outerKeys = [0, 1];
			kb.thumbKeys = [6, 7];
			kb.encoders = [0, 2];
			kb.source = "https://github.com/vlkv/avalanche";
			kb.img = "avalanche_v4-1.jpg";
			kb.displays = 2;
			kb.splay = PinkyOnly;
			kb.caseType = Included;
			kb.setHotswap(MX);
			kb.setQMK();
			add(kb);
		}
		addAvalanche({
			name: "Avalanche 40%",
			keys: [48, 52],
			rows: 3, cols: 6
		});
		addAvalanche({
			name: "Avalanche 60%",
			keys: [60, 64],
			rows: 4, cols: 6,
			prebuilt: [
				"https://github.com/superxc3/xcmkb/tree/main/list%20of%20items/list%20of%20keyboards/60percent/avalanche/v4 @ https://github.com/superxc3/xcmkb",
			],
		});
		
		for (step in 0 ... 2) {
			kb = {
				name: "Redox",
				source: "https://github.com/mattdibi/redox-keyboard",
				connection: [Wired, Bluetooth],
				img: "redox-1.jpg",
			};
			if (step == 0) {
				kb.prebuilt = [
					"https://falba.tech/custom-redox-v9b7d173b068d/",
					"https://ergomech.store/shop/neodox-52",
				];
			} else {
				kb.name += " handwire";
				kb.assembly = Assembly.Handwired;
			}
			kb.setHotswap(MX);
			kb.setMatrix(70, 6, 4);
			kb.setExtras(7, 2, 0, 4);
			kb.caseType = Included;
			kb.firmware = [QMK, ZMK];
			kb.software = VIA;
			add(kb);
		}
		
		kb = {
			name: "ErgoDash",
			source: "https://github.com/omkbd/ErgoDash",
			img: "Ergodash.jpg",
		};
		kb.caseType = Included;
		kb.setHotswap(MX);
		kb.setMatrix(70, 6, 4);
		kb.setExtras([2, 4], 3, 0, 4);
		kb.kit = [
			"https://keebd.com/products/ergodash-keyboard-kit",
			"https://shop.yushakobo.jp/en/products/ergodash",
		];
		add(kb);
		
		kb = {
			name: "ErgoMax",
			source: "https://github.com/LouWii/ErgoMax",
			img: "ergomax.jpg"
		};
		kb.caseType = Included;
		kb.setHotswap(MX);
		kb.setMatrix(88, 6, 5);
		kb.setExtras(6, 4, -1, 5);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "Penguin",
			source: "https://github.com/gorbit99/penguin",
			img: "penguin.jpg"
		};
		kb.setHotswap(Choc, Choc);
		kb.setMatrix(70, 6, 4);
		kb.setExtras(5, 2, 0, 4);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "Taira",
			source: "https://github.com/strayer/taira-keyboard",
			connection: [Wired, Bluetooth],
			firmware: ZMK,
			img: "taira-1.0.jpg"
		};
		kb.caseType = Included;
		kb.setHotswap(Choc, Choc);
		kb.setMatrix(66, 6, 4);
		kb.setExtras([5, 6], 0, 0, [3, 4]);
		add(kb);
		
		kb = {
			name: "Breeze",
			navCluster: Full,
			thumbKeys: 4,
			web: "https://www.afternoonlabs.com/breeze/",
			source: "https://github.com/afternoonlabs/BreezeKeyboard",
			kit: "!https://keeb.io/products/afternoon-labs-breeze-keyboard-kit/?afmc=yal",
			img: "breeze.avif"
		};
		kb.setMatrix(66, 6, 4);
		kb.rcols = 9;
		kb.setHotswap([MX, Choc], MX);
		kb.setQMK(VIA);
		add(kb);
		
		kb = {
			name: "ErgoNICE",
			navCluster: Arrows,
			thumbKeys: 4,
			encoders: 1,
			firmware: Firmware.Custom,
			web: "https://val.packett.cool/blog/ergonice/",
			source: "https://codeberg.org/valpackett/ergonice",
			img: "ergoNICE.jpg"
		};
		kb.caseType = Included;
		kb.setMatrix(69, 6, 4);
		kb.rcols = 7;
		kb.setHotswap(MX);
		add(kb);
		
		kb = {
			name: "Willow64",
			thumbKeys: 5,
			source: "https://github.com/hanachi-ap/willow64-doc",
			img: "Willow64.jpg"
		};
		kb.caseType = Included;
		kb.setMatrix(64, 6, 4);
		kb.rcols = 8;
		kb.splay = true;
		kb.setQMK(VIA);
		add(kb);
		
		kb = {
			name: "Chunky",
			encoders: 2,
			trackballs: [0, 2],
			trackpads: [0, 2],
			trackpadSize: 40,
			source: "https://github.com/freznel10/ChunkyV2",
			img: "chunky-v2.jpg",
			notes: "TODO: Author has a bunch of revisions of this keyboard - figure out if this entry needs to be split up."
		};
		kb.setMatrix(66, 6, 4);
		kb.setExtras(7, 3, 0, 0);
		add(kb);
		
		kb = {
			name: "JiaEX",
			source: "https://github.com/osenchenko/jiaex",
			img: "jiaex.jpg",
			notes: "This keyboard is hard to classify due to its uncommon key placement"
		};
		kb.caseType = Included;
		kb.wristPads = Integrated;
		kb.setMatrix(68, 6, 4);
		kb.setExtras(4, 3, 1, 3);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "supersplit",
			pinkyStagger: 1,
			switchProfile: Choc,
			web: "https://tarneo.fr/posts/split_keyboard",
			source: "https://github.com/tarneaux/supersplit",
			img: "supersplit.webp"
		};
		kb.setMatrix(68, 6, 4);
		kb.setExtras(9);
		add(kb);
		
		kb = {
			name: "Ergoinu",
			pinkyStagger: 0.1,
			source: "https://github.com/hsgw/ergoinu",
			kit: "!https://dm9.thebase.in/items/13093286",
			img: "Ergoinu.jfif",
		};
		kb.caseType = Included;
		kb.setMatrix(66, 7, 4);
		kb.setExtras(5);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "interphase",
			source: "https://github.com/Durburz/interphase",
			img: "interphase.jpg",
		};
		kb.setMatrix(66, 7, 4);
		kb.setExtras(2, 0, -1, 4);
		add(kb);
		
		kb = {
			name: "Djinn",
			source: "https://github.com/tzarc/djinn",
			dpads: 2,
			dpadDirs: 5,
			displays: 2,
			img: "djinn.jfif",
		};
		kb.setMatrix(64, 7, 4);
		kb.setExtras(4);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "Kapl",
			source: "https://github.com/keyzog/kapl",
			encoders: [0, 1],
			img: "Kapl.jpg"
		};
		kb.caseType = Included;
		kb.setMatrix([69, 70], 7, 4);
		kb.setExtras(4, 0, 0, 4);
		kb.setQMK();
		add(kb);
		
		function addHillside(kb:ColStagKeyboard) {
			kb.splay = Splay.Optional;
			kb.setHotswap(Choc, Choc);
			kb.setQMK();
			kb.pinkyStagger = 0.8;
			kb.source = "https://github.com/mmccoyd/hillside";
			kb.kit = "https://shop.beekeeb.com/product/hillside-keyboard-kit/";
			kb.prebuilt = "https://shop.beekeeb.com/product/pre-soldered-hillside-keyboard/";
			add(kb);
		}
		kb = new ColStagKeyboard("Hillside 52/56");
		kb.setMatrix([44, 56], [5, 6], 3);
		kb.setExtras(5, 0, 0, [3, 4]);
		kb.navCluster = Arrows;
		kb.img = [
			"Hillside-52.webp",
			"Hillside-56.jpg",
		];
		addHillside(kb);
		
		kb = new ColStagKeyboard("Hillside 46/48");
		kb.setMatrix([40, 48], [5, 6], 3);
		kb.setExtras(5, 0, 0, [0, 1]);
		kb.img = [
			"Hillside-46.jpg",
			"Hillside-48.jpg",
		];
		addHillside(kb);
		
		kb = {
			name: "Drift",
			source: "https://github.com/Timception/Drift/",
			prebuilt: "![th] https://solo.to/timception",
			encoderType: EncoderType.Wheel,
			encoders: 2,
			displays: 2,
			img: "Drift.jpg"
		};
		kb.setMatrix(68, 8, 4);
		kb.setExtras(3, 0, -1, 0);
		kb.setQMK(Vial);
		kb.caseType = Included;
		add(kb);
		
		kb = {
			name: "Fortitude60",
			thumbKeys: 6,
			switchProfile: MX,
			source: "https://github.com/Pekaso/fortitude60",
			kit: "https://shop.yushakobo.jp/en/products/fortitude60",
			img: "Fortitude60.jfif",
		};
		kb.setMatrix(60, 6, 4);
		kb.caseType = Included;
		add(kb);
		
		function addDilemma(kb:ColStagKeyboard) {
			kb.trackpads = 1;
			kb.encoders = [0, 2];
			kb.hotswap = HotSwap.Yes;
			kb.switchProfile = [MX, Choc];
			kb.setQMK(VIA);
			kb.caseType = [Included, ThirdParty];
			add(kb);
		}
		addDilemma({
			name: "Dilemma",
			keys: [34, 36],
			cols: 5, rows: 3,
			thumbKeys: [2, 4],
			source: "https://github.com/Bastardkb/Dilemma",
			kit: "!https://bastardkb.com/product/dilemma/",
			prebuilt: "!https://bastardkb.com/product/dilemma-prebuilt-preorder/",
			img: "Dilemma.jpg",
		});
		addDilemma({
			name: "Dilemma Max",
			keys: [54, 56],
			cols: 6, rows: 4,
			thumbKeys: [3, 4],
			source: "https://github.com/Bastardkb/Dilemma",
			kit: "!https://bastardkb.com/product/dilemma-max/",
			prebuilt: "!https://bastardkb.com/product/dilemma-max-prebuilt-preorder/",
			img: "Dilemma-Max.jpg",
		});
		
		kb = {
			name: "Ursa Minor",
			img: "ursa-minor.webp",
			thumbKeys: 3,
			switchProfile: Choc,
			keySpacing: KeySpacing.MX,
			assembly: Handwired,
			source: "https://github.com/markstory/ursa-minor-keyboard/",
		};
		kb.setMatrix(54, 6, 4);
		add(kb);
		
		kb = {
			name: "articulation80",
			thumbKeys: 4,
			navCluster: Full,
			switchProfile: Choc,
			keySpacing: KeySpacing.Choc,
			source: "https://github.com/mylestunglee/articulation80",
			img: "articulation80.jpg",
		};
		kb.setMatrix([56, 80], 6, 4);
		kb.splay = true;
		kb.caseType = Included;
		add(kb);
		
		add({
			name: "3w6",
			keys: [35, 36],
			cols: 5, rows: 3,
			thumbKeys: 3,
			trackballs: [0, 1],
			trackballSize: pimoroniSize,
			switchProfile: Choc,
			keySpacing: KeySpacing.Choc,
			caseType: Included,
			source: "https://github.com/weteor/3W6",
			kit: [
				"https://keycapsss.com/diy-kits/191/3w6-rp2040-split-keyboard-kit",
			],
			img: "3w6_rev2.jpg",
		});
		
		add({
			name: "CozyKeys Bloomer",
			keys: 87,
			cols: 6, rows: 5,
			thumbKeys: 5,
			cornerKeys: 6,
			navCluster: Full,
			switchProfile: MX,
			shape: Unibody,
			caseType: Included,
			source: "https://github.com/cozykeys/Bloomer",
			img: "Bloomer.jfif",
		});
		
		add({
			name: "Keyclicks W-Ergolite",
			keys: 66,
			cols: 7, rows: 4,
			thumbKeys: 5,
			switchProfile: [MX, GateronLP],
			connection: [Wireless],
			firmware: QMK,
			software: Vial,
			caseType: Included,
			prebuilt: "!https://keyclicks.ca/products/w-ergolite-2-4g-wireless-split-keyboard-2",
			img: "W-Ergolite.webp",
		});
		
		kb = {
			name: "Tern",
			shape: Unibody,
			keys: 30,
			cols: 5, rows: 3,
			innerKeys: -1,
			outerKeys: -1,
			thumbKeys: 2,
			switchProfile: Choc,
			keySpacing: CFX,
			caseType: Included,
			source: "https://github.com/rschenk/tern",
			img: "tern.jpeg",
		};
		kb.splay = true;
		add(kb);
		
		kb = {
			name: "Rolio",
			encoders: 2,
			thumbKeys: 5,
			connection: [Wired, Bluetooth],
			firmware: ZMK,
			pinkyStagger: 0.25,
			caseType: Included,
			source: "https://github.com/MickiusMousius/RolioKeyboard",
			img: "Rolio.jpg"
		};
		kb.setMatrix(46, 6, 3);
		add(kb);
		
		kb = new ColStagKeyboard("Chrumm 1.0");
		kb.setMatrix([64, 70], 6, 4);
		kb.rcols = 7;
		kb.shape = Unibody;
		kb.hotswap = HotSwap.Yes;
		kb.switchProfile = MX;
		kb.firmware = Firmware.Custom;
		kb.thumbKeys = 4;
		kb.navCluster = Arrows;
		kb.cornerKeys = 1;
		kb.encoders = 1;
		kb.wristPads = Detachable;
		kb.tenting = 6;
		kb.caseType = Included;
		kb.source = "https://github.com/sevmeyer/chrumm-keyboard/";
		kb.img = "Chrumm.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Alien Invader");
		kb.setMatrix(36, 5, 3);
		kb.thumbKeys = 3;
		kb.hotswap = HotSwap.Yes;
		kb.switchProfile = MX;
		kb.shape = Monoblock;
		kb.setQMK(VIA);
		kb.source = "https://github.com/protieusz/ScottoFly/blob/main/ScottoInvader/Alien%20Invader%20Integrated%20PCB%20from%20Scotto%20Invader/README.md";
		kb.img = "alien-invader.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Buzzard");
		kb.setMatrix(40, 5, 3);
		kb.setExtras(3, 0, -1, 0);
		kb.pinkyStagger = 1;
		kb.splay = true;
		kb.displays = 2;
		kb.trackpoints = 1;
		kb.setHotswap(Choc, Choc);
		kb.caseType = Included;
		kb.source = "https://github.com/crehmann/Buzzard";
		kb.img = "buzzard.webp";
		add(kb);
		
		function addReviung41(kb:ColStagKeyboard) {
			kb.setMatrix(41, 6, 3);
			kb.setExtras(3);
			kb.caseType = Included;
			add(kb);
		}
		kb = new ColStagKeyboard("Reviung41");
		kb.img = "REVIUNG41.jpg";
		kb.source = "https://github.com/gtips/reviung";
		kb.setHotswap(MX);
		kb.kit = [
			"https://keebd.com/en-us/products/reviung-41-keyboard-kit",
			"https://customkbd.com/collections/split-keyboards/products/reviung-41",
			"https://www.littlekeyboards.com/products/reviung41-analyst-keyboard-kit",
			"https://shop.beekeeb.com/product/reviung41-hotswap-diy-mechanical-keyboard-pcb-set-kit/",
			"https://keycapsss.com/diy-kits/140/reviung41-keyboard-kit",
		];
		kb.prebuilt = [
			"https://shop.beekeeb.com/product/pre-soldered-reviung41/",
			"https://new.boardsource.xyz/products/Reviung41",
			"https://customkbd.com/collections/split-keyboards/products/reviung-41",
		];
		addReviung41(kb);
		
		kb = new ColStagKeyboard("Trackball Reviung41");
		kb.setHotswap(Choc);
		kb.trackballSize = pimoroniSize;
		kb.trackballs = 1;
		kb.source = "https://github.com/idank/keyboards/tree/main/reviung";
		kb.prebuilt = "!https://holykeebs.com/products/trackball-reviung41-low-profile";
		kb.img = "reviung-trackball.jpg";
		addReviung41(kb);
		
		kb = new ColStagKeyboard("Fisk");
		kb.setMatrix(54, 6, 3);
		kb.setExtras(6, 2, 1, 0);
		kb.setQMK();
		kb.source = "https://github.com/vvhg1/fisk";
		kb.img = "fisk.jpg";
		kb.caseType = Included;
		add(kb);
		
		function addIris(kb:ColStagKeyboard) {
			kb.setMatrix(56, 6, 4);
			kb.setExtras(4);
			kb.caseType = Included;
			add(kb);
		}
		kb = new ColStagKeyboard("Iris");
		kb.setHotswap(MX);
		kb.img = "iris.webp";
		kb.kit = [
			"!https://keeb.io/collections/iris-split-ergonomic-keyboard",
			"https://mechboards.co.uk/collections/kits/products/iris-kit",
			"https://splitkb.com/collections/keyboard-kits/products/iris-rev-7-0",
		];
		kb.prebuilt = "!https://keeb.io/collections/iris-split-ergonomic-keyboard";
		addIris(kb);
		kb = new ColStagKeyboard("Iris CE");
		kb.img = "iris-ce.webp";
		kb.setHotswap(Choc, Choc);
		kb.kit = "!https://keeb.io/collections/iris-split-ergonomic-keyboard/products/iris-ce-low-profile-choc-hotswap-pcbs-for-split-ergonomic-keyboard";
		addIris(kb);
		
		kb = new ColStagKeyboard("TE Cleave");
		kb.setMatrix(
			14+3 + 8+8 + 7+8 + 7+8 + 6+6 + 2+4+4+4+2, 6, 5
		);
		kb.shape = Unibody;
		kb.rcols = 7;
		kb.setExtras(2, 3, 2, 2);
		kb.navCluster = Full;
		kb.switchProfile = Optical;
		kb.hotswap = HotSwap.Yes;
		kb.firmware = Firmware.Custom;
		kb.software = Software.Custom;
		kb.wristPads = Integrated;
		kb.caseType = Included;
		kb.tilt = 2;
		kb.prebuilt = "![CA] https://trulyergonomic.com/ergonomic-keyboards/mechanical-keyboards/products/cleave-truly-ergonomic-mechanical-switch-keyboard/";
		kb.img = "Truly-Ergonomic-Cleave-keyboard-1x1-2.jpg";
		kb.notes = "Flexibility of on-board software is unclear, but it's got a fairly normal keymap";
		add(kb);
		
		kb = new ColStagKeyboard("Glove80");
		kb.shape = [Split, Keywell];
		kb.setMatrix(80, 6, 5);
		kb.setExtras(6, -1, 0, 5);
		kb.hotswap = HotSwap.Yes;
		kb.switchProfile = Choc;
		kb.keySpacing = KeySpacing.Choc;
		kb.connection = [Wired, Bluetooth];
		kb.caseType = Included;
		kb.prebuilt = "!http://www.moergo.com";
		kb.img = "glove80.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("MOMOKA ERGO");
		kb.setMatrix(70, 6, 4);
		kb.setExtras(6, 0, 0, 5);
		kb.setHotswap(MX);
		kb.setQMK();
		kb.caseType = Included;
		kb.web = "https://www.momoka.co/ergo";
		kb.prebuilt = "!https://momoka.store/collections/keyboards/products/momoka-ergo";
		kb.img = "momoka-ergo.webp";
		add(kb);
		
		kb = new ColStagKeyboard("Keyboardio Model 100");
		kb.setMatrix(64, 6, 4);
		kb.setExtras(5, 3, 0, 0);
		kb.setHotswap(MX);
		kb.wristPads = Integrated;
		kb.tenting = [0, 15];
		kb.caseType = Included;
		kb.prebuilt = "!https://shop.keyboard.io/products/model-100";
		kb.img = "keyboardio-m100.webp";
		add(kb);
		
		kb = new ColStagKeyboard("ZSA Voyager");
		kb.setMatrix(52, 6, 4);
		kb.setExtras(2, 0, 0, 0);
		kb.setHotswap(Choc, MX);
		kb.setQMK(Custom);
		kb.tenting = [0, 4];
		kb.caseType = Included;
		kb.prebuilt = "!https://www.zsa.io/voyager/";
		kb.img = "zsa-voyager.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("ZSA Moonlander");
		kb.setMatrix(72, 6, 4);
		kb.setExtras(4, 3, 0, 5);
		kb.setHotswap(MX);
		kb.setQMK(Custom);
		kb.wristPads = Detachable;
		kb.tenting = [0, 40];
		kb.tilt = [ -10, 0];
		kb.caseType = Included;
		kb.prebuilt = "!https://www.zsa.io/moonlander/";
		kb.img = "zsa-moonlander.avif";
		add(kb);
		
		kb = new ColStagKeyboard("ErgoDox EZ");
		kb.setMatrix(76, 6, 4);
		kb.setExtras(6, 3, 0, 5);
		kb.setHotswap(MX);
		kb.setQMK(Custom);
		kb.wristPads = Detachable;
		kb.tenting = [0, 11];
		kb.tilt = [ -10, 0];
		kb.caseType = Included;
		kb.prebuilt = "!https://ergodox-ez.com/";
		kb.img = "ergodox-ez.avif";
		add(kb);
		
		kb = new ColStagKeyboard("Dygma Defy");
		kb.setMatrix(68, 6, 4);
		kb.setExtras(7, 3, 0, 0);
		kb.setHotswap(MX);
		kb.connection = [Wired, Bluetooth];
		kb.wristPads = Integrated;
		kb.tenting = [0, 60];
		kb.tilt = [ -10, 0];
		kb.caseType = Included;
		kb.prebuilt = "!https://dygma.com/pages/defy";
		kb.img = "dygma-defy.webp";
		add(kb);
		
		kb = new ColStagKeyboard("Osprey");
		kb.setMatrix(74, 7, 4);
		kb.setExtras(7, 3, -1, 2);
		kb.hotswap = HotSwap.Yes;
		kb.shape = Unibody;
		kb.pinkyStagger = 0.5;
		kb.caseType = Included;
		kb.source = "!https://github.com/nshie/osprey";
		kb.img = "osprey.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("ErgoTravel");
		kb.setMatrix(54, 6, 3);
		kb.setExtras([2, 3], 2, 0, 4);
		kb.setHotswap([MX, Alps, Choc]);
		kb.caseType = Included;
		kb.source = "https://github.com/jpconstantineau/ErgoTravel";
		kb.kit = "https://mechboards.co.uk/products/ergotravel-kit";
		kb.extras = [
			"![CA] https://store.jpconstantineau.com/#/group/split_boards"
		];
		kb.img = "Ergotravel.jpg";
		add(kb);
	}
}