package ;
import type.IntRange;
import type.EncoderType;
import type.Firmware;
import type.HotSwap;
import type.KeySpacing;
import type.NavCluster;
import type.NumRangeList;
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
			if (kb.stagger == null) kb.stagger = [Column];
			kb.shape ??= Split;
			keyboards.push(kb);
			return kb;
		}
		var pimoroniSize = 4.4;
		var keySpacing:Array<KeySpacing>;
		var kb:ColStagKeyboard;
		
		var corne = kb = new ColStagKeyboard("Corne/crkbd");
		kb.setMatrix(new IntRange(36, 42), new IntRange(5, 6), 3);
		kb.setExtras(3);
		kb.setHotswap([MX, Choc]);
		kb.connection = [Wired, Wireless];
		kb.displays = [0, 2];
		kb.caseType = [ThirdParty];
		kb.lighting = [None, RGB];
		kb.source = "https://github.com/foostan/crkbd";
		kb.kit = [
			"https://splitkb.com/collections/keyboard-kits/products/aurora-corne",
			"https://holykeebs.com",
			"[v:MX] https://new.boardsource.xyz/products/Corne",
			"[v:Choc] https://new.boardsource.xyz/products/Corne_LP",
			"[v:MX] https://nextkeyboard.club/product-tag/corne-v3-0-1-mx/",
			"[v:MX] https://customkbd.com/collections/split-keyboards/products/corne-classic-kit",
			"[v:Choc] https://42keebs.eu/shop/kits/pro-micro-based/corne-chocolate-low-profile-hotswap-split-ergo-40-kit/",
			"[v:MX] https://www.diykeyboards.com/keyboards/keyboard-kits/product/corne-keyboard-kit",
			"[v:MX] https://keebd.com/products/corne-cherry-v3-rgb-keyboard-kit",
			"[v:Choc] https://keebd.com/products/corne-choc-low-profile-rgb-keyboard-kit",
			"[v:MX] https://keyhive.xyz/shop/corne-v3",
			"https://mechboards.co.uk/collections/kits/products/helidox-corne-kit",
			"[v:Choc] https://shop.yushakobo.jp/en/products/corne-chocolate",
			"https://www.littlekeyboards.com/collections/corne-pcb-kits",
			"https://keebmaker.com/collections/kits",
			"[v:MX] https://shop.beekeeb.com/product/corne-cherry-v3-0-1-crkbd-hotswap-split-keyboard-pcb-set/",
			"[v:Choc] https://shop.beekeeb.com/product/crkbd-v3-corne-keyboard-choc-chocolate-low-profile-lp-pcb-kit/",
			"[US] [n:WeirdLittleKeebs] https://www.etsy.com/listing/1113750577/corne-light-v2-pcb @ https://www.etsy.com/shop/WeirdLittleKeebs",
			"https://keycapsss.com/keyboard-parts/pcbs/53/crkbd-split-keyboard-pcb-corne-helidox",
			//
			"[v:v3 MX] https://falbatech.click/products/Pre-soldered-Corne-p613836639",
			"[v:v3 MX mini] https://falbatech.click/products/Pre-soldered-Corne-mini-p613854160",
			"[v:v3 MX BT] https://falbatech.click/products/Pre-soldered-Corne-Wireless-p613843630",
			"[v:v3 MX BT] https://falbatech.click/products/Pre-soldered-Corne-mini-Wireless-p613843878",
		];
		kb.prebuilt = [
			"https://customkbd.com/collections/split-keyboards/products/corne-classic-kit",
			"[v:BT MX] https://shop.beekeeb.com/product/pre-soldered-wireless-corne-mx-keyboard/",
			"[v:BT Choc] https://shop.beekeeb.com/product/presoldered-wireless-corne-keyboard/",
			"[v:v3 MX] https://shop.beekeeb.com/product/pre-soldered-crkbd-v3-mx-corne-keyboard/",
			"[v:v3 Choc] https://shop.beekeeb.com/product/pre-soldered-crkbd-v3-choc-corne-keyboard-low-profile/",
			"[v:BT Choc] https://keyclicks.ca/products/choc-corne",
			"[v:BT MX] https://keyclicks.ca/products/w-corne-40-2-4g-wireless-split-keyboard",
			//
			"[v:MX] https://falbatech.click/products/Corne-Fully-Assembled-Custom-Mechanical-Keyboard-p630685502",
			"[v:MX mini] https://falbatech.click/products/Corne-mini-Fully-Assembled-Custom-Mechanical-Keyboard-p630813323",
			"[v:MX mini] https://falbatech.click/products/Corne-Mini-Ergonomic-Dark-Bamboo-Keyboard-shipping-in-24h-p613843609",
			"[v:MX mini] https://falbatech.click/products/Corne-Mini-Ergonomic-Natural-Bamboo-Keyboard-with-Tilt-Tent-Set-in-shipping-24h-p613843369",
			"[v:MX BT] https://falbatech.click/products/Corne-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p630685504",
			"[v:MX BT mini] https://falbatech.click/products/Corne-mini-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p631346754"
		];
		kb.extras = [
			"[v:Aluminium case] https://keyhive.xyz/shop/aluminum-corne-helidox-case",
			"[v:Unibody case] https://www.thingiverse.com/thing:6455098",
			"[v:Trackpad module] https://www.thingiverse.com/thing:5425081",
			"[v:Case] https://www.printables.com/model/763144-nusumu-corne-keyboard-case",
		];
		kb.img = "crkbd.jpg";
		kb.addSKBC();
		add(kb);
		
		kb = new ColStagKeyboard("Unicorne", corne);
		kb.trackpoints = [0, 2];
		kb.kit = [
			"[v:MX] https://new.boardsource.xyz/products/unicorne",
			"[v:Choc] https://new.boardsource.xyz/products/unicorne-LP",
		];
		
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
		kb.lighting = [None, RGB];
		kb.web = "https://josefadamcik.github.io/SofleKeyboard/";
		kb.source = "https://github.com/josefadamcik/SofleKeyboard";
		kb.kit = [
			"[v:v2] https://keebd.com/en-us/products/sofle-v2-keyboard-kit",
			"[v:v2] https://splitkb.com/collections/keyboard-kits/products/aurora-sofle-v2?variant=46912405635419",
			"[v:v1, v1 Choc, v2] https://mechboards.co.uk/collections/kits/products/sofle-kit",
			"[v:v1, v2, v2 RGB] https://customkbd.com/collections/split-keyboards",
			"[v:v2] https://42keebs.eu/shop/kits/pro-micro-based/sofle-v2-hotswap-split-ergo-50-kit-black/",
			"[v:v2 RGB] https://keebd.com/products/sofle-v2-1-rgb-keyboard-kit",
			"[v:v2] https://keebd.com/products/sofle-v2-1-choc-keyboard-kit",
			"[v:v2 RGB] https://www.littlekeyboards.com/products/sofle-rgb-pcb-kit",
			"[v:MX, Choc] https://keebmaker.com/collections/kits",
		];
		kb.prebuilt = [
			"[v:MX] https://falbatech.click/products/Sofle-Fully-Assembled-Custom-Mechanical-Keyboard-p631773372",
			"[v:MX wireless] https://falbatech.click/products/Sofle-Fully-Assembled-Custom-Mechanical-Keyboard-p631773372",
			"[v:v2 RGB] https://shop.beekeeb.com/product/pre-soldered-sofle-rgb-mx/",
			"[v:v2] https://shop.beekeeb.com/product/sofle-v2-soflekeyboard-v2-0-1-split-ergonomic-diy-mechanical-keyboard-pcb-set/",
			"[v:v1, v2, v2 RGB] https://customkbd.com/collections/split-keyboards",
			"[v:v2, v2 RGB] https://ergomech.store/shop?search=&order=&attrib=&attrib=&attrib=&attrib=&attrib=11-22&attrib=",
		];
		kb.extras = [
			"[v:v2 tented case] https://shop.beekeeb.com/product/sofle-2-tented-case/",
			"[v:v2 printable case] https://github.com/kb-elmo/SofleCase",
		];
		kb.img = "sofle.jpg";
		kb.addSKBC();
		addSofle(kb);
		var sofle = kb;
		
		function addSofleFT(kb:ColStagKeyboard) {
			kb.notes = "Featuring a variety of bamboo cases";
			kb.connection = [Wired, Bluetooth];
			kb.keys = IntRangeList.either(58, 60);
			kb.encoders = [0, 2];
			kb.displays = [0, 2];
			kb.tenting = [None, Legs];
			kb.setQMK([VIA]);
			add(kb);
		}
		kb = new ColStagKeyboard("Sofle FT", sofle);
		kb.img = "sofle-ft-wireless.webp";
		kb.setHotswap([MX]);
		kb.kit = [
			"[v:Wired] https://falbatech.click/products/Pre-soldered-Sofle-p613836129",
			"[v:Wireless] https://falbatech.click/products/Pre-soldered-Sofle-Wireless-p613834138",
		];
		kb.prebuilt = [
			"[v:Wired] https://falbatech.click/products/Sofle-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p631781585",
			"[v:Wireless] https://falbatech.click/products/Sofle-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p631781585",
		];
		addSofleFT(kb);
		
		kb = new ColStagKeyboard("Sofle FT LP", sofle);
		kb.img = "sofle-ft-lp.webp";
		kb.lighting = [None];
		kb.setHotswap([Choc], MX);
		kb.kit = [
			"[v:Wired] https://falbatech.click/products/Pre-soldered-Sofle-low-profile-p613843876",
			"[v:Wireless] https://falbatech.click/products/Pre-soldered-Sofle-Low-Profile-Wireless-p613870266",
		];
		kb.prebuilt = [
			"[v:Wired] https://falbatech.click/products/Sofle-Low-profile-Fully-Assembled-Custom-Mechanical-Keyboard-p631773376",
			"[v:Wireless] https://falbatech.click/products/Sofle-Low-profile-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p631799062",
		];
		addSofleFT(kb);
		
		kb = new ColStagKeyboard("Sofle Choc");
		kb.notes = [
			"Sofle Choc, not to be confused with Choc Sofle (which has different pinky stagger)"
		];
		kb.setHotswap(Choc, MX);
		kb.caseType = [Included, ThirdParty];
		kb.lighting = [None, RGB];
		kb.web = "https://josefadamcik.github.io/SofleKeyboard/";
		kb.source = "https://github.com/josefadamcik/SofleKeyboard";
		kb.kit = [
			"https://42keebs.eu/shop/kits/pro-micro-based/sofle-choc-hotswap-split-ergo-50-kit-black/",
			"https://splitkb.com/collections/keyboard-kits/products/aurora-sofle-v2?variant=46912405668187",
			"https://www.littlekeyboards.com/products/sofle-choc-pcb-kit",
			"https://shop.beekeeb.com/product/sofle-rgb-choc-chocolate-v2-1-low-profile-soflekeyboard-split-ergonomic-diy-pcb-kit/",
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
		kb.prebuilt = [
			"![n:xcmkb]https://github.com/superxc3/xcmkb"
		];
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
				"https://new.boardsource.xyz/products/lulu",
				"https://new.boardsource.xyz/products/lily58",
				"https://42keebs.eu/shop/kits/pro-micro-based/lily58-pro-hotswap-split-ergo-50-kit-black-white/",
				"https://customkbd.com/collections/split-keyboards/products/lily-58-pro-keyboard-kit",
				"https://keebd.com/products/lily58-pro-keyboard-kit",
				"https://www.littlekeyboards.com/collections/lily58-pcb-kits",
				"https://keyhive.xyz/shop/lily58",
				"https://kriscables.com/lily58/",
				"https://keycapsss.com/keyboard-parts/pcbs/71/lily58l-split-keyboard-pcb",
				"[US] https://capsuledeluxe.com/tag/manta58/"
			],
			prebuilt: [
				"https://customkbd.com/collections/split-keyboards/products/lily-58-pro-keyboard-kit",
				"https://ergomech.store/shop/sofle-v2-sandwich-style-12",
				"https://ergomech.store/shop/lily58-enclose-case-15",
				"https://kriscables.com/lily58/",
				"https://new.boardsource.xyz/products/lily58",
			],
			extras: [
				"[US][v:Case files] https://capsuledeluxe.com/tag/manta58/",
				"[v:Case with palmrest] https://github.com/AgentCosmic/lily58_case",
			],
			img: "lily58.jpg",
		};
		kb.setMatrix(58, 6, 4);
		kb.setExtras(4, 1, 0, 0);
		kb.caseType = Included;
		kb.setHotswap([MX, Choc], MX);
		kb.addSKBC();
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
		kb.addSKBC();
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
			assembly: [PCB, Assembly.Adjustable],
			encoders: [0, 2],
			source: "https://github.com/e3w2q/Pangaea-keyboard",
			img: "Pangaea.jpg",
			notes: "Pinky columns and thumb row can be moved and rotated."
		};
		kb.setHotswap([MX]);
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
			connection: [Wired, Bluetooth],
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
		kb.setMatrix(58, 6, 4);
		kb.setHotswap(Choc, Choc);
		add(kb);
		
		kb = {
			name: "Pinky4",
			thumbKeys: 4,
			source: "https://github.com/tamanishi/Pinky4",
			img: "Pinky4.jpg",
			kit: "https://www.littlekeyboards.com/products/pinky4-keyboard-kit",
			extras: "[v:Cases] https://www.littlekeyboards.com/collections/pinky4-cases",
			notes: "Uses Choc switches for thumb keys"
		};
		kb.setMatrix(64, 6, 4);
		kb.innerKeys = 4;
		kb.caseType = [Included];
		kb.setHotswap(MX);
		add(kb);
		
		kb = new ColStagKeyboard("Pinky3", "Pinky4");
		kb.img = "Pinky3.jpg";
		kb.setMatrix(50, 6, 3);
		kb.innerKeys = 3;
		kb.source = "https://github.com/tamanishi/Pinky3";
		kb.kit = "https://www.littlekeyboards.com/products/pinky3-keyboard-kit";
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
			kb.layoutRef = "https://github.com/vlkv/avalanche/tree/master/layout_tester/pdf";
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
				"[n:xcmkb] https://github.com/superxc3/xcmkb/tree/main/list%20of%20items/list%20of%20keyboards/60percent/avalanche/v4 @ https://github.com/superxc3/xcmkb",
				"https://shop.beekeeb.com/product/pre-soldered-avalanche-v4/"
			],
		});
		
		var redox = kb = new ColStagKeyboard("Redox");
		kb.img = "redox-1.jpg";
		kb.setHotswap(MX);
		kb.setMatrix(70, 6, 4);
		kb.setExtras(5, 2, 0, 4);
		kb.caseType = Included;
		kb.firmware = [QMK, ZMK];
		kb.software = [VIA];
		kb.connection = [Wired, Bluetooth];
		kb.assembly = [PCB, Handwired];
		kb.source = "https://github.com/mattdibi/redox-keyboard";
		kb.extras = [
			"[v:Case] https://github.com/Pastitas/Redox-neo-Case/",
		];
		kb.kit = [
			"https://shop.beekeeb.com/product/redox-wireless-hotswap-keyboard-kit/",
			"https://falbatech.click/products/Redox-Partially-assembled-with-electronics-cables-One-Hand-p613839989",
			"https://falbatech.click/products/REDOX-Wireless-PCB-Electrical-Boards-Set-of-2-receiver-PCB-p613839986",
			"https://falbatech.click/products/REDOX-PCB-Electrical-Boards-Set-of-2-p613836203",
		];
		kb.prebuilt = [
			"[v:Wired] https://falbatech.click/products/ReDOX-Fully-Assembled-Custom-Mechanical-Keyboard-p633260018",
			"[v:Wired] https://falbatech.click/products/Redox-Mechanical-Keyboard-in-Bamboo-Casing-with-Stone-Effect-Elegance-and-Style-for-Enthusiasts-free-Shipping-p613843863",
			"[v:BT] https://falbatech.click/products/ReDOX-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p633260056",
			"https://shop.beekeeb.com/product/redox-fully-assembled/",
		];
		kb.addSKBC();
		add(kb);
		
		kb = new ColStagKeyboard("Redox FT", redox);
		kb.img = "redox-ft.webp";
		kb.assembly = [PCB];
		kb.setHotswap([MX]);
		kb.connection = [Wired, Bluetooth];
		kb.lighting = [None];
		kb.tenting = [None, Legs];
		kb.kit = [
			"[v:Partial?] https://falbatech.click/products/Redox-Partially-assembled-with-electronics-cables-p613843963",
			"[v:Wired] https://falbatech.click/products/Pre-soldered-REDOX-Wired-p613836642",
			"[v:BT] https://falbatech.click/products/Pre-soldered-REDOX_FT-Wireless-p646459789",
			"[v:Gaming?] https://falbatech.click/products/Pre-soldered-REDOX-Gaming-Version-One-Hand-p613853136",
		];
		kb.prebuilt = [
			"[v:wired] https://falbatech.click/products/ReDOX-Fully-Assembled-Custom-Mechanical-Keyboard-p633260018",
			"[v:wired] https://falbatech.click/products/Complete-Redox-Wired-Bamboo-Black-version-with-usb-c-Shipping-in-24-hours-p613836397",
			"[v:wired] https://falbatech.click/products/Redox-Mechanical-Keyboard-in-Bamboo-Casing-with-Stone-Effect-Elegance-and-Style-for-Enthusiasts-free-Shipping-p613843863",
			"[v:BT] https://falbatech.click/products/Pre-soldered-REDOX-Wireless-p613836477",
			"[v:BT] https://falbatech.click/products/ReDOX-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p633260056",
			"[v:BT] https://falbatech.click/products/ReDOX_FT-Wireless-Fully-Assembled-Custom-Mechanical-Keyboard-p648828330",
		];
		var redoxFT = add(kb);
		
		kb = new ColStagKeyboard("Redox FT LP", redoxFT);
		kb.img = "redox-ft-lp.webp";
		kb.setHotswap([Choc], MX);
		kb.kit = [
			"[v:wired] https://falbatech.click/products/Pre-soldered-REDOX_FT-Wired-Low-Profile-p646462293",
			"[v:BT] https://falbatech.click/products/Pre-soldered-REDOX_FT-Wireless-Low-Profile-p646460072",		
		];
		kb.prebuilt = [
			"[v:wired] https://falbatech.click/products/ReDOX_FT-Low-Profile-Fully-Assembled-Custom-Mechanical-Keyboard-p645216766",
			"[v:BT] https://falbatech.click/products/ReDOX_FT-Wireless-Low-Profile-Fully-Assembled-Custom-Mechanical-Keyboard-p645216841",
		];
		add(kb);
		
		kb = new ColStagKeyboard("NeoDox", redox);
		kb.connection = [Wired];
		kb.assembly = [PCB];
		kb.setHotswap([MX], MX);
		kb.encoders = [0, 2];
		kb.prebuilt = [
			"https://ergomech.store/shop/neodox-52",
			"https://ergomech.store/shop/neodox-sandwich-style-exclusive-418",
		];
		kb.img = "NeoDox.jpg";
		kb.notes = "Like Redox, but with 1u edge keys and optional rotary encoders";
		add(kb);
		
		kb = new ColStagKeyboard("Redox Manuform", redox);
		kb.shape = [Split, Keywell];
		kb.assembly = [Handwired];
		kb.notes = ["A Redox / Dactyl Manuform mix"];
		kb.img = "redox-manuform.webp";
		kb.source = "https://www.thingiverse.com/thing:3503380";
		add(kb);
		
		var ergodash = kb = new ColStagKeyboard("ErgoDash");
		kb.source = "https://github.com/omkbd/ErgoDash";
		kb.img = "Ergodash.jpg";
		kb.setNotswap([MX, Alps], MX);
		kb.setMatrix(70, 6, 4);
		kb.setExtras([2, 4], 3, 0, 4);
		kb.kit = [
			"https://keebd.com/products/ergodash-keyboard-kit",
			"https://shop.yushakobo.jp/en/products/ergodash",
			"https://keycapsss.com/keyboard-parts/pcbs/63/ergodash-split-keyboard-pcb",
		];
		kb.caseType = Included;
		kb.addSKBC();
		add(kb);
		
		kb = new ColStagKeyboard("ErgoDash LP", ergodash);
		kb.source = "https://keypcb.xyz/ErgoDash-LP";
		kb.img = "ErgoDashLP.jpg";
		kb.switchProfile = Choc;
		kb.setNotswap([Choc], MX);
		add(kb);
		
		kb = new ColStagKeyboard("ErgoDash_FT", ergodash);
		kb.img = "ergodash-ft.webp";
		kb.setHotswap([MX]);
		kb.lighting = [Simple];
		kb.connection = [Wired, Bluetooth];
		kb.kit = [
			"[v:wired] https://falbatech.click/products/Pre-soldered-ErgoDash-p613842367",
			"[v:wireless] https://falbatech.click/products/Pre-soldered-ErgoDash-Wireless-p613839936",
		];
		kb.prebuilt = [
			"https://falbatech.click/products/ErgoDash-Fully-Assembled-Custom-Mechanical-Keyboard-p630613785",
		];
		add(kb);
		
		kb = new ColStagKeyboard("ErgoDash_FT Blue", ergodash);
		kb.img = "ergodash-ft.webp";
		kb.setNotswap([MX], MX);
		kb.lighting = [Simple];
		kb.prebuilt = "https://falbatech.click/products/ErgoDash-Blue-backlite-Shipping-in-24-hours-p613853121";
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
		kb.setNotswap(Choc, Choc);
		kb.setMatrix(70, 6, 4);
		kb.setExtras(5, 2, 0, 4);
		kb.setQMK();
		kb.caseType = [None];
		add(kb);
		
		kb = {
			name: "Taira",
			source: "https://github.com/strayer/taira-keyboard",
			connection: [Wired, Bluetooth],
			firmware: ZMK,
			img: "taira-1.0.jpg"
		};
		kb.caseType = Included;
		kb.setHotswap(Choc, MX);
		kb.setMatrix(66, 6, 4);
		kb.setExtras([5, 6], 0, 0, [3, 4]);
		add(kb);
		
		kb = {
			name: "Breeze",
			navCluster: NavCluster.Full,
			thumbKeys: 4,
			web: "https://www.afternoonlabs.com/breeze/",
			source: "https://github.com/afternoonlabs/BreezeKeyboard",
			kit: "!https://keeb.io/products/afternoon-labs-breeze-keyboard-kit/?afmc=yal",
			img: "breeze.avif"
		};
		kb.setMatrix(66, 6, 4);
		kb.rcols = 9;
		kb.setHotswap([MX, Choc], MX);
		kb.caseType = [Included];
		kb.extras = "[v:Case] https://github.com/afternoonlabs/breeze-contribs/tree/main/CAD";
		kb.setQMK(VIA);
		add(kb);
		
		kb = {
			name: "ErgoNICE",
			navCluster: NavCluster.Arrows,
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
		kb.setHotswap([MX]);
		kb.rcols = 8;
		kb.splay = true;
		kb.setQMK(VIA);
		add(kb);
		
		kb = {
			name: "Chunky",
			encoders: 2,
			hotswap: [Yes],
			trackballs: [0, 2],
			trackpads: [0, 2],
			trackpadSize: 40,
			source: "https://github.com/freznel10/ChunkyV2",
			img: "chunky-v2.jpg",
			notes: "TODO: Author has a bunch of revisions of this keyboard - figure out if this entry needs to be split up."
		};
		kb.pointingDevices = 2;
		kb.setMatrix(66, 6, 4);
		kb.setExtras(7, 3, 0, 0);
		kb.caseType = [Included];
		add(kb);
		
		kb = {
			name: "JiaEX",
			source: "https://github.com/osenchenko/jiaex",
			img: "jiaex.jpg",
			notes: "This keyboard is hard to classify due to its uncommon key placement"
		};
		kb.setNotswap([MX]);
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
		kb.hotswap = [No];
		kb.caseType = [None];
		add(kb);
		
		kb = {
			name: "Ergoinu",
			pinkyStagger: 0.1,
			source: "https://github.com/hsgw/ergoinu",
			kit: "!https://dm9.thebase.in/items/13093286",
			img: "Ergoinu.jfif",
		};
		kb.switchProfile = [MX];
		kb.hotswap = [No];
		kb.caseType = Included;
		kb.setMatrix(64, 7, 4);
		kb.setExtras(5);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "interphase",
			source: "https://github.com/Durburz/interphase",
			img: "interphase.jpg",
		};
		kb.setNotswap([MX]);
		kb.setMatrix(66, 7, 4);
		kb.setExtras(2, 0, -1, 4);
		kb.caseType = [None];
		kb.addSKBC();
		add(kb);
		
		kb = {
			name: "Djinn",
			source: "https://github.com/tzarc/djinn",
			dpads: 2,
			dpadDirs: 5,
			displays: 2,
			img: "djinn.jfif",
		};
		kb.setHotswap([MX]);
		kb.setMatrix(64, 7, 4);
		kb.setExtras(4);
		kb.caseType = [Included];
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "Kapl",
			source: "https://github.com/keyzog/kapl",
			encoders: [0, 1],
			img: "Kapl.jpg"
		};
		kb.switchProfile = [MX];
		kb.hotswap = [No];
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
			kb.caseType = [None];
			kb.source = "https://github.com/mmccoyd/hillside";
			kb.kit = "https://shop.beekeeb.com/product/hillside-keyboard-kit/";
			kb.prebuilt = "https://shop.beekeeb.com/product/pre-soldered-hillside-keyboard/";
			add(kb);
		}
		
		kb = new ColStagKeyboard("Hillside 52");
		kb.setMatrix(IntRangeList.either(44, 52), [5, 6], 3);
		kb.setExtras(5, 0, 0, 3);
		kb.splay = Yes;
		kb.navCluster = [Arrows, Duo];
		kb.img = "Hillside-52.webp";
		addHillside(kb);
		
		kb = new ColStagKeyboard("Hillside 56");
		kb.setMatrix(IntRangeList.either(48, 56), [5, 6], 3);
		kb.setExtras(5, 0, 0, 4);
		kb.navCluster = [Arrows, Duo];
		kb.img = "Hillside-56.jpg";
		addHillside(kb);
		
		kb = new ColStagKeyboard("Hillside 46");
		kb.setMatrix(IntRangeList.either(40, 46), [5, 6], 3);
		kb.setExtras(5, 0, 0, 0);
		kb.img = "Hillside-46.jpg";
		addHillside(kb);
		
		kb = new ColStagKeyboard("Hillside 48");
		kb.setMatrix(IntRangeList.either(42, 48), [5, 6], 3);
		kb.setExtras(5, 0, 0, 1);
		kb.img = "Hillside-48.jpg";
		addHillside(kb);
		
		kb = {
			name: "Drift",
			web: "https://github.com/Timception/Drift/",
			prebuilt: "![th] https://solo.to/timception",
			encoderType: EncoderType.Wheel,
			encoders: 2,
			displays: 2,
			img: "Drift.jpg"
		};
		kb.setMatrix(68, 8, 4);
		kb.setExtras(3, 0, -1, 0);
		kb.setHotswap(MX);
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
		kb.hotswap = [No];
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
			thumbKeys: [2, 3],
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
			keySpacing: [MX],
			assembly: [Handwired, PCB],
			source: "https://github.com/markstory/ursa-minor-keyboard/",
		};
		kb.caseType = [Included];
		kb.setMatrix(54, 6, 4);
		add(kb);
		
		kb = {
			name: "articulation80",
			thumbKeys: 4,
			navCluster: Full,
			source: "https://github.com/mylestunglee/articulation80",
			img: "articulation80.jpg",
			notes: "Numpad/navigation blocks and top row can be breaken off."
		};
		kb.setHotswap([Choc], KeySpacing.Choc);
		kb.setMatrix([56, 80], 6, 4);
		kb.rcols = [6, 9];
		kb.lcols = [6, 9];
		kb.splay = true;
		kb.caseType = Included;
		kb.numpad = [None, Mini];
		add(kb);
		
		add({
			name: "3w6",
			keys: [35, 36],
			cols: 5, rows: 3,
			thumbKeys: 3,
			trackballs: [0, 1],
			trackballSize: pimoroniSize,
			hotswap: [No],
			switchProfile: Choc,
			keySpacing: KeySpacing.Choc,
			caseType: Included,
			source: "https://github.com/weteor/3W6",
			kit: [
				"https://keycapsss.com/diy-kits/191/3w6-rp2040-split-keyboard-kit",
			],
			prebuilt: [
				"https://shop.beekeeb.com/product/pre-soldered-3w6-keyboard/",
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
			hotswap: [No],
			switchProfile: MX,
			shape: Unibody,
			caseType: Included,
			source: "https://github.com/cozykeys/Bloomer",
			img: "Bloomer.jfif",
		});
		
		add({
			name: "Ergolite",
			keys: 66,
			cols: 7, rows: 4,
			thumbKeys: 5,
			hotswap: [Yes],
			switchProfile: [MX, GateronLP],
			connection: [Wireless],
			firmware: QMK,
			software: Vial,
			caseType: Included,
			prebuilt: [
				//"https://keyclicks.ca/products/w-ergolite-2-4g-wireless-split-keyboard-2", // off sale?
				"https://www.ergokbd.com/products/if-ergolite-wireless2-4g-hotswap-split-mechanical-keyboard-low-profile-pre-soldered-acrylic-vial-programmable-ergodox-ergodone-if-ergo"
			],
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
			hotswap: [Yes],
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
			kit: "!https://keydio.io/",
			img: "Rolio.jpg"
		};
		kb.setNotswap([Choc]);
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
		kb.tenting = [Fixed];
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
		kb.assembly = [Handwired];
		kb.caseType = [Included];
		kb.setQMK(VIA);
		kb.source = "https://github.com/protieusz/ScottoFly/blob/main/ScottoInvader/Alien%20Invader%20Integrated%20PCB%20from%20Scotto%20Invader/README.md";
		kb.img = "alien-invader.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Buzzard");
		kb.setMatrix(40, 6, 3);
		kb.setExtras(3, 0, -1, 0);
		kb.pinkyStagger = 1;
		kb.splay = true;
		kb.displays = 2;
		kb.trackpoints = 1;
		kb.setHotswap(Choc, Choc);
		kb.hotswap = [HotSwap.Yes, HotSwap.Special];
		kb.caseType = Included;
		kb.source = "https://github.com/crehmann/Buzzard";
		kb.img = "buzzard.webp";
		kb.notes = ["Hotswap sockets cannot be used next to the trackpoint(s)"];
		add(kb);
		
		function addReviung41(kb:ColStagKeyboard) {
			kb.setMatrix(41, 6, 3);
			kb.setExtras(3);
			kb.caseType = Included;
			kb.shape = Unibody;
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
			"https://new.boardsource.xyz/products/Reviung41",
		];
		kb.prebuilt = [
			"https://shop.beekeeb.com/product/pre-soldered-reviung41/",
			"https://new.boardsource.xyz/products/Reviung41",
			"https://customkbd.com/collections/split-keyboards/products/reviung-41",
		];
		kb.addSKBC();
		addReviung41(kb);
		
		kb = new ColStagKeyboard("Reviung41 with trackball");
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
		kb.assembly = [Handwired];
		kb.displays = 2;
		kb.setNotswap([MX]);
		add(kb);
		
		function addIris(kb:ColStagKeyboard) {
			kb.setMatrix(56, 6, 4);
			kb.setExtras(4);
			kb.caseType = Included;
			add(kb);
		}
		
		kb = new ColStagKeyboard("Iris");
		kb.setHotswap([MX, Alps, Choc]);
		kb.hotswap = [No, Yes];
		kb.keySpacing = [MX];
		kb.img = "iris.webp";
		kb.kit = [
			"![v:r7] https://keeb.io/collections/iris-split-ergonomic-keyboard",
			"![v:r5] https://keeb.io/collections/iris-split-ergonomic-keyboard/products/iris-rev-5-keyboard-pcbs-for-split-ergonomic-keyboard",
			"https://mechboards.co.uk/collections/kits/products/iris-kit",
			"https://splitkb.com/collections/keyboard-kits/products/iris-rev-7-0",
		];
		kb.extras = [
			"[v:Case with palm rests] https://github.com/elentok/iris-case",
		];
		kb.prebuilt = [
			"![v:Multiple revisions] https://keeb.io/collections/iris-split-ergonomic-keyboard",
		];
		kb.notes = [
			"NB! Choc/Alps switches are only available in Rev5, which isn't hotswap",
		];
		kb.addSKBC();
		addIris(kb);
		
		kb = new ColStagKeyboard("Iris CE");
		kb.setHotswap([Choc]);
		kb.keySpacing = [Choc];
		kb.img = "iris-ce-left_860x.webp";
		kb.kit = [
			"!https://keeb.io/collections/iris-split-ergonomic-keyboard/products/iris-ce-low-profile-choc-hotswap-pcbs-for-split-ergonomic-keyboard",
		];
		kb.prebuilt = [];
		addIris(kb);
		
		kb = new ColStagKeyboard("Atreis");
		kb.shape = Unibody;
		kb.setHotswap(MX);
		kb.assembly = [PCB, Handwired];
		kb.source = "https://github.com/dekonnection/atreis";
		kb.img = "atreis.jpg";
		kb.firmware = QMK;
		addIris(kb);
		
		kb = new ColStagKeyboard("TE Cleave");
		kb.setMatrix(
			14+3 + 8+8 + 7+8 + 7+8 + 6+6 + 2+4+4+4+2, 6, 5
		);
		kb.shape = Unibody;
		kb.rcols = 7;
		kb.setExtras(2, 3, 2, 2);
		kb.navCluster = Duo;
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
		kb.hotswap = [HotSwap.No, HotSwap.Special];
		kb.switchProfile = Choc;
		kb.keySpacing = KeySpacing.Choc;
		kb.connection = [Wired, Bluetooth];
		kb.firmware = Firmware.ZMK;
		kb.software = Software.Custom;
		kb.wristPads = WristPads.Detachable;
		kb.caseType = Included;
		kb.prebuilt = "!http://www.moergo.com";
		kb.img = "glove80.jpg";
		kb.notes = [
			"There is no hot-swap. However, MoErgo offers an unsoldered version that saves one from having to unsolder the built-in switches. Still, one needs to solder the new ones.",
			"Hardware extension support: 6 digital GPIOs (inside the case)"
		];
		add(kb);
		
		kb = new ColStagKeyboard("Ergodox-like");
		kb.setMatrix(70, 6, 4);
		kb.setExtras(6, 0, 0, 5);
		kb.switchProfile = [MX];
		kb.hotswap = [Yes, No];
		kb.setQMK();
		kb.caseType = Included;
		kb.web = "";
		kb.kit = [
			"https://drop.com/buy/infinity-ergodox",
			"https://mechanicalkeyboards.com/products/ergodox-pcb-dual-layer-electrical-boards-set-of-2",
			"https://falbatech.click/products/Pre-soldered-ErgoDox_FT-p613836128",
			"https://falbatech.click/products/Pre-Soldered-ErgoDox_FT-Gaming-p613836460"
		];
		kb.prebuilt = [
			"https://momoka.store/collections/keyboards/products/momoka-ergo",
			"https://www.ergokbd.com/products/if-ergo-wireless2-4g-hotswap-split-mechanical-keyboard-pre-soldered-acrylic-vial-programmable-ergodox-ergodone",
			"https://keyclicks.ca/collections/keyboards/products/w-ergo-2-4g-wireless-split-ergonomic-mechanical-keyboard",
			"https://falbatech.click/products/Ergodox_FT-Fully-Assembled-Custom-Mechanical-Keyboard-p630813415",
		];
		kb.img = "momoka-ergo.webp";
		kb.notes = [
			"There are multiple keyboards using an Ergodox[-like] layout",
			"Ergodox EZ is separated from these due to presence of tenting legs",
		];
		var ergodoxy = add(kb);
		
		kb = new ColStagKeyboard("Ergodox_FT LP", ergodoxy);
		kb.img = "ergodox-ft-lp.jpg";
		kb.setHotswap([Choc]);
		kb.lighting = [None];
		kb.kit = [
			"https://falbatech.click/products/Pre-soldered-ErgoDox_FT-Low-Profile-p613843614",
			"https://falbatech.click/products/Pre-soldered-ErgoDox_FT-Low-Profile-Gaming-Version-One-Hand-p619550388",
		];
		kb.prebuilt = "https://falbatech.click/products/Ergodox_FT-Low-Profile-Fully-Assembled-Custom-Mechanical-Keyboard-p613836480";
		add(kb);
		
		kb = new ColStagKeyboard("Keyboardio Model 100");
		kb.setMatrix(64, 6, 4);
		kb.setExtras(5, 3, 0, 0);
		kb.setHotswap(MX);
		kb.wristPads = Integrated;
		kb.tenting = [Legs, Mount];
		kb.caseType = Included;
		kb.prebuilt = "!https://shop.keyboard.io/products/model-100";
		kb.img = "keyboardio-m100.webp";
		add(kb);
		
		kb = new ColStagKeyboard("ZSA Voyager");
		kb.setMatrix(52, 6, 4);
		kb.setExtras(2, 0, 0, 0);
		kb.setHotswap(Choc, MX);
		kb.setQMK(Custom);
		kb.tenting = [None, Legs, Mount];
		kb.caseType = Included;
		kb.prebuilt = "!https://www.zsa.io/voyager/";
		kb.img = "zsa-voyager.jpg";
		kb.layoutRef = "https://www.zsa.io/assets/voyager/1-1.pdf";
		add(kb);
		
		kb = new ColStagKeyboard("ZSA Moonlander");
		kb.setMatrix(72, 6, 4);
		kb.setExtras(4, 3, 0, 5);
		kb.setHotswap(MX);
		kb.setQMK(Custom);
		kb.wristPads = Detachable;
		kb.tenting = [None, Legs, Mount];
		kb.tilt = [ -10, 0];
		kb.caseType = Included;
		kb.prebuilt = "!https://www.zsa.io/moonlander/";
		kb.img = "zsa-moonlander.avif";
		kb.layoutRef = "https://www.zsa.io/1-1.pdf";
		kb.addSKBC();
		add(kb);
		
		kb = new ColStagKeyboard("ErgoDox EZ");
		kb.setMatrix(76, 6, 4);
		kb.setExtras(6, 3, 0, 5);
		kb.setHotswap(MX);
		kb.setQMK(Custom);
		kb.wristPads = Detachable;
		kb.tenting = [None, Legs, Mount];
		kb.tilt = [ -10, 0];
		kb.caseType = Included;
		kb.prebuilt = "!https://ergodox-ez.com/";
		kb.img = "ergodox-ez.avif";
		kb.addSKBC();
		add(kb);
		
		kb = new ColStagKeyboard("Dygma Defy");
		kb.setMatrix(68, 6, 4);
		kb.setExtras(7, 3, 0, 0);
		kb.setHotswap(MX);
		kb.connection = [Wired, Bluetooth];
		kb.wristPads = Integrated;
		kb.tenting = [None, Legs, Mount];
		kb.tilt = [ -10, 0];
		kb.caseType = Included;
		kb.prebuilt = "!https://dygma.com/pages/defy";
		kb.img = "dygma-defy.webp";
		kb.addSKBC();
		add(kb);
		
		kb = new ColStagKeyboard("Osprey");
		kb.setMatrix(74, 7, 4);
		kb.setExtras(7, 3, -1, 2);
		kb.hotswap = HotSwap.Yes;
		kb.switchProfile = [MX];
		kb.shape = Unibody;
		kb.pinkyStagger = 0.5;
		kb.caseType = Included;
		kb.source = "https://github.com/nshie/osprey";
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
			"![CA][v:Cases] https://store.jpconstantineau.com/#/group/split_boards"
		];
		kb.img = "Ergotravel.jpg";
		kb.addSKBC();
		add(kb);
	}
}