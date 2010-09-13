package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.FcshProxy;
	import de.bigsource.zarkov.model.ant.nested.BooleanParam;
	import de.bigsource.zarkov.model.ant.nested.NameParam;
	import de.bigsource.zarkov.model.ant.nested.NamePathParam;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.model.base.CO;
	import de.bigsource.zarkov.model.base.FlexStandardTask;

	public class Compc extends FlexStandardTask 
	{
		private var _fcshProxy : FcshProxy;

		public function Compc(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
		
			_fcshProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(FcshProxy.NAME) as FcshProxy;
			
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			sdk = PropertyBuilder.checkString(p_task.@sdk, p_properties);
			_max_execution_time = PropertyBuilder.checkInteger(p_task.@max_execution_time, p_properties);
			_id = "bigsource.compc";
			
			super();
			_options["compute-digest"] = new CO(true, false);
			_options["directory"] = new CO(true, false);
			_options["dump-config"] = new CO(false, false);
			_options["include-classes"] = new CO(false, true);
			_options["include-file"] = new CO(false, false);
			_options["include-lookup-only"] = new CO(true, false);
			_options["include-namespaces"] = new CO(false, true);
			_options["include-sources"] = new CO(false, false);
			_options["include-stylesheet"] = new CO(false, true);
			
			for each (var def : XML in p_task.children()) 
			{
				this[def.name()] = def;
			}
		}

		public function set compute_digest(p_xml : XML) : void 
		{
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("compute-digest", arg);
		}

		public function set directory(p_xml : XML) : void 
		{
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("directory", arg);
		}

		public function set dump_config(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "dump_config", _basedir, p_xml, properties);
			addToArglist("dump-config", arg);
		}

		public function set include_classes(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "include_classes", _basedir, p_xml, properties);
			addToArglist("include-classes", arg);
		}

		public function set include_file(p_xml : XML) : void 
		{
			var arg : NamePathParam = new NamePathParam(this, "include_file", _basedir, p_xml, properties);
			addToArglist("include-file", arg);
		}

		public function set include_lookup_only(p_xml : XML) : void 
		{
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("include-lookup-only", arg);
		}

		public function set include_namespaces(p_xml : XML) : void 
		{
			var arg : NameParam = new NameParam(this, "include_namespaces", p_xml, properties);
			addToArglist("include-namespaces", arg);
		}

		public function set include_sources(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "include_sources", _basedir, p_xml, properties);
			addToArglist("include-sources", arg);
		}

		public function set include_stylesheet(p_xml : XML) : void 
		{
			var arg : NamePathParam = new NamePathParam(this, "include_stylesheet", _basedir, p_xml, properties);
			addToArglist("include-stylesheet", arg);
		}

		override public function execute() : void 
		{
			if (_basedir == null) 
			{
				new BuildException("You have to specify a basedir.", targetID);
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
				
			_fcshProxy.compile("compc", output, sdk, this);
			
		}
	}
}
