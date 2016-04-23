package views;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.KeyboardEvent;
import utils.Encode;
import utils.Glitch;
import utils.Rand;
import utils.Save;

import objects.AppSprite;
import objects.CameraManager;

class ImageView extends AppSprite
{
	public var cameraWidth:Int = 0;
	public var cameraHeight:Int = 0;
	
	private var source:BitmapData;
	private var cam:BitmapData;
	private var image:Bitmap;
	
	override public function create()
	{
		source = Assets.getBitmapData("assets/test.png");
		
		cam = new BitmapData(source.width, source.height);
		
		cameraWidth = cam.width;
		cameraHeight = cam.height;
		
		image = new Bitmap(source);
		addChild(image);
	}
	
	override public function update():Void
	{
		cam = CameraManager.getInstance().capture();
		image.bitmapData = Glitch.chromaticAberration(cam);
	}
	
	public function onKeyUp(?k:KeyboardEvent):Void
	{
		//CameraManager.getInstance().capture(cam);
		//image.bitmapData = Glitch.chromaticAberration(cam);
		
		Save.openSaveFileDialog(Encode.bitmapDataToPNG(image.bitmapData), "bacon.png");
		
		//image.bitmapData = Glitch.glitchJPG(source);
		//image.bitmapData = Glitch.chromaticAberration(source);
		//image.bitmapData = Glitch.vectorError(source);
	}
}