package de.bigsource.zarkov.model 
{
	import nochump.util.zip.ZipEntry;
	import nochump.util.zip.ZipFile;

	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;

	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	import mx.controls.Alert;

	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLStream;

	public class UpdaterProxy extends Proxy implements IProxy 
	{
		public static const NAME : String = "CheckUpdateProxy";
		public var onComplete : Function;
		private var _urlLoader : URLLoader;
		private var _remoteVersion : Number;

		public function UpdaterProxy() 
		{
			super(NAME);
		}

		override public function onRegister() : void
		{
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onLoadingVersionXMLComplete, false, 0, true);			_urlLoader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler, false, 0, true);
		}

		private function onLoadingVersionXMLComplete(event : Event) : void 
		{
			_remoteVersion = Number(_urlLoader.data);
			if(Application.localVersion < _remoteVersion)
			{
				Alert.show("Version "+_remoteVersion+" of BigSource Zarkov is available.", "Update available", Alert.OK | Alert.CANCEL, null, onUpdateClickHandler, null, Alert.OK);
			} 
			else 
			{
				Alert.show("No new Version of BigSource Zarkov is available.", "No Update available");
			}
		}
		
		private function errorHandler(event : ErrorEvent) : void 
		{
			Alert.show("An Error occured. Please check you internetconnection.", "An error occured");
		}

		public function init() : void 
		{
			ApplicationFacade(facade).application.version.text = "Version " + Application.localVersion;
			
			onComplete();
		}

		public function check() : void
		{
			_urlLoader.load(new URLRequest("http://update.bigsource.de/air/latest.txt"));
		}

		
		
		private function onUpdateClickHandler(evt_obj : Object) : void
		{
			if (evt_obj.detail == Alert.OK) 
			{
				var urlStream : URLStream = new URLStream();
				urlStream.addEventListener(Event.COMPLETE, loadZipComplete);
				urlStream.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
				urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
				urlStream.load(new URLRequest("http://update.bigsource.de/air/latest.zip"));
			} 
		}

		private function loadZipComplete(event : Event) : void 
		{
			var data : URLStream = URLStream(event.target);
			var zipFile : ZipFile = new ZipFile(data);
			var appDir : File = File.applicationDirectory;
			for each (var entry : ZipEntry in zipFile.entries) 
			{
				if(entry.isDirectory())
				{
					var destDir : File = new File(appDir.nativePath + "/" + entry.name);
					if(!destDir.exists)
					{
						destDir.createDirectory();
					}
				} 
				else 
				{
					var tempFile : File = new File(appDir.nativePath + "/"+entry.name);
					var stream : FileStream = new FileStream();
					stream.open(tempFile, FileMode.WRITE);
					stream.writeBytes(zipFile.getInput(entry));
					stream.close();
				}
			}
			
			Alert.show("Please restart BigSource Zarkov to use the new version.", "Update complete");
		}

		
		override public function onRemove() : void
		{
		}
	}
}