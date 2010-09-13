package de.bigsource.zarkov.model
{
	import de.bigsource.utils.StringUtil;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.NativeProcessExitEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	public class AbstractCompilerProxy extends Proxy implements IProxy 
	{
		protected var _task : ZarkovTask;
		protected var _buildProxy : BuildProxy;
		protected var _process : NativeProcess;
		protected var _tool : String;
		protected var _processBuffer : ByteArray = new ByteArray();

		public function AbstractCompilerProxy(p_name:String)
		{
			super(p_name);
		}
		
		override public function onRegister() : void
		{
			
		}

		public function callFromArray(p_command : Array, p_parent : ZarkovTask) : void 
		{
			_buildProxy = facade.retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
			_task = p_parent;
			
			var arguments : Vector.<String> = new Vector.<String>();
			
			for (var i:int = 0;i < p_command.length;i++)
			{
				var suboption : Array = String(p_command[i]).split(" ");
				arguments.push(suboption[0]);
				if (suboption.length > 1 && suboption[1] != null)
				{
					arguments.push(suboption[1]);
				}
			}
			
			var file : File = new File(_tool);

			var startupInfo : NativeProcessStartupInfo = new NativeProcessStartupInfo();
			startupInfo.executable = file;
			startupInfo.arguments = arguments;
			
			_process = new NativeProcess();
			_process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData, false, 0, true);			_process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData, false, 0, true);
			_process.addEventListener(NativeProcessExitEvent.EXIT, onStandardOutputClose, false, 0, true);
			_process.start(startupInfo);

		}
		
		public function callFromString(p_command : String, p_parent : ZarkovTask) : void 
		{
			_buildProxy = facade.retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
			_task = p_parent;
							
			var arguments : Vector.<String> = new Vector.<String>();
			var commandList:Array = p_command.split(" ");
			for (var i:int = 0;i < commandList.length;i++)
			{
				var suboption : Array = String(commandList[i]).split(" ");
				arguments.push(suboption[0]);
				if (suboption.length > 1 && suboption[1] != null)
				{
					arguments.push(suboption[1]);
				}
			}
			
			var file : File = new File(_tool);

			var startupInfo : NativeProcessStartupInfo = new NativeProcessStartupInfo();
			startupInfo.executable = file;
			startupInfo.arguments = arguments;
			
			_process = new NativeProcess();
			_process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData, false, 0, true);
			_process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData, false, 0, true);
			_process.addEventListener(NativeProcessExitEvent.EXIT, onStandardOutputClose, false, 0, true);
			_process.start(startupInfo);

		}
		
		protected function onStandardOutputClose(event : NativeProcessExitEvent) : void 
		{
			_process.removeEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData);
			_process.removeEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData);
			_process.removeEventListener(NativeProcessExitEvent.EXIT, onStandardOutputClose);
			
			_task.quit();
		}

		protected function onOutputData(event : ProgressEvent) : void 
		{
			_process.standardOutput.readBytes(_processBuffer, _processBuffer.length);
			var out : String = new String(_processBuffer);
			var lines : Array = out.split("\n");
			for each (var line : String in lines) 
			{
				if(StringUtil.trim(line) != "")
				{
					_buildProxy.addMessage(line, _task.targetID);
				}
			}
			
			_processBuffer = new ByteArray();
		}
		
		protected function onErrorData(event : ProgressEvent) : void 
		{
			_process.standardError.readBytes(_processBuffer, _processBuffer.length);
			var out : String = new String(_processBuffer);
			var lines : Array = out.split("\n");
			for each (var line : String in lines) 
			{
				if(StringUtil.trim(line) != "")
				{
					_buildProxy.addMessage(line, _task.targetID);
				}
			}
			
			_processBuffer = new ByteArray();
		}

		public function quit() : void 
		{
		}

		public function getTask() : ZarkovTask 
		{
			return _task;
		}
		
		override public function onRemove() : void
		{
		}
	}
}
