package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.MtascProxy;
	import de.bigsource.zarkov.model.ant.nested.EmptyParam;
	import de.bigsource.zarkov.model.ant.nested.IntegerParam;
	import de.bigsource.zarkov.model.ant.nested.MtascHeaderParam;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.ant.nested.ValueParam;
	import de.bigsource.zarkov.model.base.CO;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class Mtasc extends ZarkovTask 
	{
		private var _mtasc : String;
		private var _mtascProxy : MtascProxy;

		public function Mtasc(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			_mtascProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(MtascProxy.NAME) as MtascProxy;
			
			properties = p_properties;
			name = p_task.name();
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			_mtasc = PropertyBuilder.checkString(p_task.@mtasc, p_properties);
			antTarget = p_target;
			
			_options["swf"] = new CO(false, false);
			_options["cp"] = new CO(false, false);
			_options["main"] = new CO(false, false);
			_options["header"] = new CO(false, false);
			_options["mx"] = new CO(false, false);
			_options["version"] = new CO(false, false);
			_options["v"] = new CO(false, false);
			_options["out"] = new CO(false, false);
			_options["msvc"] = new CO(false, false);
			_options["strict"] = new CO(false, false);
			_options["exclude"] = new CO(false, false);
			_options["trace"] = new CO(false, false);
			_options["keep"] = new CO(false, false);
			_options["frame"] = new CO(false, false);
			_options["pack"] = new CO(false, false);
			_options["group"] = new CO(false, false);
			_options["wimp"] = new CO(false, false);
			_options["infer"] = new CO(false, false);
			
			for each (var def : XML in p_task.children()) 
			{
				this[def.name()] = def;
			}
		}

		public function set swf(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "swf", _basedir, p_xml, properties);
			addToArglist("swf", arg);
		}

		public function set cp(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "cp", _basedir, p_xml, properties);
			addToArglist("cp", arg);
		}

		public function set main(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "main", _basedir, p_xml, properties);
			addToArglist("main", arg);
		}

		public function set header_for_mtasc(p_xml : XML) : void 
		{
			var arg : MtascHeaderParam = new MtascHeaderParam(this, "header", p_xml, properties);
			addToArglist("header", arg);
		}

		public function set mx(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("mx", arg);
		}

		public function set version(p_xml : XML) : void 
		{
			var arg : IntegerParam = new IntegerParam(this, "version", p_xml, properties);
			addToArglist("version", arg);
		}

		public function set v(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("v", arg);
		}

		public function set out(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "out", _basedir, p_xml, properties);
			addToArglist("out", arg);
		}

		public function set msvc(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("msvc", arg);
		}

		public function set strict(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("strict", arg);
		}

		public function set exclude(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "exclude", _basedir, p_xml, properties);
			addToArglist("exclude", arg);
		}

		public function set trace(p_xml : XML) : void 
		{
			var arg : ValueParam = new ValueParam(this, "trace", p_xml, properties);
			addToArglist("trace", arg);
		}

		public function set keep(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("keep", arg);
		}

		public function set frame(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("frame", arg);
		}

		public function set pack(p_xml : XML) : void 
		{
			var arg : PathParam = new PathParam(this, "pack", _basedir, p_xml, properties);
			addToArglist("pack", arg);
		}

		public function set group(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("group", arg);
		}

		public function set wimp(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("wimp", arg);
		}

		public function set infer(p_xml : XML) : void 
		{
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("infer", arg);
		}

		override public function execute() : void 
		{
			
			if (_basedir == "") 
			{
				new BuildException("You have to specify a basedir.", targetID);
				return;
			}
			
			var output : Array = new Array();
		
			for (var key : String in _options) 
			{
				output = buildCommand(key, output);
			}
		
			if (_mtasc != "" && (_mtasc.indexOf("mtasc")>-1 || _mtasc.indexOf("mtasc.exe")>-1))
			{
				_mtascProxy.call(output, this, _mtasc);
			}
			else
			{
				new BuildException("You have not choosen the MTASC compiler. Please choose a different file!", targetID);
				return;
			}
		}
	}
}