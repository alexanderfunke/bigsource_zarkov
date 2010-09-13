package de.bigsource.zarkov.model.fcsh
{
	import de.bigsource.utils.StringUtil;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.model.ant.AntTask;

	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.NativeProcessExitEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.system.Capabilities;
	import flash.utils.ByteArray;

	public class FcshThread extends EventDispatcher
	{

		private var _sdk : String = "";
		private var process : NativeProcess;
		private var processBuffer : ByteArray = new ByteArray();
		private var nativeProcessStartupInfo : NativeProcessStartupInfo;
		private var _buildProxy : BuildProxy;
		private var _currentTask : AntTask;

		public function FcshThread(sdk : String)
		{
			
			_buildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
			_sdk = sdk;
			
			var osName : String = Capabilities.os;
			var fcsh : String;
			
			if (osName.indexOf("Windows") > -1)
			{
				fcsh = _sdk + "\\bin\\fcsh.exe";
			}
			if (osName.indexOf("Mac") > -1 || osName.indexOf("Linux") > -1)
			{
				fcsh = _sdk + "/bin/fcsh";
			}
			var file : File = new File(fcsh);
			
			
			nativeProcessStartupInfo = new NativeProcessStartupInfo();
			nativeProcessStartupInfo.executable = file;
			
			process = new NativeProcess();
			process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData);			process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData);
			process.addEventListener(NativeProcessExitEvent.EXIT, onStandardOutputClose);
		}

		private function onStandardOutputClose(event : NativeProcessExitEvent) : void 
		{
			dispatchEvent(new Event(Event.CLOSE));
		}

		private function onOutputData(event : ProgressEvent) : void 
		{
			process.standardOutput.readBytes(processBuffer, processBuffer.length);
			var line : String = new String(processBuffer);
					
			line = StringUtil.replace(line, "(fcsh)", "");
			line = StringUtil.replace(line, "(fcsh) (fcsh)", "");

			if (line.toLowerCase().indexOf("bytes)") > -1 || line.toLowerCase().indexOf("byte)") > -1)
			{
				_buildProxy.buildComplete(_currentTask);
			}
		    
			if(line.toLowerCase().indexOf("default arguments may not be interspersed with other options") > -1)
			{
				_buildProxy.callException("You have spaces in one of your options. FCSH and the other Flex Compiler can't use spaces.\n\n", _currentTask.targetID);
			}

			addMessage(line);


			processBuffer = new ByteArray();
		}

		private function onErrorData(event : ProgressEvent) : void 
		{
			process.standardError.readBytes(processBuffer, processBuffer.length);
			var line : String = new String(processBuffer);

					
			line = StringUtil.replace(line, "(fcsh)", "");
			line = StringUtil.replace(line, "(fcsh) (fcsh)", "");

			

			if (line.toLowerCase().indexOf("java heap)") > -1)
			{
				_buildProxy.quitall();
				_buildProxy.callException("FCSH quit! Will start again at next compilation!", _currentTask.targetID);
			}
			else
			{
				
				if (line.indexOf("Fejl:") > -1 || line.indexOf("\u932f\u8aa4:") > -1 || line.indexOf("\u9519\u8bef:") > -1 || line.indexOf("Fel:") > -1 || line.indexOf("\u041e\u0448\u0438\u0431\u043a\u0430:") > -1 || line.indexOf("Erro:") > -1 || line.indexOf("Fout:") > -1 || line.indexOf("Feil:") > -1 || line.indexOf("\uc624\ub958:") > -1 || line.indexOf("\u30a8\u30e9\u30fc:") > -1 || line.indexOf("Errore:") > -1 || line.indexOf("Erreur:") > -1 || line.indexOf("Virhe:") > -1 || line.indexOf("Error:") > -1 || line.indexOf("Fehler:") > -1)
				{
					_buildProxy.callException("", _currentTask.targetID);
				}
			}
			
			addMessage(line);


			processBuffer = new ByteArray();
		}

		private function addMessage(p_msg : String) : void 
		{
			var lines : Array = p_msg.split("\n");
			for each (var line : String in lines) 
			{
				if(StringUtil.trim(line) != "")
				{
					_buildProxy.addMessage(line, _currentTask.targetID);
				}
			}
		}

		public function get output() : String
		{
			return new String(processBuffer);
		}

		public function run() : void
		{
		}

		public function call(command : String, p_task : AntTask) : void
		{
			_currentTask = p_task;
			process.standardInput.writeUTFBytes(command + "\n\n\n");
		}

		public function start() : void 
		{
			process.start(nativeProcessStartupInfo);
		}
	}
}
