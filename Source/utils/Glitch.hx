package utils;

import openfl.display.BitmapData;
import openfl.display.BitmapDataChannel;
import openfl.geom.Point;
import openfl.utils.ByteArray;
import openfl.Vector;

class Glitch
{
	/**
	 * Processes Data by encoding it as a JPG and then inserting Amount number of zero bytes into its data.
	 */
	static public function glitchJPG(Data:BitmapData, Amount:Int = 10):BitmapData
	{
		bytes = Encode.bitmapDataToJPG(Data);
		bytes = insertBytes(bytes, Amount);
		
		#if flash
		return Data = Encode.byteArrayToBitmapData(bytes, Data.width, Data.height);
		#else
		return Data = Encode.byteArrayToBitmapData(bytes);
		#end
	}
	
	static public function chromaticAberration(Data:BitmapData):BitmapData
	{
		dest = new BitmapData(Data.width, Data.height, false, 0);
		
		if (Rand.bool())
		{
			dest.copyChannel(Data, Data.rect, Rand.point(), BitmapDataChannel.ALPHA, BitmapDataChannel.ALPHA);
			dest.copyChannel(Data, Data.rect, Rand.point(), Rand.channel(), Rand.channel());
			dest.copyChannel(Data, Data.rect, Rand.point(), Rand.channel(), Rand.channel());
			dest.copyChannel(Data, Data.rect, Rand.point(), Rand.channel(), Rand.channel());
		}
		else
		{
			dest.copyChannel(Data, Data.rect, Rand.point(), BitmapDataChannel.ALPHA, BitmapDataChannel.ALPHA);
			dest.copyChannel(Data, Data.rect, Rand.point(), BitmapDataChannel.RED, BitmapDataChannel.RED);
			dest.copyChannel(Data, Data.rect, Rand.point(), BitmapDataChannel.GREEN, BitmapDataChannel.GREEN);
			dest.copyChannel(Data, Data.rect, Rand.point(), BitmapDataChannel.BLUE, BitmapDataChannel.BLUE);
		}
		
		return dest;
	}
	
	static public function vectorError(Data:BitmapData):BitmapData
	{
		vector = Data.getVector(Data.rect);
		dest = Data.clone();
		dest.setVector(Rand.fromRect(Data.rect), vector);
		
		return dest;
	}
	
	/**
	 * Inserts Amount number of zero bytes into Bytes and returns it.
	 */
	static public function insertBytes(Bytes:ByteArray, Amount:Int = 10):ByteArray
	{
		if (Bytes == null)
		{
			throw "Tried to insert into null bytes!";
		}
		
		for (i in 0...Amount)
		{
			Bytes.position = Rand.int(0, Bytes.length);
			Bytes.writeByte(0);
		}
		
		Bytes.position = 0;
		
		return Bytes;
	}
	
	// Internal recycled variables.
	static private var bytes:ByteArray = new ByteArray();
	static private var dest:BitmapData = new BitmapData(1, 1);
	static private var zeroPoint:Point = new Point();
	static private var vector:Vector<UInt>;
}