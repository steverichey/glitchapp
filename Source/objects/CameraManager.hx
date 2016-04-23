package objects;

import openfl.Lib;
import openfl.display.BitmapData;
import openfl.display.StageScaleMode;

#if flash
import flash.media.Camera;
import flash.media.Video;
#end

class CameraManager
{
	#if flash
	private var ref:Camera;
	private var video:Video;
	#end
	
	private static var instance:CameraManager;
	
	public function new(Width:Int, Height:Int)
	{
		#if flash
		ref = Camera.getCamera();
		ref.setMode(Width, Height, 24, false);
        ref.setQuality(0, 100);
		
		// There needs to be a video object or capture won't work
		
		video = new Video();
		video.attachCamera(ref);
		#end
		
		instance = this;
	}
	
	public function capture():BitmapData
	{
		#if flash
		data = new BitmapData(ref.width, ref.height);
		ref.drawToBitmapData(data);
		
		return data;
		#end
		
		#if android
		return null;
		#end
	}
	
	static public function getInstance():CameraManager
	{
		return instance;
	}
	
	static private var data:BitmapData;
}