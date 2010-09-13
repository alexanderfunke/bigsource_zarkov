package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.model.base.BuildException;

	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.filesystem.File;
	import flash.system.Capabilities;

	public class Browser extends AntTask
	{
		private var _url : String;
		private var _basedir : String;		private var _browser : String;
		private var process : NativeProcess;
		private var _buildProxy : BuildProxy;

		public function Browser(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
						_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);			_browser = PropertyBuilder.checkString(p_task.@browser, p_properties);
			_url = PropertyBuilder.checkString(p_task.@url, p_properties);
			
			_buildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
		}

		override public function execute() : void
		{

			var osName : String = Capabilities.os;
			var tool : String;
	    
			if (_basedir == "" && !_url.indexOf("http://") == 0 && !_url.indexOf("https://") == 0 && !_url.indexOf("file://") == 0)
			{
				new BuildException("Basedir not set. Please correct your settings. Example: basedir=\"${basedir}\"", targetID);
				return;
			}
			
			if (_url == "")
			{
				new BuildException("Url not set. Please correct your settings. Example: url=\"deploy/index.html\"", targetID);
				return;
			}
			
			if (!_url.indexOf("http://") == 0 && !_url.indexOf("https://") == 0 && !_url.indexOf("file://") == 0)
			{
				_url = _basedir + "/" + _url;
				var page : File = new File(_url);
				if (!page.exists)
				{
					new BuildException("URL not found. Used path is: " + _url + ". Please correct your settings.", targetID);
					return;
				}
			}
			
			if (osName.indexOf("Windows") > -1)
			{
				if (_browser == "")
				{
					new BuildException("Please specify the path to the Browser! Example: browser=\"c:\\Program Files\\Mozilla\\Firefox\\Firefox.exe\"", targetID);
					return;
				}
				
				var executable : File = new File(_browser);
				if (!executable.exists)
				{
					new BuildException("Browser not found. Used path is: " + _browser + ". Please correct your settings.", targetID);
					return;
				}
				tool = _browser;
			}
			else if (osName.indexOf("Mac") > -1)
			{
				tool = "/usr/bin/open";
			}
			else if (osName.indexOf("Linux") > -1)
			{
				tool = "open";
			}
	    
			var file : File = new File(tool);
			
			var arguments : Vector.<String> = new Vector.<String>();
			arguments.push(_url);
			var startupInfo : NativeProcessStartupInfo = new NativeProcessStartupInfo();
			startupInfo.executable = file;
			startupInfo.arguments = arguments;
			
			process = new NativeProcess();
			process.start(startupInfo);
			
			_buildProxy.buildComplete(this);
		}
	}
}
