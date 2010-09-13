package de.bigsource.model.sound 
{
	import flash.events.Event;			/**
	 * @author kimchristiansen
	 */
	public class SoundNotification extends Event
	{
		public static const ON_SOUND_PROGRESS:String = "SoundNotification.ON_SOUND_PROGRESS";		public static const ON_SOUND_ERROR:String = "SoundNotification.ON_SOUND_IO_ERROR";		public static const ON_SOUND_ID3:String = "SoundNotification.ON_SOUND_ID3";		public static const ON_SOUND_COMPLETE:String = "SoundNotification.ON_SOUND_COMPLETE";		public static const ON_SOUND_OPEN:String = "SoundNotification.ON_SOUND_OPEN";		public static const ON_SOUND_LOADING_COMPLETE:String = "SoundNotification.ON_SOUND_LOADING_COMPLETE";
		
		public var id:String;
		
		public function SoundNotification(type : String,  p_id:String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			id = p_id;
		}
	}
}
