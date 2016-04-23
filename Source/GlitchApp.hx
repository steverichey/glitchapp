package;

import openfl.Assets;
import openfl.Lib;
import openfl.utils.ByteArray;
import openfl.events.Event;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

#if mobile
import openfl.events.TouchEvent;
#else
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
#end

import utils.Glitch;
import views.ImageView;
import objects.AppSprite;
import objects.CameraManager;

class GlitchApp extends AppSprite
{
	public static var screenWidth:Int = 0;
	public static var screenHeight:Int = 0;
	
	private var imageView:ImageView;
	private var camera:CameraManager;
	private var members:Array<AppSprite>;
	
	override public function create():Void
	{
		members = [];
		
		screenWidth = Lib.current.stage.stageWidth;
		screenHeight = Lib.current.stage.stageHeight;
		
		imageView = new ImageView();
		addChild(imageView);
		
		addMember(imageView);
		
		camera = new CameraManager(imageView.cameraWidth, imageView.cameraHeight);
		
		#if mobile
		Lib.current.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin, false, 0, true);
		#else
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp, false, 0, true);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, true);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 0, true);
		#end
		
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame, false, 0, true);
	}
	
	private function onFrame(?e:Event):Void
	{
		for (member in members)
		{
			member.update();
		}
	}
	
	private function addMember(Member:AppSprite):AppSprite
	{
		if (members.indexOf(Member) == -1)
		{
			members.push(Member);
		}
		
		return Member;
	}
	
	#if mobile
	private function onTouchBegin(?t:TouchEvent):Void
	{
		
	}
	#else
	private function onMouseDown(?m:MouseEvent):Void
	{
		
	}
	
	private function onKeyDown(?e:KeyboardEvent):Void
	{
		
	}
	
	private function onKeyUp(?e:KeyboardEvent):Void
	{
		imageView.onKeyUp(e);
	}
	#end
}