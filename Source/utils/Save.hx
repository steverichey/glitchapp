package utils;

import openfl.utils.ByteArray;

#if android
import systools.Dialogs;
#end

#if flash
import flash.net.FileReference;
#end

class Save
{
	/**
	 * Just a wrapper for FileReference, this opens a save file dialog in Flash.
	 * 
	 * @param	Data			The data to save, stored as a ByteArray.
	 * @param	DefaultFileName	The default name to be shown in the dialog.
	 */
	static public function openSaveFileDialog(Data:ByteArray, DefaultFileName:String):Void
	{
		#if flash
		new FileReference().save(Data, DefaultFileName);
		#end
		
		#if android
		//new Dialogs.saveFile("Hey save a file!", "Save it yo", "./");
		#end
	}
}