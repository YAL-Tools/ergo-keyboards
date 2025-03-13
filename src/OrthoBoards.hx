package ;
import type.CaseType;
import type.Firmware;
import type.NumRangeList;
import type.Numpad;
import type.Software;
import type.Connection;
import type.SwitchProfile;
import type.Assembly;
import type.Shape;
import type.Splay;
import type.StaggerType;

/**
 * ...
 * @author YellowAfterlife
 */
class OrthoBoards {
	public static function init(keyboards:Array<ColStagKeyboard>) {
		function add(kb:ColStagKeyboard) {
			if (kb.stagger == null) kb.stagger = [Ortho];
			kb.shape ??= Split;
			keyboards.push(kb);
		}
		var pimoroniSize = 4.4;
		var kb:ColStagKeyboard;
		
		kb = {
			name: "simplyKeeb 60K",
			source: "https://github.com/geaz/simplyKeeb-60K",
			assembly: [PCB, Handwired],
			img: "simplyKeeb-60K.jpg",
		};
		kb.setHotswap(MX);
		kb.setMatrix(60, 6, 4);
		kb.setExtras(3, 0, 0, 3);
		kb.caseType = [Included];
		kb.setQMK(Vial);
		add(kb);
		
		kb = new ColStagKeyboard("Skywatch");
		kb.setMatrix(36, 5, 3);
		kb.setExtras(3);
		kb.setHotswap([MX]);
		kb.shape = Unibody;
		kb.pinkyStagger = 0.3;
		kb.trackballSize = pimoroniSize;
		kb.trackballs = [0, 1];
		kb.caseType = [Included];
		kb.source = "https://github.com/ozkan/skywatch";
		kb.img = "Skywatch.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Bancouver40");
		kb.shape = Monoblock;
		kb.setMatrix(40, 5, 3);
		kb.setExtras(3, 0, 0, 4);
		kb.setHotswap(Choc, CFX);
		kb.caseType = [Included];
		kb.source = "https://github.com/ChrisChrisLoLo/bancouver40";
		kb.img = "Bancouver40.jpeg";
		add(kb);
		
		kb = new ColStagKeyboard("minipeg48");
		kb.shape = Monoblock;
		kb.setMatrix(48, 6, 3);
		kb.setExtras(3, 0, 0, 4);
		kb.setHotswap(Choc, CFX);
		kb.caseType = [Included];
		kb.source = "https://github.com/ChrisChrisLoLo/bancouver40";
		kb.img = "minipeg48.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("ChocV");
		kb.setMatrix(36, 5, 3);
		kb.setExtras(3);
		kb.setHotswap(Choc, Choc);
		kb.splay = PinkyOnly;
		kb.shape = Unibody;
		kb.source = "https://github.com/brickbots/chocV";
		kb.caseType = [None];
		kb.img = "ChocV.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("ChonkV");
		kb.connection = [Wired, Wireless];
		kb.setMatrix(58, 6, 4);
		kb.setExtras(5);
		kb.setHotswap(Choc, Choc);
		kb.splay = PinkyOnly;
		kb.shape = Unibody;
		kb.source = "https://github.com/ImStuBTW/chonkv";
		kb.caseType = [Included];
		kb.img = "ChonkV.jpg";
		add(kb);
		
		for (rows in 4 ... 7) {
			kb = new ColStagKeyboard('BFO-9000 (${rows}x#)');
			kb.setMatrix(IntRangeList.either(rows * 14, rows * 16, rows * 18), [7, 9], rows - 1);
			kb.setExtras(4, 0, 0, 4);
			kb.switchProfile = [MX, Choc, Alps];
			kb.hotswap = [No];
			kb.shape = Split;
			kb.caseType = [None];
			kb.extras = [
				"[v:Case] https://www.thingiverse.com/thing:3089077",
				"![v:Plates] https://keeb.io/products/bfo-9000-case-plates",
			];
			kb.kit = "!https://keeb.io/collections/split-keyboard-parts/products/bfo-9000-keyboard-customizable-full-size-split-ortholinear";
			kb.img = "bfo-9000.jpg";
			kb.notes = [
				"Uses breakaway rows and columns to allow matrices from 7x4 to 9x6"
			];
			add(kb);
		}
		
