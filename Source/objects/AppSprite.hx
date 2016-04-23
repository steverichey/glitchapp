package objects;

import openfl.events.Event;
import openfl.display.Sprite;

class AppSprite extends Sprite
{
	public function new()
	{
		super();
		
		if (stage != null) 
		{
			init();
		}
		else 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	private function init(?E:Event):Void 
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		create();
	}
	
	public function create():Void { }
	public function update():Void { }
	public function destroy():Void { }
}