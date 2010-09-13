package de.bigsource.zarkov.view.events 
{
	import flash.events.Event;

	public class AntFilesEvent extends Event 
	{
		public static const ON_BUILD_START:String = "AntFilesEvent.ON_BUILD_START";
		
		public var data : *;
		public function AntFilesEvent(type : String, p_data:* = null,  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			data = p_data;
		}
	}
}