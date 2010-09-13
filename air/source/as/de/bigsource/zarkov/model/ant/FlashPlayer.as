package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.BuildProxy;

	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.filesystem.File;
	import flash.system.Capabilities;

	public class FlashPlayer extends AntTask
	{
		private var _swf : String = "";
		private var _basedir : String = "";
		private var _player : String = "";
		private var process : NativeProcess;
		private var _buildProxy : BuildProxy;

		public function FlashPlayer(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			_player = PropertyBuilder.checkString(p_task.@player, p_properties);
			_swf = PropertyBuilder.checkString(p_task.@swf, p_properties);
			
			_buildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
		}

		override public function execute() : void
		{
			
			var osName : String = Capabilities.os;
			var tool : String;
			var arguments : Vector.<String> = new Vector.<String>();
			if (_basedir == "")
			{
				_buildProxy.callException("Basedir not set. Please correct your settings. Example: basedir=\"${basedir}\"", targetID);
				return;
			}
			
			if (_swf == "")
			{
				_buildProxy.callException("Swf not set. Please correct your settings. Example: swf=\"deploy/swf/application.swf\"", targetID);
				return;
			}
			
			if (_player == "")
			{
				_buildProxy.callException("Player not set. Please specify the path to the Flashplayer. Example: player=\"/workspace/flashlibs/flex_sdk_3.3/runtimes/player/mac/Flash Player.app\"", targetID);
				return;
			}
			var executable : File = new File(_player);
			if(!executable.exists)
			{
				_buildProxy.callException("Player-Path wrong. Please correct your settings.", targetID);
				return;
			}
			
			var swfPath : File = new File(_basedir + "/" + _swf);
			if(!swfPath.exists)
			{
				_buildProxy.callException("SWF not found. Used path is: " + _basedir + "/" + _swf + ". Please correct your settings.", targetID);
				return;
			}
			
			if (osName.indexOf("Windows") > -1)
			{
				tool = _player;
				arguments.push(_basedir + "/" + _swf);
			}
			else if (osName.indexOf("Mac") > -1)
			{
				tool = "/usr/bin/open";				arguments.push("-a");				arguments.push(_player);
				arguments.push(_basedir + "/" + _swf);			
			}
			else if (osName.indexOf("Linux") > -1)
			{
				tool = "open";
				arguments.push(_player);
				arguments.push(_basedir + "/" + _swf);
			}
			
			var file : File = new File(tool);

			var startupInfo : NativeProcessStartupInfo = new NativeProcessStartupInfo();
			startupInfo.executable = file;
			startupInfo.arguments = arguments;
			
			process = new NativeProcess();
			process.start(startupInfo);
			
			_buildProxy.buildComplete(this);
		}
	}
}