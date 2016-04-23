package utils;

import openfl.utils.ByteArray;
import openfl.display.BitmapData;

#if flash
import flash.display.PNGEncoderOptions;
import flash.display.JPEGEncoderOptions;
#end

class Encode
{
	/**
	 * Converts Bytes to a new BitmapData object. Wrapper for BitmapData.loadFromBytes().
	 */
	#if flash
	static public function byteArrayToBitmapData(Bytes:ByteArray, Width:Int, Height:Int):BitmapData
	#else
	static public function byteArrayToBitmapData(Bytes:ByteArray):BitmapData
	#end
	{
		#if flash
		result = new BitmapData(Width, Height);
		
		Bytes.position = 0;
		result.setPixels(result.rect, Bytes);
		
		return result;
		#else
		return BitmapData.loadFromBytes(Bytes);
		#end
	}
	
	static public function bitmapDataToByteArray(Data:BitmapData):ByteArray
	{
		var bytes:ByteArray = new ByteArray();
		
		#if mobile
		bytes.readBytes(cast Data, 0, Data.width * Data.height);
		#else
		Data.copyPixelsToByteArray(Data.rect, bytes);
		#end
		
		return bytes;
	}
	
	/**
	 * Converts BitmapData to a ByteArray encoded as PNG. Mostly a wrapper for BitmapData.encode()
	 * 
	 * @param	Image	The BitmapData to encode. This could be, for example, a FlxSprite's pixels.
	 */
	static public function bitmapDataToPNG(Image:BitmapData):ByteArray
	{
		#if flash
		return Image.clone().encode(Image.rect, new PNGEncoderOptions());
		#else
		return Image.clone().encode("jpg");
		#end
	}
	
	/**
	 * Converts BitmapData to a ByteArray encoded as JPG. Mostly a wrapper for BitmapData.encode()
	 * 
	 * @param	Image	The BitmapData to encode. This could be, for example, a FlxSprite's pixels.
	 */
	static public function bitmapDataToJPG(Image:BitmapData):ByteArray
	{
		#if flash
		return Image.clone().encode(Image.rect, new JPEGEncoderOptions());
		#else
		return Image.clone().encode("jpg");
		#end
	}
	
	static private var result:BitmapData;
}