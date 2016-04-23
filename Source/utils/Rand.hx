package utils;
import openfl.display.BitmapDataChannel;
import openfl.geom.Point;
import openfl.geom.Rectangle;

class Rand
{
	static public function bool():Bool
	{
		return float() < 0.5 ? true : false;
	}
	
	/**
	 * Returns a random integer in a range, not deterministic, placeholder.
	 */
	static public function int(Min:Int = 0, Max:Int = 255):Int
	{
		return Std.int(float(Min, Max));
	}
	
	static public function float(Min:Float = 0, Max:Float = 1):Float
	{
		return Math.random() * (Max - Min) + Min;
	}
	
	static public function point(MinX:Float = -20, MaxX:Float = 20, MinY:Float = -20, MaxY:Float = 20):Point
	{
		pt.setTo(float(MinX, MaxX), float(MinY, MaxY));
		
		return pt;
	}
	
	static public function rect(MinX:Float = -10, MaxX:Float = 10, MinY:Float = -10, MaxY:Float = 10, MinWidth:Float = 100, MaxWidth:Float = 200, MinHeight:Float = 100, MaxHeight:Float = 200):Rectangle
	{
		rc.setTo(float(MinX, MaxX), float(MinY, MaxY), float(MinWidth, MaxWidth), float(MinHeight, MaxHeight));
		
		return rc;
	}
	
	static public function fromRect(Rect:Rectangle, Percent:Float = 25):Rectangle
	{
		return 	rect(	Rect.x * div(Percent, false), Rect.x * div(Percent), Rect.y * div(Percent, false), Rect.y * div(Percent), 
						Rect.width * div(Percent, false), Rect.width * div(Percent), Rect.height * div(Percent, false), Rect.height * div(Percent));
	}
	
	static public function channel():Int
	{
		switch (int(0, 2))
		{
			case 0: return BitmapDataChannel.BLUE;
			case 1: return BitmapDataChannel.GREEN;
			default: return BitmapDataChannel.RED;
		}
	}
	
	static private function div(Percent:Float = 25, Plus:Bool = true):Float
	{
		return Plus ? (100 + Percent) / 100 : (100 - Percent) / 100;
	}
	
	static private var pt:Point = new Point();
	static private var rc:Rectangle = new Rectangle();
}