		kb = new ColStagKeyboard("Ergo42");
		kb.setMatrix(56, 7, 3);
		kb.setExtras(3, 0, 0, 4);
		kb.setQMK();
		kb.switchProfile = [MX, Choc];
		kb.hotswap = [No];
		kb.source = "https://github.com/Biacco42/Ergo42";
		kb.caseType = [Included];
		kb.img = "ergo42.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("ChonkyKong");
		kb.setMatrix(60, 5, 3);
		kb.setHotswap([MX, Choc], MX);
		kb.shape = Unibody;
		kb.mcols = 3;
		kb.numpad = [Numpad.Mini];
		kb.setExtras([3, 4], [2, 4], 0, 3);
		kb.setQMK(Vial);
		kb.caseType = [Included];
		kb.source = "https://github.com/weteor/ChonkyKong";
		kb.img = "chonkyKong.jpg";
		kb.notes = "Some pairs of keys can be swapped for 2us";
		add(kb);
		
		kb = new ColStagKeyboard("Buran");
		kb.setMatrix(39, 5, 3);
		kb.setExtras(3, 0, 0, 3);
		kb.setHotswap([MX, Choc]);
		kb.setQMK(Vial);
		kb.shape = Unibody;
		kb.encoders = [1, 2];
		kb.caseType = [Included];
		kb.source = "https://github.com/ScatteredDrifter/Buran-Ortho";
		kb.img = "buran-no-acryl-isp.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Helix");
		kb.setMatrix(64, 6, 4);
		kb.setExtras(4, 1, 0, 4);
		kb.setHotswap([MX, Choc]);
		kb.source = "https://github.com/MakotoKurauchi/helix";
		kb.kit = [
			"!https://shop.yushakobo.jp/en/products/2143",
			"https://mechboards.co.uk/products/helix-kit",
			"https://customkbd.com/collections/split-keyboards/products/helix-kit",
			"https://keyhive.xyz/shop/helix-kit",
			"https://www.switchtop.com/product/helix-keyboard-kit",
			"https://www.littlekeyboards.com/collections/helix-pcb-kits",
			"https://splitkb.com/collections/keyboard-kits/products/aurora-helix",
		];
		kb.caseType = [Included];
		kb.img = "helix.webp";
		add(kb);
		
		kb = new ColStagKeyboard("Viterbi");
		kb.setMatrix(70, 7, 4);
		kb.setExtras(4, 0, 0, 4);
		kb.setHotswap([MX, Alps]);
		kb.kit = "!https://keeb.io/products/viterbi-keyboard-pcbs-5x7-70-split-ortholinear";
		kb.caseType = [Included];
		kb.img = "viterbi.webp";
		kb.addSKBC();
		add(kb);
		
		function addRebound(kb:ColStagKeyboard) {
			kb.setMatrix([47, 50], 6, 3);
			kb.setExtras([2, 4], 0, 0, [1, 4]);
			kb.setHotswap([MX, Choc]);
			kb.caseType = CaseType.Included;
			kb.encoders = 1;
			kb.notes = "Pairs of 1.5u keys can be 1us instead; one or two keys in the middle";
			add(kb);
		}
		//
		kb = new ColStagKeyboard("Rebound");
		kb.shape = Unibody;
		kb.kit = "!https://store.montsinger.net/products/rebound";
		kb.img = "rebound.webp";
		addRebound(kb);
		//
		kb = new ColStagKeyboard("Rebound-S");
		kb.stagger = Column;
		kb.shape = Unibody;
		kb.kit = "!https://store.montsinger.net/products/rebound-s";
		kb.img = "rebound-s.webp";
		addRebound(kb);
		
		kb = new ColStagKeyboard("Sol 3");
		kb.setMatrix(66, 6, 4);
		kb.setExtras(3, 4, 0, 5);
		kb.setHotswap(MX);
		kb.caseType = [Included];
		kb.kit = "https://www.rgbkb.net/collections/sol-3";
		kb.prebuilt = "https://www.rgbkb.net/collections/sol-3/products/sol-3-keyboard-prebuilt";
		kb.img = "sol3.webp";
		add(kb);
		
		// not exactly ergonomic
		/*kb = new ColStagKeyboard("Equals 48");
		kb.setMatrix([47, 48], 6, 3);
		kb.setExtras(3, 0, 0, 4);
		kb.shape = Monoblock;
		kb.kit = "https://www.boardsource.xyz/products/equals-48-kit";
		kb.img = "equals48.webp";
		add(kb);
		
		kb = new ColStagKeyboard("Equals 60");
		kb.setMatrix([59, 60], 6, 4);
		kb.setExtras(3, 0, 0, 4);
		kb.shape = Monoblock;
		kb.kit = "https://www.boardsource.xyz/products/equals-60-kit";
		kb.img = "equals60.webp";
		add(kb);*/
	}
}