package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.AdlProxy;
	import de.bigsource.zarkov.model.ant.nested.EmptyParam;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.ant.nested.ValueParam;
	import de.bigsource.zarkov.model.base.CO;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class Adl extends ZarkovTask 
	{

		public var sdk : String = "";
		private var _adlProxy : AdlProxy;

		public function Adl(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			
			_adlProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(AdlProxy.NAME) as AdlProxy;
			
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			sdk = PropertyBuilder.checkString(p_task.@sdk, p_properties);
			_max_execution_time = PropertyBuilder.checkInteger(p_task.@max_execution_time, p_properties);
			_id = "bigsource.adl";
		
			super();
			_options["runtime"] = new CO(false, false);
			_options["pubid"] = new CO(false, false);
			_options["nodebug"] = new CO(false, false);
			_options["app-desc"] = new CO(false, false);
			_options["root-dir"] = new CO(false, false);
			_options["parameter"] = new CO(false, false);
		
			for each (var mxmlcdef : XML in p_task.children()) 
			{
				this[mxmlcdef.name()] = mxmlcdef;
			}
		}

		public function set runtime(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "runtime", _basedir, p_xml, properties);
			addToArglist("runtime", arg);
		}

		public function set pubid(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "pubid", p_xml, properties);
			addToArglist("pubid", arg);
		}

		public function set nodebug(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("nodebug", arg);
		}

		public function set app_desc(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "app_desc", _basedir, p_xml, properties);
			addToArglist("app-desc", arg);
		}

		public function set root_dir(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "root_dir", _basedir, p_xml, properties);
			addToArglist("root-dir", arg);
		}

		public function set parameter(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "parameter", p_xml, properties);
			addToArglist("parameter", arg);
		}

		override public function execute() : void 
		{

			var output : String = "";

			for (var key : String in _options) 
			{
				output = buildADLCommand(key, output);
			}
			
			if (sdk != "")
			{
				_adlProxy.call(output, this, sdk);
			}
			else
			{
				new BuildException("Usage of Eclipse Preferences is deprecated for compatibility reasons. Please use the sdk attribute at your tasks.\nExample: <bigsource.mxml basedir=\"${basedir}\" sdk=\"PATH TO SDK\" />", targetID);
			}
		}

		protected function buildADLCommand(key : String, output:String) : String 
		{
		
			var i : int;
			var co : CO = _options[key] as CO;
			var val : Array = _args[key];
			
			if (val != null) 
			{
				if (!key == "app-desc" && !key == "root-dir" && !key == "parameter") 
				{
					if (val.length > 1) 
					{
						for (i = 0;i < val.length;i++) 
						{
							if (co.pluralize) 
							{
								output += " -" + key + "+=" + val[i];
							} 
							else 
							{
								output += " -" + key + " " + val[i];
							}
						}
					} 
					else 
					{
						if (val.length > 0) 
						{
							if (co.equalize) 
							{
								output += " -" + key + "=" + val[0];
							} 
							else 
							{
								output += " -" + key + " " + val[0];
							}
						}
					}
				} else if (key == "app-desc") 
				{
					output += " " + val[0];
				} else if (key == "root-dir") 
				{
					output += " " + val[0];
				} else if (key == "parameter") 
				{

					if (val.length > 0) 
					{
						output += " --";
					}

					for (i = 0;i < val.length;i++) 
					{
						output += " " + val[i];
					}
				}
			}
			
			trace(output);
			
			return output;
		}
	}
}
