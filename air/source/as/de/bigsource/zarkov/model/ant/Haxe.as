package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.HaxeProxy;
	import de.bigsource.zarkov.model.ant.nested.EmptyParam;
	import de.bigsource.zarkov.model.ant.nested.IntegerParam;
	import de.bigsource.zarkov.model.ant.nested.MtascHeaderParam;
	import de.bigsource.zarkov.model.ant.nested.PathParam;
	import de.bigsource.zarkov.model.ant.nested.ValueParam;
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.model.base.CO;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class Haxe extends ZarkovTask
	{
		private var _haxe : String;
		private var _haxeProxy : HaxeProxy;

		public function Haxe(p_target:AntTarget, p_task : XML, p_properties : Array)
		{
			
			_haxeProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(HaxeProxy.NAME) as HaxeProxy;
			
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			
			_basedir = PropertyBuilder.checkString(p_task.@basedir, p_properties);
			_haxe = PropertyBuilder.checkString(p_task.@haxe, p_properties);
			
			_options["cp"] = new CO(false, false);
			_options["js"] = new CO(false, false);
			_options["as3"] = new CO(false, false);
			_options["swf"] = new CO(false, false);
			_options["swf9"] = new CO(false, false);
			_options["swf-version"] = new CO(false, false);
			_options["swf-header"] = new CO(false, false);
			_options["swf-lib"] = new CO(false, false);
			_options["neko"] = new CO(false, false);
			_options["php"] = new CO(false, false);
			_options["x"] = new CO(false, false);
			_options["xml"] = new CO(false, false);
			_options["main"] = new CO(false, false);
			_options["lib"] = new CO(false, false);
			_options["D"] = new CO(false, false);
			_options["resource"] = new CO(false, false);
			_options["exclude"] = new CO(false, false);
			_options["v"] = new CO(false, false);
			_options["debug"] = new CO(false, false);
			_options["prompt"] = new CO(false, false);
			_options["cmd"] = new CO(false, false);
			_options["-flash-strict"] = new CO(false, false);
			_options["-no-traces"] = new CO(false, false);
			_options["-flash-use-stage"] = new CO(false, false);
			_options["-neko-source"] = new CO(false, false);
			_options["-gen-hx-classes"] = new CO(false, false);
			_options["-next"] = new CO(false, false);
			_options["-display"] = new CO(false, false);
			_options["-no-output"] = new CO(false, false);
			_options["-times"] = new CO(false, false);
			_options["-no-inline"] = new CO(false, false);
			_options["-php-front"] = new CO(false, false);
			_options["-remap"] = new CO(false, false);
			
			for each (var def : XML in p_task.children()) 
			{
				this[def.name()] = def;
			}
		}

		public function set cp(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "cp", _basedir, p_xml, properties);
			addToArglist("cp", arg);
		}

		public function set js(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "js", _basedir, p_xml, properties);
			addToArglist("js", arg);
		}

		public function set as3(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "as3", _basedir, p_xml, properties);
			addToArglist("as3", arg);
		}

		public function set swf(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "swf", _basedir, p_xml, properties);
			addToArglist("swf", arg);
		}

		public function set swf9(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "swf9", _basedir, p_xml, properties);
			addToArglist("swf9", arg);
		}

		public function set swf_version(p_xml : XML) : void
		{
			var arg : IntegerParam = new IntegerParam(this, "swf-version", p_xml, properties);
			addToArglist("swf-version", arg);
		}

		public function set swf_header(p_xml : XML) : void
		{
			var arg : MtascHeaderParam = new MtascHeaderParam(this, "swf-header", p_xml, properties);
			addToArglist("swf-header", arg);
		}

		public function set swf_lib(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "swf-lib", _basedir, p_xml, properties);
			addToArglist("swf-lib", arg);
		}

		public function set neko(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "neko", _basedir, p_xml, properties);
			addToArglist("neko", arg);
		}

		public function set php(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "php", _basedir, p_xml, properties);
			addToArglist("php", arg);
		}

		public function set x(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "x", _basedir, p_xml, properties);
			addToArglist("x", arg);
		}

		public function set xml(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "xml", _basedir, p_xml, properties);
			addToArglist("xml", arg);
		}

		public function set main(p_xml : XML) : void
		{
			var arg : ValueParam = new ValueParam(this, "main", p_xml, properties);
			addToArglist("main", arg);
		}

		public function set lib(p_xml : XML) : void
		{
			var arg : ValueParam = new ValueParam(this, "lib", p_xml, properties);
			addToArglist("lib", arg);
		}

		public function set d(p_xml : XML) : void
		{
			var arg : ValueParam = new ValueParam(this, "d", p_xml, properties);
			addToArglist("d", arg);
		}

		public function set resource(p_xml : XML) : void
		{
			var arg : ValueParam = new ValueParam(this, "resource", p_xml, properties);
			addToArglist("resource", arg);
		}

		public function set exclude(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "exclude", _basedir, p_xml, properties);
			addToArglist("exclude", arg);
		}

		public function set v(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("v", arg);
		}

		public function set debug(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("debug", arg);
		}

		public function set prompt(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("prompt", arg);
		}

		public function set cmd(p_xml : XML) : void
		{
			var arg : ValueParam = new ValueParam(this, "cmd", p_xml, properties);
			addToArglist("cmd", arg);
		}

		public function set flash_strict(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-flash-strict", arg);
		}

		public function set no_traces(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-no-traces", arg);
		}

		public function set flash_use_stage(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-flash-use-stage", arg);
		}

		public function set neko_source(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-neko-source", arg);
		}

		public function set gen_hx_classes(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "-gen-hx-classes", _basedir, p_xml, properties);
			addToArglist("-gen-hx-classes", arg);
		}

		public function set next(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-next", arg);
		}

		public function set display(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-display", arg);
		}

		public function set no_output(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-no-output", arg);
		}

		public function set times(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-times", arg);
		}

		public function set no_inline(p_xml : XML) : void
		{ 
			var arg : EmptyParam = new EmptyParam(p_xml);
			addToArglist("-no-inline", arg);
		}

		public function set php_front(p_xml : XML) : void
		{
			var arg : PathParam = new PathParam(this, "-php-front", _basedir, p_xml, properties);
			addToArglist("-php-front", arg);
		}

		public function set remap(p_xml : XML) : void
		{
			var arg : ValueParam = new ValueParam(this, "-remap", p_xml, properties);
			addToArglist("-remap", arg);
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
		
			if (_haxe != "" && (_haxe.indexOf("haxe")>-1 || _haxe.indexOf("haxe.exe")>-1))
			{
				_haxeProxy.call(output, this, _haxe);
			}
			else
			{
				new BuildException("You have not choosen the HAXE compiler. Please choose a different file!", targetID);
				return;
			}
		}
	}
}
