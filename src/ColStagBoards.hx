package ;
import js.lib.webassembly.CompileError;
import js.html.AbortController;
import type.Firmware;
import type.Software;
import type.Connection;
import type.SwitchProfile;
import type.Assembly;
import type.Shape;
import type.Splay;

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
		
		kb = {
			name: "Sofle",
			knobs: 2,
			displays: [0, 2],
			web: "https://josefadamcik.github.io/SofleKeyboard/",
			source: "https://github.com/josefadamcik/SofleKeyboard",
			kit: [
				"https://keebd.com/en-us/products/sofle-v2-keyboard-kit",
				"https://splitkb.com/collections/keyboard-kits/products/aurora-sofle-v2",
			],
			img: "sofle.jpg",
		};
		kb.setMatrix(58, 6, 4);
		kb.setExtras(5);
		kb.setHotswap([MX, Choc], MX);
		kb.setQMK([VIA, Vial]);
		add(kb);
		
		kb = {
			name: "Soufflé",
			pinkyStagger: 0.7,
			knobs: 2,
			source: "https://github.com/climent/SouffleKeyboard",
			img: "Soufflé.jpg"
		};
		kb.setMatrix(58, 6, 4);
		kb.setExtras(5, 0, 0, 1);
		kb.setHotswap(MX);
		kb.setQMK([VIA, Vial]);
		add(kb);
		
		kb = {
			name: "Lily58",
			source: "https://github.com/kata0510/Lily58",
			prebuilt: "https://shop.yushakobo.jp/products/lily58-pro/",
			img: "lily58.jpg",
		};
		kb.setMatrix(58, 6, 4);
		kb.setExtras(4, 1, 0, 0);
		kb.setHotswap([MX, Choc], MX);
		add(kb);
		
		function addEgg(kb:ColStagKeyboard) {
			kb.setMatrix(58, 6, 4);
			kb.thumbKeys = 4;
			kb.cornerKeys = 4;
			kb.hotswap = true;
			add(kb);
		}
		addEgg({
			name: "Egg58",
			switchProfile: Choc,
			connection: Wired,
			firmware: QMK,
			source: "https://github.com/eggsworks/egg58",
			kit: "https://eggs.works/products/egg58-diy-kit",
			prebuilt: "https://eggs.works/products/egg58",
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
		kb.setMatrix(60, 6, 4);
		kb.setExtras(6, 0, 0, 5);
		add(kb);
		
		kb = {
			name: "Pangaea",
			assembly: Assembly.Adjustable,
			knobs: [0, 2],
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
		kb.setMatrix(60, 6, 4);
		add(kb);
		
		kb = {
			name: "Dao Choc BLE",
			thumbKeys: [2, 3],
			connection: [Bluetooth, Wired],
			source: "https://github.com/yumagulovrn/dao-choc-ble",
			img: "dao-choc-ble.jfif",
		};
		kb.setMatrix([42, 44], 6, 3);
		kb.setHotswap(Choc, Choc);
		add(kb);
		
		kb = {
			name: "Cantaloupe",
			thumbKeys: 3,
			cornerKeys: 3,
			knobs: 2,
			source: "https://github.com/Ariamelon/Cantaloupe",
			img: "Cantaloupe.jpg",
		};
		kb.setHotswap(MX);
		kb.setMatrix(60, 6, 4);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "simplyKeeb 60K",
			stagger: Ortho,
			thumbKeys: 3,
			cornerKeys: 3,
			source: "https://github.com/geaz/simplyKeeb-60K",
			img: "simplyKeeb-60K.jpg",
		};
		kb.setHotswap(MX);
		kb.setMatrix(60, 6, 4);
		kb.setQMK(Vial);
		add(kb);
		
		kb = {
			name: "Untitled keyboard",
			thumbKeys: 5,
			connection: [Wired, Bluetooth],
			source: "https://github.com/AnthonyAmanse/untitled-keyboard/",
			firmware: ZMK,
			img: "AnthonyAmanse-untitled.jpg"
		}
		kb.setMatrix(60, 6, 4);
		kb.setHotswap(Choc, Choc);
		add(kb);
		
		kb = {
			name: "Pinky4",
			thumbKeys: 4,
			source: "https://github.com/tamanishi/Pinky4",
			img: "Pinky4.jpg",
			notes: "Uses Choc switches for thumb keys"
		};
		kb.setMatrix(64, 7, 4);
		kb.setHotswap(MX);
		add(kb);
		
		function addAvalanche(kb:ColStagKeyboard) {
			kb.outerKeys = [0, 1];
			kb.thumbKeys = [6, 7];
			kb.knobs = [0, 2];
			kb.source = "https://github.com/vlkv/avalanche";
			kb.img = "avalanche_v4-1.jpg";
			kb.displays = 2;
			kb.splay = PinkyOnly;
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
			rows: 4, cols: 6
		});
		
		kb = {
			name: "Redox",
			source: "https://github.com/mattdibi/redox-keyboard",
			connection: [Wired, Wireless],
			img: "redox-1.jpg",
		};
		kb.setHotswap(MX);
		kb.setMatrix(70, 6, 4);
		kb.setExtras(7, 2, 0, 4);
		add(kb);
		
		kb = {
			name: "ErgoDash",
			source: "https://github.com/omkbd/ErgoDash",
			img: "Ergodash.jpg",
		};
		kb.setHotswap(MX);
		kb.setMatrix(70, 6, 4);
		kb.setExtras([2, 4], 3, 0, 4);
		add(kb);
		
		kb = {
			name: "ErgoMax",
			source: "https://github.com/LouWii/ErgoMax",
			img: "ergomax.jpg"
		};
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
		kb.setHotswap(Choc);
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
			kit: "https://keeb.io/products/afternoon-labs-breeze-keyboard-kit/?afmc=yal",
			img: "breeze.avif"
		};
		kb.setMatrix(66, 6, 4);
		kb.rcols = 9;
		kb.setHotswap([MX, Choc]);
		kb.setQMK(VIA);
		add(kb);
		
		kb = {
			name: "ErgoNICE",
			navCluster: Arrows,
			thumbKeys: 4,
			knobs: 1,
			firmware: Firmware.Custom,
			web: "https://val.packett.cool/blog/ergonice/",
			source: "https://codeberg.org/valpackett/ergonice",
			img: "ergoNICE.jpg"
		};
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
		kb.setMatrix(64, 6, 4);
		kb.rcols = 8;
		kb.splay = true;
		kb.setQMK(VIA);
		add(kb);
		
		kb = {
			name: "Chunky",
			knobs: 2,
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
			kit: "https://dm9.thebase.in/items/13093286",
			img: "Ergoinu.jfif",
		};
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
			knobs: [0, 1],
			img: "Kapl.jpg"
		};
		kb.setMatrix([63, 64], 7, 4);
		kb.setExtras(4, 0, 0, 4);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "Hillside 52",
			navCluster: Arrows,
			pinkyStagger: 0.8,
			source: "https://github.com/mmccoyd/hillside",
			prebuilt: "https://shop.beekeeb.com/product/pre-soldered-hillside-keyboard/",
			img: "Hillside52.jpg"
		};
		kb.setHotswap(Choc, Choc);
		kb.setMatrix(52, 6, 3);
		kb.setExtras(5, 0, 0, 4);
		kb.setQMK();
		add(kb);
		
		kb = {
			name: "Drift",
			source: "",
			knobs: 2,
			displays: 2,
			img: "Drift.jpg"
		};
		kb.setMatrix(66, 8, 4);
		kb.setExtras(3, 0, -1, 0);
		kb.setQMK(Vial);
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
		add(kb);
		
		function addDilemma(kb:ColStagKeyboard) {
			kb.trackpads = 1;
			kb.knobs = [0, 2];
			kb.hotswap = false;
			kb.switchProfile = [MX, Choc];
			add(kb);
		}
		addDilemma({
			name: "Dilemma",
			keys: [34, 36],
			cols: 5, rows: 3,
			thumbKeys: [2, 4],
			source: "https://github.com/Bastardkb/Dilemma",
			kit: "https://bastardkb.com/product/dilemma/",
			prebuilt: "https://bastardkb.com/product/dilemma-prebuilt-preorder/",
			img: "Dilemma.jpg",
		});
		addDilemma({
			name: "Dilemma Max",
			keys: [54, 56],
			cols: 6, rows: 4,
			thumbKeys: [3, 4],
			source: "https://github.com/Bastardkb/Dilemma",
			kit: "https://bastardkb.com/product/dilemma-max/",
			prebuilt: "https://bastardkb.com/product/dilemma-max-prebuilt-preorder/",
			img: "Dilemma-Max.jpg",
		});
		
		kb = {
			name: "Ursa Minor",
			img: "ursa-minor.webp",
			thumbKeys: 3,
			switchProfile: Choc,
			keySpacing: Choc,
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
			source: "https://github.com/mylestunglee/articulation80",
			img: "articulation80.jpg",
		};
		kb.setMatrix([56, 80], 6, 4);
		kb.splay = true;
		add(kb);
		
		add({
			name: "3w6",
			keys: [35, 36],
			cols: 5, rows: 3,
			thumbKeys: 3,
			trackballs: [0, 1],
			trackballSize: pimoroniSize,
			switchProfile: Choc,
			keySpacing: Choc,
			source: "https://github.com/weteor/3W6",
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
			source: "https://github.com/cozykeys/Bloomer",
			img: "Bloomer.jfif",
		});
		
		add({
			name: "Keyclicks W-Ergolite",
			keys: 66,
			cols: 7, rows: 4,
			thumbKeys: 5,
			switchProfile: [MX, GateronLP],
			connection: [Bluetooth, Wired],
			firmware: QMK,
			software: Vial,
			source: "https://github.com/KeyClicks/Split-Keyboard/tree/main/W-ERGOLITE",
			prebuilt: "https://keyclicks.ca/products/w-ergolite-2-4g-wireless-split-keyboard-2",
			img: "W-Ergolite.webp",
		});
		
		kb = {
			name: "Tern",
			keys: 30,
			cols: 5, rows: 3,
			innerKeys: -1,
			outerKeys: -1,
			thumbKeys: 2,
			switchProfile: Choc,
			keySpacing: CFX,
			source: "https://github.com/rschenk/tern",
			img: "tern.jpeg",
		};
		kb.splay = true;
		add(kb);
		
		kb = {
			name: "Rolio",
			knobs: 2,
			thumbKeys: 5,
			connection: [Wired, Bluetooth],
			firmware: ZMK,
			pinkyStagger: 0.25,
			source: "https://github.com/MickiusMousius/RolioKeyboard",
			img: "Rolio.jpg"
		};
		kb.setMatrix(46, 6, 3);
		add(kb);
		
		kb = new ColStagKeyboard("Chrumm 1.0");
		kb.setMatrix([64, 70], 6, 4);
		kb.rcols = 7;
		kb.shape = Unibody;
		kb.hotswap = false;
		kb.switchProfile = MX;
		kb.firmware = Firmware.Custom;
		kb.thumbKeys = 4;
		kb.navCluster = Arrows;
		kb.cornerKeys = 1;
		kb.knobs = 1;
		kb.source = "https://github.com/sevmeyer/chrumm-keyboard/";
		kb.img = "Chrumm.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Alien Invader");
		kb.setMatrix(36, 5, 3);
		kb.thumbKeys = 3;
		kb.hotswap = false;
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
		kb.source = "https://github.com/crehmann/Buzzard/wiki";
		kb.img = "buzzard.webp";
		add(kb);
		
		kb = new ColStagKeyboard("Skywatch");
		kb.setMatrix(36, 5, 3);
		kb.setExtras(3);
		kb.shape = Unibody;
		kb.pinkyStagger = 0.3;
		kb.stagger = Ortho;
		kb.trackballSize = pimoroniSize;
		kb.trackballs = [0, 1];
		kb.source = "https://github.com/ozkan/skywatch";
		kb.img = "Skywatch.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Trackball Reviung41");
		kb.setMatrix(41, 6, 3);
		kb.setExtras(3);
		kb.setHotswap(Choc);
		kb.trackballSize = pimoroniSize;
		kb.trackballs = 1;
		kb.source = "https://github.com/idank/keyboards/tree/main/reviung";
		kb.prebuilt = "https://holykeebs.com/products/trackball-reviung41-low-profile";
		kb.img = "reviung-trackball.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Fisk");
		kb.setMatrix(54, 6, 3);
		kb.setExtras(6, 2, 1, 0);
		kb.setQMK();
		kb.source = "https://github.com/vvhg1/fisk";
		kb.img = "fisk.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Bancouver40");
		kb.shape = Monoblock;
		kb.stagger = Ortho;
		kb.setMatrix(40, 5, 4);
		kb.setHotswap(Choc, CFX);
		kb.source = "https://github.com/ChrisChrisLoLo/bancouver40";
		kb.img = "Bancouver40.jpeg";
		add(kb);
		
		kb = new ColStagKeyboard("ChonkV");
		kb.setMatrix(58, 6, 4);
		kb.setExtras(5);
		kb.setHotswap(Choc, Choc);
		kb.splay = PinkyOnly;
		kb.shape = Unibody;
		kb.stagger = Ortho;
		kb.source = "https://github.com/ImStuBTW/chonkv";
		kb.img = "ChonkV.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("BFO-9000");
		kb.setMatrix([56, 108], [7, 9], [4, 6]);
		kb.shape = Split;
		kb.stagger = Ortho;
		kb.kit = "https://keeb.io/collections/split-keyboard-parts/products/bfo-9000-keyboard-customizable-full-size-split-ortholinear";
		kb.img = "bfo-9000.jpg";
		add(kb);
		
		function addIris(kb:ColStagKeyboard) {
			kb.setMatrix(56, 6, 4);
			kb.setExtras(4);
		}
		kb = new ColStagKeyboard("Iris");
		kb.setHotswap(MX);
		kb.kit = "https://keeb.io/collections/iris-split-ergonomic-keyboard";
		kb.prebuilt = "https://keeb.io/collections/iris-split-ergonomic-keyboard";
		addIris(kb);
		kb = new ColStagKeyboard("Iris CE");
		kb.setHotswap(Choc, Choc);
		kb.kit = "https://keeb.io/collections/iris-split-ergonomic-keyboard/products/iris-ce-low-profile-choc-hotswap-pcbs-for-split-ergonomic-keyboard";
		addIris(kb);
		
		kb = new ColStagKeyboard("TE Cleave");
		kb.setMatrix(
			14+3 + 8+8 + 7+8 + 7+8 + 6+6 + 2+4+4+4+2, 6, 4
		);
		kb.rcols = 7;
		kb.setExtras(2, 3, 2, 2);
		kb.navCluster = Full;
		kb.switchProfile = Optical;
		kb.hotswap = true;
		kb.firmware = Firmware.Custom;
		kb.prebuilt = "https://trulyergonomic.com/ergonomic-keyboards/mechanical-keyboards/products/cleave-truly-ergonomic-mechanical-switch-keyboard/";
		kb.img = "Truly-Ergonomic-Cleave-keyboard-1x1-2.jpg";
		kb.notes = "Flexibility of on-board software is unclear, but it's got a fairly normal keymap";
		add(kb);
	}
}