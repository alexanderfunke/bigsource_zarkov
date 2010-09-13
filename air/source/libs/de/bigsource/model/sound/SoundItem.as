package de.bigsource.model.sound 
	import flash.events.Event;

	/**
	 * @author kimchristiansen
	 */
	public class SoundItem extends EventDispatcher
		private var _position : Number = 0;
		private var bytesLoaded : Number;

		public function SoundItem(p_id : String,p_group : String) 

		public function get id() : String

		public function get group() : String

		public function get loops() : int

		public function get ispaused() : Boolean

		public function get ismuted() : Boolean

		public function get volume() : Number

		public function set volume(p_volume : Number) : void

		public function addLibrarySound(p_linkageID : *) : void

		public function addExternalSound(p_path : String, p_buffer : Number, p_checkPolicyFile : Boolean) : void

		public function play(p_volume : Number = -1, p_startTime : Number = 0, p_loops : int = 0) : void

		public function stop() : void

		public function pause() : void

		public function seek(p_time : Number) : void

		public function mute() : void

		public function unmute() : void

		public function get duration() : Number

		public function get position() : Number

		private function addSoundEvents() : void

		private function removeSoundEvents() : void
				{
				{
				}

		private function onOpen(event : Event) : void

		private function onLoadingComplete(event : Event) : void

		private function onSoundComplete(event : Event) : void

		private function onLoadProgress(event : ProgressEvent) : void

		private function onID3(event : Event) : void

		private function onIOError(event : IOErrorEvent) : void

		public function destroy() : void
	}
}