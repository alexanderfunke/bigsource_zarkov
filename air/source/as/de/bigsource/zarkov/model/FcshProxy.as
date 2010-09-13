package de.bigsource.zarkov.model
{
	import de.bigsource.zarkov.model.ant.AntTask;
	import de.bigsource.zarkov.model.fcsh.FcshThread;

	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	import flash.filesystem.File;
	import flash.system.Capabilities;

	public class FcshProxy extends Proxy implements IProxy 
	{
		public static const NAME : String = "FcshProxy";
		public var _threads : Array;
		public var lasterror : Number;
		public var _targets : Array = new Array();

		public function FcshProxy()
		{
			super(NAME);
		}

		override public function onRegister() : void
		{
		}

		public function compile(option : String, command : Array, sdk : String, p_task:AntTask) : void
		{
			
			var targetIdentifier : String = option + command.join(" ");
			if (!targetExists(targetIdentifier, sdk))
			{
				addTarget(targetIdentifier, sdk);
			}
			else
			{
				var targetid : int = getTarget(targetIdentifier, sdk);
				compileTarget((targetid + 1), sdk, p_task);
				return;
			}
			
			if (_threads == null)
			{
				_threads = new Array();
			}
		
			if (_threads[sdk] == null)
			{
				startThread(sdk);
			}
			
			for (var i : int = 0;i < command.length;i++)
			{
				option += " " + command[i];
			}
			
			FcshThread(_threads[sdk]).call(option, p_task);
		}

		public function compileTarget(target : int, sdk : String, p_task:AntTask) : void
		{
			if (_threads == null)
			{
				_threads = new Array();
			}
			
			if (_threads[sdk] == null)
			{
				startThread(sdk);
			}
			
			FcshThread(_threads[sdk]).call("compile " + target, p_task);
		}

		private function startThread(sdk : String) : void
		{
			if (_threads == null)
			{
				_threads = new Array();
			}
			
			var thread:FcshThread = new FcshThread(sdk);
			thread.start();
			
			_threads[sdk] = thread;
		}

		public function targetExists(p_id : String, p_sdk : String) : Boolean 
		{
			var currTargets : Array = _targets[p_sdk];
			if (currTargets == null) 
			{
				_targets[p_sdk] = new Array();
			}
			
			currTargets = _targets[p_sdk];
			if (currTargets.indexOf(p_id) > -1) 
			{
				return true;
			}
			
			return false;
		}

		public function addTarget(p_id : String, p_sdk : String) : void 
		{
			var currTargets : Array = _targets[p_sdk];
			if (currTargets == null) 
			{
				_targets[p_sdk] = new Array();
			}
			
			currTargets = _targets[p_sdk];
			if (!currTargets.indexOf(p_id) > -1) 
			{
				currTargets.push(p_id);
			}
		}

		public function getTarget(p_id : String, p_sdk : String) : int 
		{
			return (_targets[p_sdk] as Array).indexOf(p_id);
		}

		public function clearTargets(p_sdk : String) : void 
		{
			_targets[p_sdk] = null;
		}
		
		public function quit(sdk : String) : void
		{
			if (_threads == null)
			{
				_threads = new Array();
			}

			clearTargets(sdk);
			
			if (_threads[sdk] != null)
			{
				FcshThread(_threads[sdk]).call("quit\n", null);
			}
			
			startThread(sdk);
		}
		
		public function quitall() : void
		{
			for (var name:String in _threads)
			{
				quit(name);
			}
		}	
		
		public function fcshExists(p_sdk:String):Boolean
		{
			var osName : String = Capabilities.os;
			var fcsh : String;
			
			if (osName.indexOf("Windows") > -1)
			{
				fcsh = p_sdk + "\\bin\\fcsh.exe";
			}
			if (osName.indexOf("Mac") > -1 || osName.indexOf("Linux") > -1)
			{
				fcsh = p_sdk + "/bin/fcsh";
			}
			
			var file : File = new File(fcsh);
			
			return file.exists;
		}

		override public function onRemove() : void
		{
		}
	}
}
