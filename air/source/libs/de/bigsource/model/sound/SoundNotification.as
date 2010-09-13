package de.bigsource.model.sound 
{
	import flash.events.Event;	
	 * @author kimchristiansen
	 */
	public class SoundNotification extends Event
	{
		public static const ON_SOUND_PROGRESS:String = "SoundNotification.ON_SOUND_PROGRESS";
		
		public var id:String;
		
		public function SoundNotification(type : String,  p_id:String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			id = p_id;
		}
	}
}