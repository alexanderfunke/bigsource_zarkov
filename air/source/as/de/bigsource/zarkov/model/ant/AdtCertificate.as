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

	public class AdtCertificate extends AbstractAdt 
	{
		private var sdk : String;
		private var _adtProxy : AdtProxy;

		public function AdtCertificate(p_target:AntTarget, p_task : XML, p_properties : Array) 
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
			_options[COMMON_NAME] = new CO(false, false);
			_options[ORGANISATION_UNIT] = new CO(false, false);
			_options[ORGANISATION] = new CO(false, false);
			_options[COUNTRY] = new CO(false, false);
			_options[STORETYPE] = new CO(false, false);
			_options[KEYSTORE] = new CO(false, false);
			_options[KEYPASS] = new CO(false, false);
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

		public function set common_name(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, COMMON_NAME, p_xml, properties);
			addToArglist(COMMON_NAME, arg);
		}

		public function set organisation_unit(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, ORGANISATION_UNIT, p_xml, properties);
			addToArglist(ORGANISATION_UNIT, arg);
		}

		public function set organisation(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, ORGANISATION, p_xml, properties);
			addToArglist(ORGANISATION, arg);
		}

		public function set country(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, COUNTRY, p_xml, properties);
			addToArglist(COUNTRY, arg);
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

			var output : String = " -certificate";

			for (var key : String in _options) 
			{
				output = buildADTCommand(key, output);
			}

			output += " " + _args[STORETYPE][0] + " " + _args[KEYSTORE][0] + " " + _args[KEYPASS][0];

			if (sdk != "") 
			{
				_adtProxy.call(output, this, sdk);
			} 
			else 
			{
				new BuildException("Usage of Eclipse Preferences is deprecated for compatibility reasons. Please use the sdk attribute at your tasks.\nExample: <bigsource.mxml basedir=\"${basedir}\" sdk=\"PATH TO SDK\" />", targetID);
			}
		}

		protected function buildADTCommand(key : String, output : String) : String 
		{
			var co : CO = _options[key] as CO;
			var val : Array = _args[key];
			if (val != null) 
			{
				if (key != STORETYPE && key != KEYSTORE && key != KEYPASS) 
				{
					if (val.length > 1) 
					{
						for (var i : int = 0;i < val.length;i++) 
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
				}
			}

			return output;
		}
	}
}
