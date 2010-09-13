package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.FcshProxy;
	import de.bigsource.zarkov.model.ant.nested.BooleanParam;
	import de.bigsource.zarkov.model.ant.nested.IntegerParam;
	import de.bigsource.zarkov.model.ant.nested.NameDescriptionParam;
	import de.bigsource.zarkov.model.ant.nested.NamespaceParam;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.ant.nested.ValueParam;
	import de.bigsource.zarkov.model.base.CO;
	import de.bigsource.zarkov.model.base.FlexStandardTask;

	public class AsDoc extends FlexStandardTask 
	{
		private var _fcshProxy : FcshProxy;

		public function AsDoc(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
		
			_fcshProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(FcshProxy.NAME) as FcshProxy;
			
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			sdk = PropertyBuilder.checkString(p_task.@sdk, p_properties);
			_max_execution_time = PropertyBuilder.checkInteger(p_task.@max_execution_time, p_properties);
			_id = "bigsource.asdoc";
			
			super();
			_options["doc-classes"] = new CO(true, false);
			_options["doc-namespaces"] = new CO(true, false);
			_options["doc-sources"] = new CO(true, false);
			_options["exclude-classes"] = new CO(true, false);
			_options["exclude-dependencies"] = new CO(true, false);
			_options["footer"] = new CO(true, false);
			_options["include-lookup-only"] = new CO(true, false);
			_options["left-frameset-width"] = new CO(false, false);
			_options["main-title"] = new CO(true, false);
			_options["packages.package"] = new CO(false, false);
			_options["templates-path"] = new CO(true, false);
			_options["window-title"] = new CO(true, false);
			
			for each (var def : XML in p_task.children()) 
			{
				this[def.name()] = def;
			}
		}

		public function set doc_classes(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "doc-classes", _basedir, p_xml, properties);
			addToArglist("doc-classes", arg);
		}

		public function set doc_namespaces(p_xml : XML) : void 
		{
			var arg : NamespaceParam = new NamespaceParam(_basedir, p_xml, properties);
			addToArglist("doc-namespaces", arg);
		}

		public function set doc_sources(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "doc-sources", _basedir, p_xml, properties);
			addToArglist("doc-sources", arg);
		}

		public function set exclude_classes(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "exclude-classes", p_xml, properties);
			addToArglist("exclude-classes", arg);
		}

		public function set exclude_dependencies(p_xml : XML) : void 
		{
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("exclude-dependencies", arg);
		}

		public function set footer_for_asdoc(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "footer_for_asdoc", p_xml, properties);
			addToArglist("footer", arg);
		}

		public function set include_lookup_only(p_xml : XML) : void 
		{
			var arg : BooleanParam = new BooleanParam(p_xml, properties);
			addToArglist("include-lookup-only", arg);
		}

		public function set left_frameset_width(p_xml : XML) : void 
		{
			var arg : IntegerParam = new IntegerParam(this, "left_frameset_width", p_xml, properties);
			addToArglist("left-frameset-width", arg);
		}

		public function set main_title(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "main_title", p_xml, properties);
			addToArglist("main-title", arg);
		}

		public function set packages__package(p_xml : XML) : void 
		{
			var arg : NameDescriptionParam = new NameDescriptionParam(p_xml, properties);
			addToArglist("packages.package", arg);
		}

		public function set package_for_asdoc(p_xml : XML) : void 
		{
			var arg : NameDescriptionParam = new NameDescriptionParam(p_xml, properties);
			addToArglist("packages.package", arg);
		}

		public function set template_path(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "templates-path", _basedir, p_xml, properties);
			addToArglist("templates-path", arg);
		}

		public function set window_title(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "window_title", p_xml, properties);
			addToArglist("window-title", arg);
		}

		override public function execute() : void 
		{

		//TODO: AsDoc in Betrieb nehmen
//		ArrayList<String> output = new ArrayList<String>();
//
//		Calendar cal = Calendar.getInstance();
//		long starttime = cal.getTimeInMillis();
//
//		for (String o : _options.keySet()) {
//			if (buildCommand(o) != "") {
//				output = buildCommand(o, output);
//			}
//
//		}
//
//		outputDebugInfo();
//
//		if (Helper.isPathSet(_version, _sdk)) {
//			ZarkovTargetsView.addTarget("asdoc", output, _version);
//			AsDocWrapper.call(output, this);
//
//			while (_exit != true) {
//				cal = Calendar.getInstance();
//				if (cal.getTimeInMillis() - starttime > _max_execution_time) {
//					throw new BuildException("Max execution time reached!");
//				}
//			}
//			if (!onlyFirstError) {
//				Calendar calnow = Calendar.getInstance();
//				lasterror = calnow.getTimeInMillis();
//				while ((lasterror + 800) > calnow.getTimeInMillis()) {
//					calnow = Calendar.getInstance();
//				}
//			}
//			if (_error == true) {
//				if (_errormessage != null) {
//					throw new BuildException(_errormessage);
//				} else {
//					throw new BuildException("Compiler had errors!");
//				}
//			}
//		} else {
//			throw new BuildException("You have not specified the Flex Version " + _version
//					+ " path. Please choose a different file!");
//		}
		}
	}
}
