package de.bigsource.model.sound {
	import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IOErrorEvent;	import flash.events.ProgressEvent;	import flash.media.Sound;	import flash.media.SoundChannel;	import flash.media.SoundLoaderContext;	import flash.media.SoundTransform;	import flash.net.URLRequest;	

	/**
	 * @author kimchristiansen
	 */
	public class SoundItem extends EventDispatcher	{		public var sound : Sound;		public var channel : SoundChannel;		private var _loops : int = 1;		protected var _ismuted : Boolean = false;		protected var _volume : Number = 1;		protected var _ispaused : Boolean = true;		private var _id : String;		private var _group : String;
		private var _position : Number = 0;
		private var bytesLoaded : Number;		private var bytesTotal : Number;

		public function SoundItem(p_id : String,p_group : String) 		{			_id = p_id;			_group = p_group;			_ispaused = false;			channel = new SoundChannel();		}

		public function get id() : String		{			return _id;		}

		public function get group() : String		{			return _group;		}

		public function get loops() : int		{			return _loops;			}

		public function get ispaused() : Boolean		{			return _ispaused;		}

		public function get ismuted() : Boolean		{			return _ismuted;		}

		public function get volume() : Number		{			return _volume;		}

		public function set volume(p_volume : Number) : void		{			_volume = p_volume;								if(!ismuted)			{				var curTransform : SoundTransform = channel.soundTransform;				curTransform.volume = p_volume;				channel.soundTransform = curTransform;			}		}

		public function addLibrarySound(p_linkageID : *) : void		{			removeSoundEvents();			sound = new p_linkageID();			addSoundEvents();				}

		public function addExternalSound(p_path : String, p_buffer : Number, p_checkPolicyFile : Boolean) : void		{			removeSoundEvents();						sound = new Sound(new URLRequest(p_path), new SoundLoaderContext(p_buffer, p_checkPolicyFile));			addSoundEvents();				}

		public function play(p_volume : Number = -1, p_startTime : Number = 0, p_loops : int = 0) : void		{						if( p_volume != -1)			{							volume = p_volume;			}						_loops = p_loops;											if( !ispaused )			{				stop();				_ispaused = false;				seek(p_startTime);						}else			{				_ispaused = false;				seek(_position);				}		}

		public function stop() : void		{			seek(0);			pause();		}

		public function pause() : void		{			_position = channel.position;			_ispaused = true;			channel.stop();		}

		public function seek(p_time : Number) : void		{			channel.stop();			channel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);			channel = sound.play(p_time, loops, channel.soundTransform);			channel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete, false, 0, true);		}

		public function mute() : void		{			_ismuted = true;						var curTransform : SoundTransform = channel.soundTransform;			curTransform.volume = 0;			channel.soundTransform = curTransform;					}

		public function unmute() : void		{			_ismuted = false;			volume = _volume;		}

		public function get duration() : Number		{			return sound.length;		}

		public function get position() : Number		{			return channel.position;		}

		private function addSoundEvents() : void		{			if( sound != null )			{				sound.addEventListener(ProgressEvent.PROGRESS, onLoadProgress, false, 0, true);				sound.addEventListener(IOErrorEvent.IO_ERROR, onIOError, false, 0, true);				sound.addEventListener(Event.ID3, onID3, false, 0, true);				sound.addEventListener(Event.COMPLETE, onLoadingComplete, false, 0, true);				sound.addEventListener(Event.OPEN, onOpen, false, 0, true);			}		}

		private function removeSoundEvents() : void		{			if( sound != null )			{				sound.removeEventListener(ProgressEvent.PROGRESS, onLoadProgress);				sound.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);				sound.removeEventListener(Event.ID3, onID3);				sound.removeEventListener(Event.COMPLETE, onLoadingComplete);				sound.removeEventListener(Event.OPEN, onOpen);				try
				{					sound.close();				}catch(err : Error)
				{
				}				stop();			}		}

		private function onOpen(event : Event) : void		{			dispatchEvent(new SoundNotification(SoundNotification.ON_SOUND_OPEN, id));		}

		private function onLoadingComplete(event : Event) : void		{			dispatchEvent(new SoundNotification(SoundNotification.ON_SOUND_LOADING_COMPLETE, id));		}

		private function onSoundComplete(event : Event) : void		{			stop();			dispatchEvent(new SoundNotification(SoundNotification.ON_SOUND_COMPLETE, id));		}

		private function onLoadProgress(event : ProgressEvent) : void		{			bytesLoaded = event.bytesLoaded;			bytesTotal = event.bytesTotal;						dispatchEvent(new SoundNotification(SoundNotification.ON_SOUND_PROGRESS, id));		}

		private function onID3(event : Event) : void		{			dispatchEvent(new SoundNotification(SoundNotification.ON_SOUND_ID3, id));		}

		private function onIOError(event : IOErrorEvent) : void		{			dispatchEvent(new SoundNotification(SoundNotification.ON_SOUND_ERROR, id));		}

		public function destroy() : void		{			removeSoundEvents();						channel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);		}
	}
}
