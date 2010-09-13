package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.AdtProxy;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.ant.nested.ValueParam;
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.model.base.CO;

	public class AdtSign extends AbstractAdt 
	{

		public var sdk : String = "";
		private var _adtProxy : AdtProxy;

		public function AdtSign(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			
			_adtProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(AdtProxy.NAME) as AdtProxy;
			
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			sdk = PropertyBuilder.checkString(p_task.@sdk, p_properties);
			_max_execution_time = PropertyBuilder.checkInteger(p_task.@max_execution_time, p_properties);
			_id = "bigsource.adt_certificate";
		
			super();

			_options[STORETYPE] = new CO(false, false);
			_options[KEYSTORE] = new CO(false, false);
			_options[KEYPASS] = new CO(false, false);
			_options[AIR_INTERMEDIATE_FILE] = new CO(false, false);
			_options[AIR_FILE] = new CO(false, false);
			_options[STOREPASS] = new CO(false, false);
			_options[ALIAS] = new CO(false, false);
			_options[PROVIDERNAME] = new CO(false, false);
			_options[TSA] = new CO(false, false);
			
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

		public function set storetype(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, STORETYPE, p_xml, properties);
			addToArglist(STORETYPE, arg);
		}

		public function set keystore(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, KEYSTORE, _basedir, p_xml, properties);
			addToArglist(KEYSTORE, arg);
		}

		public function set keypass(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, KEYPASS, p_xml, properties);
			addToArglist(KEYPASS, arg);
		}

		public function set air_file(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, AIR_FILE, _basedir, p_xml, properties);
			addToArglist(AIR_FILE, arg);
		}

		public function set air_intermediate_file(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, AIR_INTERMEDIATE_FILE, _basedir, p_xml, properties);
			addToArglist(AIR_INTERMEDIATE_FILE, arg);
		}

		public function set storepass(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, STOREPASS, p_xml, properties);
			addToArglist(STOREPASS, arg);
		}

		public function set alias(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, ALIAS, p_xml, properties);
			addToArglist(ALIAS, arg);
		}

		public function set providername(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, PROVIDERNAME, p_xml, properties);
			addToArglist(PROVIDERNAME, arg);
		}

		public function set tsa(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, TSA, p_xml, properties);
			addToArglist(TSA, arg);
		}

		override public function execute() : void  
		{

			var output : String = " -sign";

			if (_args[AIR_INTERMEDIATE_FILE] == null) 
			{
				new BuildException("You have to specify the " + AIR_INTERMEDIATE_FILE, targetID);
				return;
			}

			if (_args[AIR_FILE] == null) 
			{
				new BuildException("You have to specify the " + AIR_FILE, targetID);
				return;
			}

			if (_args[STORETYPE] == null) 
			{
				new BuildException("You have to specify the " + STORETYPE, targetID);
				return;
			}

			if (_args[ALIAS] != null) 
			{
				output += " -" + ALIAS + " " + _args[ALIAS][0];
			}

			if (_args[STORETYPE] != null) 
			{
				output += " -" + STORETYPE + " " + _args[STORETYPE][0];
			}

			if (_args[KEYSTORE] != null) 
			{
				output += " -" + KEYSTORE + " " + _args[KEYSTORE][0];
			}

			if (_args[STOREPASS] != null) 
			{
				output += " -" + STOREPASS + " " + _args[STOREPASS][0];
			}

			output += " " + _args[AIR_INTERMEDIATE_FILE][0] + " " + _args[AIR_FILE][0];

			if (sdk != "") 
			{
				_adtProxy.call(output, this, sdk);
			} 
			else 
			{
				new BuildException("Usage of Eclipse Preferences is deprecated for compatibility reasons. Please use the sdk attribute at your tasks.\nExample: <bigsource.mxml basedir=\"${basedir}\" sdk=\"PATH TO SDK\" />", targetID);
				return;
			}
		}
	}
}