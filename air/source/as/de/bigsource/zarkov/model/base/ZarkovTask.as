package de.bigsource.zarkov.model.base
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.model.ant.AntTask;
	import de.bigsource.zarkov.model.ant.nested.AbstractParam;
	import de.bigsource.zarkov.model.ant.nested.DefineParam;
	import de.bigsource.zarkov.model.ant.nested.PathAppendParam;
	import de.bigsource.zarkov.model.ant.nested.ValueParam;

	public class ZarkovTask extends AntTask
	{
		public var _id : String;
		public var _errormessage : String;

		public var _basedir : String;

		protected var _max_execution_time : int = 60000;
		protected var _args : Array = new Array();
		protected var _options : Array = new Array();

		public function setBasedir(basedir : String) : void
		{
			_basedir = basedir;
		}

		public function setId(id : String) : void
		{
			_id = id;
		}

		public function setMaxExecutionTime(max_execution_time : int) : void
		{
			_max_execution_time = max_execution_time;
		}

		protected function addToArglist(key : String, val : AbstractParam) : void
		{
			if (_args[key] != null)
			{
				(_args[key] as Array).push(val);
			}
			else
			{
				var arr : Array = new Array();
				arr.push(val);
				_args[key] = arr;
			}
		}

		protected function buildCommand(key : String, output : Array) : Array 
		{
			var co : CO = _options[key] as CO;
			var val : Array = _args[key];
			var i : int;
			if (val != null && key != "args")
			{
				if (val.length > 1)
				{
					for (i = 0;i < val.length;i++)
					{
						if (co.pluralize)
						{
							output.push("-" + key + "+=" + val[i]);
						}
						else
						{
							output.push("-" + key + " " + val[i]);
						}
					}
				}
				else
				{
					if (val.length > 0)
					{
						var value : AbstractParam = val[0] as AbstractParam;
						if (co.equalize)
						{
							if (val[0] is PathAppendParam && value.append() || val[0] is DefineParam && value.append() || val[0] is ValueParam && value.append())
							{
								output.push("-" + key + "+=" + val[0]);
							}
							else
							{
								output.push("-" + key + "=" + val[0]);
							}
						}
						else
						{
							if (val[0] is PathAppendParam && value.append() || val[0] is DefineParam && value.append() || val[0] is ValueParam && value.append())
							{
								output.push("-" + key + "+=" + val[0]);
							}
							else
							{
								output.push("-" + key + " " + val[0]);
							}
						}
					}
				}
			}
			if (val != null && key == "args")
			{
				if (val.length > 1)
				{
					for (i = 0;i < val.length;i++)
					{
						output.push(String(val[i]));
					}
				}
				else
				{
					if (val.length > 0)
					{
						output.push(String(val[0]));
					}
				}
			}

			return output;
		}

		public function callException(message : String = null) : void
		{
			var buildProxy:BuildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
			buildProxy.callException(message, this.targetID);
		}

		public function quit() : void
		{
			var buildProxy:BuildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
			buildProxy.buildComplete(this);
		}

		public function onQuit() : void 
		{
		}
	}
}