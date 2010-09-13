package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.AdtProxy;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.model.base.CO;

	public class AdtPrepare extends AbstractAdt 
	{

		public var sdk : String = "";
		private var _adtProxy : AdtProxy;

		public function AdtPrepare(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			
			_adtProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(AdtProxy.NAME) as AdtProxy;
			
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			sdk = PropertyBuilder.checkString(p_task.@sdk, p_properties);
			_max_execution_time = PropertyBuilder.checkInteger(p_task.@max_execution_time, p_properties);
			_id = "bigsource.adt_prepare";
		
			super();
			_options[AIR_INTERMEDIATE_FILE] = new CO(false, false);
			_options[APP_XML] = new CO(false, false);
			_options[ADD_FILE] = new CO(false, false);
			_options[ADD_DIR] = new CO(false, false);
			_options[STOREPASS] = new CO(false, false);
			_options[ROOTPATH] = new CO(false, false);
			
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

		public function set air_intermediate_file(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, AIR_INTERMEDIATE_FILE, _basedir, p_xml, properties);
			addToArglist(AIR_INTERMEDIATE_FILE, arg);
		}

		public function set app_xml(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, APP_XML, _basedir, p_xml, properties);
			addToArglist(APP_XML, arg);
		}

		public function set add_file(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, ADD_FILE, _basedir, p_xml, properties);
			arg.relative = true;
			addToArglist(ADD_FILE, arg);
		}

		public function set add_dir(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, ADD_DIR, _basedir, p_xml, properties);
			arg.relative = true;
			addToArglist(ADD_DIR, arg);
		}

		public function set rootpath(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, ROOTPATH, _basedir, p_xml, properties);
			addToArglist(ROOTPATH, arg);
		}

		override public function execute() : void
		{


			var val : Array;
			_max_execution_time = 5000;

			if (_args[ROOTPATH] == null) 
			{
				new BuildException("You have to specify the rootpath", targetID);
				return;
			}

			//		if (!_args[ROOTPATH][0].toString().endsWith("/")) {
			//			throw new BuildException("rootpath must end with a /");
			//return;
			//		}

			if (_args[AIR_INTERMEDIATE_FILE] == null) 
			{
				new BuildException("You have to specify the Air intermediate file.", targetID);
				return;
			}

			if (_args[APP_XML] == null) 
			{
				new BuildException("You have to specify the Air xml file.", targetID);
				return;
			}

			var output : String = " -prepare";

			output += " " + _args[AIR_INTERMEDIATE_FILE][0] + " " + _args[APP_XML][0] + " -C " + _args[ROOTPATH][0];
		
			var i : int;
		
			if (_args[ADD_FILE] != null) 
			{
				val = _args[ADD_FILE];
				for (i = 0;i < val.length;i++) 
				{
					output += " " + val[i];
				}
			}

			if (_args[ADD_DIR] != null) 
			{
				val = _args[ADD_DIR];
				for (i = 0;i < val.length;i++) 
				{
					output += " " + val[i];
				}
			}

			if (sdk != "") 
			{
				_adtProxy.call(output, this, sdk);
			} 
			else 
			{
				new BuildException("Usage of Eclipse Preferences is deprecated for compatibility reasons. Please use the sdk attribute at your tasks.\nExample: <bigsource.mxml basedir=\"${basedir}\" sdk=\"PATH TO SDK\" />", targetID);
			}
		}
	}
}