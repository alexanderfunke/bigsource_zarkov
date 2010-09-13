package de.bigsource.zarkov.view.events 
{
	import flash.events.Event;

	public class AntFilesEvent extends Event 
	{
		public static const ON_BUILD_START:String = "AntFilesEvent.ON_BUILD_START";		public static const ON_FILELIST_REFRESH:String = "AntFilesEvent.ON_FILELIST_REFRESH";		public static const ON_FILELIST_SORT:String = "AntFilesEvent.ON_FILELIST_SORT";		public static const ON_FILE_ADD:String = "AntFilesEvent.ON_FILE_ADD";		public static const ON_FILE_REMOVE:String = "AntFilesEvent.ON_FILE_REMOVE";
		
		public var data : *;
		public function AntFilesEvent(type : String, p_data:* = null,  bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			data = p_data;
		}
	}
}
