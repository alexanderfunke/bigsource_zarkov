package de.bigsource.model.sound
	/**
		private var _ar_mutegroup : Array;

		public function SoundProxy() 
		override public function onRegister() : void
		/**
		/**
		public function registerSoundItem(p_sounditem : SoundItem, p_group : String = "video") : Boolean
		private function createSoundItem(p_id : String, p_group : String) : Boolean
		/**
		public function play(p_id : String, p_volume : Number = -1, p_startTime : Number = 0, p_loops : int = 0) : void
		public function stop(p_id : String) : void
		public function pause(p_id : String) : void
		public function seek(p_id : String, p_msec : Number) : void
		public function mute(p_id : String) : void
		public function unmute(p_id : String) : void
		public function setVolume(p_id : String, p_volume : Number) : void
		public function getVolume(p_id : String) : Number
		public function fade(p_id : String, p_targVolume : Number = 0, p_fadeLength : Number = 1) : void
		public function fadeGroup(p_group : String, p_targVolume : Number = 0, p_fadeLength : Number = 1) : void
		public function getPosition(p_id : String) : Number
		public function getDuration(p_id : String) : Number
		public function remove(p_id : String) : void
		public function muteGroup(p_group : String = "GROUP_ALL") : void
		public function unmuteGroup(p_group : String = "GROUP_ALL") : void
		public function isGroupMuted(p_group : String = "GROUP_ALL") : Boolean
		public function removeGroup(p_group : String = "GROUP_ALL") : void
		private function onSoundComplete(event : SoundNotification) : void
		private function onSoundID3(event : SoundNotification) : void
		private function onSoundError(event : SoundNotification) : void
		private function onSoundLoadingComplete(event : SoundNotification) : void
		private function onSoundOpen(event : SoundNotification) : void
		private function onSoundProgress(event : SoundNotification) : void
		override public function onRemove() : void