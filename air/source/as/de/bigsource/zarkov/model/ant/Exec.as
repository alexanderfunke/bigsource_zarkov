package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.FcshProxy;
	import de.bigsource.zarkov.model.ant.nested.BooleanParam;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.model.base.CO;
	import de.bigsource.zarkov.model.base.FlexStandardTask;

	public class Mxmlc extends FlexStandardTask 
	{
		private var _fcshProxy : FcshProxy;

		public function Mxmlc(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			_fcshProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(FcshProxy.NAME) as FcshProxy;
			
			properties = p_properties;
			name = p_task.name();
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			sdk = PropertyBuilder.checkString(p_task.@sdk, p_properties);
			_max_execution_time = PropertyBuilder.checkInteger(p_task.@max_execution_time, p_properties);
			_id = "bigsource.mxmlc";
			antTarget = p_target;

			super();
			_options["dump-config"] = new CO(false, false);
			_options["generate-frame-loader"] = new CO(true, false);
			_options["file-specs"] = new CO(true, false);
			
			for each (var def : XML in p_task.children()) 
			{
				try
				{
					this[def.name()] = def;
				} catch(e : Error)
				{
					trace("Attribute "+def.name() + " will be ignored.");
				}
			}
		}

		/*
		 * dump-config
		 */

		public function set dump_config(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "dump_config", _basedir, p_xml, properties);
			addToArglist("dump-config", arg);
		}

		/*
		 * generate-frame-loader
		 */

		public function set generate_frame_loader(arg : BooleanParam) : void 
		{
			addToArglist("generate-frame-loader", arg);
		}

		/*
		 * file-specs
		 */

		public function set file_specs(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "file_specs", _basedir, p_xml, properties);
			addToArglist("file-specs", arg);
		}

		override public function execute() : void 
		{
			
			if (_basedir == null) 
			{
				new BuildException("You have to specify a basedir.", targetID);
				return;
			}
			
			var file_specs : Array = _args["file-specs"];
			if (file_specs == null) 
			{
				new BuildException("Please specify the main class with <file_specs.../>", targetID);
				return;
			}

			var output : Array = new Array();

			for (var key : String in _options) 
			{
				output = buildCommand(key, output);
			}
			checkPreconditions();
			
			
			
			if(!_fcshProxy.fcshExists(sdk))
			{
				new BuildException("FCSH not found. Please check the sdk path. It should be set to the basedir of the sdk, not the bin folder.", targetID);
				return;
			}
				
			_fcshProxy.compile("mxmlc", output, sdk, this);
		}
	}
}