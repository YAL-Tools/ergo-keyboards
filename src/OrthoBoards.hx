package ;
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
class OrthoBoards {
	public static function init(keyboards:Array<ColStagKeyboard>) {
		function add(kb:ColStagKeyboard) {
			kb.stagger ??= Ortho;
			kb.shape ??= Split;
			keyboards.push(kb);
		}
		var pimoroniSize = 4.4;
		var kb:ColStagKeyboard;
		
		function addSimplyKeeb(kb:ColStagKeyboard) {
			kb.setHotswap(MX);
			kb.setMatrix(60, 6, 4);
			kb.setExtras(3, 0, 0, 3);
			kb.setQMK(Vial);
			add(kb);
		}
		kb = {
			name: "simplyKeeb 60K",
			source: "https://github.com/geaz/simplyKeeb-60K",
			img: "simplyKeeb-60K.jpg",
		};
		addSimplyKeeb(kb);
		kb = {
			name: "simplyKeeb 60Kph",
			source: "https://github.com/geaz/simplyKeeb-60K/tree/main/printedmx",
			assembly: Handwired,
			img: "simplyKeeb-60K.jpg",
			notes: "Like the regular simplyKeeb 60K, but fully 3d-printable."
		};
		addSimplyKeeb(kb);
		
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
		
		kb = new ColStagKeyboard("Bancouver40");
		kb.shape = Monoblock;
		kb.stagger = Ortho;
		kb.setMatrix(40, 5, 3);
		kb.setExtras(3, 0, 0, 4);
		kb.setHotswap(Choc, CFX);
		kb.source = "https://github.com/ChrisChrisLoLo/bancouver40";
		kb.img = "Bancouver40.jpeg";
		add(kb);
		
		kb = new ColStagKeyboard("ChocV");
		kb.setMatrix(36, 5, 3);
		kb.setExtras(3);
		kb.setHotswap(Choc, Choc);
		kb.splay = PinkyOnly;
		kb.shape = Unibody;
		kb.stagger = Ortho;
		kb.source = "https://github.com/ImStuBTW/chonkv";
		kb.img = "ChocV.jpg";
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
		kb.setMatrix([56, 108], [7, 9], [3, 5]);
		kb.setExtras(4, 0, 0, 4);
		kb.switchProfile = [MX, Choc, Alps];
		kb.shape = Split;
		kb.stagger = Ortho;
		kb.kit = "https://keeb.io/collections/split-keyboard-parts/products/bfo-9000-keyboard-customizable-full-size-split-ortholinear";
		kb.img = "bfo-9000.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Ergo42");
		kb.stagger = Ortho;
		kb.setMatrix(56, 7, 3);
		kb.setExtras(3, 0, 0, 4);
		kb.setQMK();
		kb.switchProfile = [MX, Choc];
		kb.source = "https://github.com/Biacco42/Ergo42";
		kb.img = "ergo42.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Kong");
		kb.setMatrix([48, 60], 5, 3);
		kb.setHotswap([MX, Choc], MX);
		kb.shape = Unibody;
		kb.rcols = 8;
		kb.setExtras([3, 4], [3, 4], 0, 3);
		kb.setQMK(Vial);
		kb.source = "https://github.com/weteor/ChonkyKong";
		kb.img = "chonkyKong.jpg";
		kb.notes = "Doesn't fit very well with the existing classification system.";
		add(kb);
		
		kb = new ColStagKeyboard("Buran");
		kb.setMatrix(39, 5, 3);
		kb.setExtras(3, 0, 0, 3);
		kb.setHotswap([MX, Choc]);
		kb.setQMK(Vial);
		kb.shape = Unibody;
		kb.encoders = 1;
		kb.source = "https://github.com/ScatteredDrifter/Buran-Ortho";
		kb.img = "buran-no-acryl-isp.jpg";
		add(kb);
		
		kb = new ColStagKeyboard("Helix");
		kb.setMatrix(64, 6, 4);
		kb.setExtras(4, 1, 0, 4);
		kb.setHotswap([MX, Choc]);
		kb.source = "https://github.com/MakotoKurauchi/helix";
		kb.kit = [
			"https://mechboards.co.uk/products/helix-kit",
			"https://customkbd.com/collections/split-keyboards/products/helix-kit",
			"https://keyhive.xyz/shop/helix-kit",
			"https://www.switchtop.com/product/helix-keyboard-kit",
			"https://www.littlekeyboards.com/collections/helix-pcb-kits",
		];
		kb.img = "helix.webp";
		add(kb);
		
		kb = new ColStagKeyboard("Viterbi");
		kb.setMatrix(70, 7, 4);
		kb.setExtras(4, 0, 0, 4);
		kb.setHotswap([MX, Alps]);
		kb.kit = "https://keeb.io/products/viterbi-keyboard-pcbs-5x7-70-split-ortholinear";
		kb.img = "viterbi.webp";
		add(kb);
		
		function addRebound(kb:ColStagKeyboard) {
			kb.setMatrix([42, 50], 6, 3);
			kb.setExtras([2, 4], 0, 0, [1, 4]);
			kb.setHotswap([MX, Choc]);
			kb.encoders = 1;
			add(kb);
		}
		kb = new ColStagKeyboard("Rebound");
		kb.stagger = Ortho;
		kb.shape = Unibody;
		kb.kit = "https://store.montsinger.net/products/rebound";
		kb.img = "rebound.webp";
		addRebound(kb);
		kb = new ColStagKeyboard("Rebound-S");
		kb.stagger = Column;
		kb.shape = Unibody;
		kb.kit = "https://store.montsinger.net/products/rebound-s";
		kb.img = "rebound-s.webp";
		addRebound(kb);
		
		kb = new ColStagKeyboard("Sol 3");
		kb.setMatrix(66, 6, 4);
		kb.setExtras(3, 4, 0, 5);
		kb.setHotswap(MX);
		kb.kit = "https://www.rgbkb.net/collections/sol-3";
		kb.prebuilt = "https://www.rgbkb.net/collections/sol-3/products/sol-3-keyboard-prebuilt";
		kb.img = "sol3.webp";
		add(kb);
	}
}