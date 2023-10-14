package ;
import type.Firmware;
import type.Software;
import type.Connection;
import type.SwitchProfile;
import type.Assembly;

/**
 * ...
 * @author YellowAfterlife
 */
class ColStagBoards {
	public static function init(keyboards:Array<ColStagKeyboard>) {
		function add(kb:ColStagKeyboard) {
			kb.stagger = Column;
			keyboards.push(kb);
		}
		var pimoroniSize = 4.4;
		var kb:ColStagKeyboard;
		
		kb = {
			name: "Sofle",
			knobs: 2,
			web: "https://josefadamcik.github.io/SofleKeyboard/",
			source: "https://github.com/josefadamcik/SofleKeyboard",
			kit: [
				//"https://keebd.com/en-us/products/sofle-v2-keyboard-kit",
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
			kb.stagger = Column;
			kb.trackpads = 1;
			kb.knobs = [0, 2];
			kb.hotswap = false;
			kb.switchProfile = [MX, Choc];
			keyboards.push(kb);
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
		
		add({
			name: "articulation80",
			keys: [56, 80],
			cols: 6, rows: 4,
			thumbKeys: 4,
			navCluster: Full,
			switchProfile: Choc,
			source: "https://github.com/mylestunglee/articulation80",
			img: "articulation80.jpg",
		});
		
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
		
		add({
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
		});
	}
}