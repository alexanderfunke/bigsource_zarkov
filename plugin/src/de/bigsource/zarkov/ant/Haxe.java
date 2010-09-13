package de.bigsource.zarkov.ant;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.EmptyParam;
import de.bigsource.zarkov.ant.nested.IntegerParam;
import de.bigsource.zarkov.ant.nested.MtascHeaderParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.ant.nested.ValueParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.ZarkovUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.HaxeWrapper;

public class Haxe extends ZarkovTask
{
	
	private String _haxe;
	
	public Haxe()
	{
		
		_options.put("cp", new CO(false, false));
		_options.put("js", new CO(false, false));
		_options.put("as3", new CO(false, false));
		_options.put("swf", new CO(false, false));
		_options.put("swf9", new CO(false, false));
		_options.put("swf-version", new CO(false, false));
		_options.put("swf-header", new CO(false, false));
		_options.put("swf-lib", new CO(false, false));
		_options.put("neko", new CO(false, false));
		_options.put("php", new CO(false, false));
		_options.put("x", new CO(false, false));
		_options.put("xml", new CO(false, false));
		_options.put("main", new CO(false, false));
		_options.put("lib", new CO(false, false));
		_options.put("D", new CO(false, false));
		_options.put("resource", new CO(false, false));
		_options.put("exclude", new CO(false, false));
		_options.put("v", new CO(false, false));
		_options.put("debug", new CO(false, false));
		_options.put("prompt", new CO(false, false));
		_options.put("cmd", new CO(false, false));
		_options.put("-flash-strict", new CO(false, false));
		_options.put("-no-traces", new CO(false, false));
		_options.put("-flash-use-stage", new CO(false, false));
		_options.put("-neko-source", new CO(false, false));
		_options.put("-gen-hx-classes", new CO(false, false));
		_options.put("-next", new CO(false, false));
		_options.put("-display", new CO(false, false));
		_options.put("-no-output", new CO(false, false));
		_options.put("-times", new CO(false, false));
		_options.put("-no-inline", new CO(false, false));
		_options.put("-php-front", new CO(false, false));
		_options.put("-remap", new CO(false, false));
	}
	
	public void setHaxe(String haxe)
	{
		_haxe = haxe;
	}
	
	public void addConfiguredCp(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "cp";
		addToArglist("cp", arg);
	}
	
	public void addConfiguredJs(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "js";
		addToArglist("js", arg);
	}
	
	public void addConfiguredAs3(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "as3";
		addToArglist("as3", arg);
	}
	
	public void addConfiguredSwf(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "swf";
		addToArglist("swf", arg);
	}
	
	public void addConfiguredSwf9(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "swf9";
		addToArglist("swf9", arg);
	}
	
	public void addConfiguredSwf_Version(IntegerParam arg)
	{
		arg.task = this;
		arg.option = "swf-version";
		addToArglist("swf-version", arg);
	}
	
	public void addConfiguredSwf_Header(MtascHeaderParam arg)
	{
		arg.task = this;
		arg.option = "swf-header";
		addToArglist("swf-header", arg);
	}
	
	public void addConfiguredSwf_Lib(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "swf-lib";
		addToArglist("swf-lib", arg);
	}
	
	public void addConfiguredNeko(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "neko";
		addToArglist("neko", arg);
	}
	
	public void addConfiguredPhp(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "php";
		addToArglist("php", arg);
	}
	
	public void addConfiguredX(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "x";
		addToArglist("x", arg);
	}
	
	public void addConfiguredXml(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "xml";
		addToArglist("xml", arg);
	}
	
	public void addConfiguredMain(ValueParam arg)
	{
		arg.task = this;
		arg.option = "main";
		addToArglist("main", arg);
	}
	
	public void addConfiguredLib(ValueParam arg)
	{
		arg.task = this;
		arg.option = "lib";
		addToArglist("lib", arg);
	}
	
	public void addConfiguredD(ValueParam arg)
	{
		arg.task = this;
		arg.option = "d";
		addToArglist("d", arg);
	}
	
	public void addConfiguredResource(ValueParam arg)
	{
		arg.task = this;
		arg.option = "resource";
		addToArglist("resource", arg);
	}
	
	public void addConfiguredExclude(PathParam arg)
	{
		arg.task = this;
		arg.option = "exclude";
		addToArglist("exclude", arg);
	}
	
	public void addConfiguredV(EmptyParam arg)
	{
		addToArglist("v", arg);
	}
	
	public void addConfiguredDebug(EmptyParam arg)
	{
		addToArglist("debug", arg);
	}
	
	public void addConfiguredPrompt(EmptyParam arg)
	{
		addToArglist("prompt", arg);
	}
	
	public void addConfiguredCmd(ValueParam arg)
	{
		arg.task = this;
		arg.option = "cmd";
		addToArglist("cmd", arg);
	}
	
	public void addConfiguredFlash_Strict(EmptyParam arg)
	{
		addToArglist("-flash-strict", arg);
	}
	
	public void addConfiguredNo_Traces(EmptyParam arg)
	{
		addToArglist("-no-traces", arg);
	}
	
	public void addConfiguredFlash_Use_Stage(EmptyParam arg)
	{
		addToArglist("-flash-use-stage", arg);
	}
	
	public void addConfiguredNeko_Source(EmptyParam arg)
	{
		addToArglist("-neko-source", arg);
	}
	
	public void addConfiguredGen_HX_Classes(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "-gen-hx-classes";
		addToArglist("-gen-hx-classes", arg);
	}
	
	public void addConfiguredNext(EmptyParam arg)
	{
		addToArglist("-next", arg);
	}
	
	public void addConfiguredDisplay(EmptyParam arg)
	{
		addToArglist("-display", arg);
	}
	
	public void addConfiguredNo_Output(EmptyParam arg)
	{
		addToArglist("-no-output", arg);
	}
	
	public void addConfiguredTimes(EmptyParam arg)
	{
		addToArglist("-times", arg);
	}
	
	public void addConfiguredNo_Inline(EmptyParam arg)
	{
		addToArglist("-no-inline", arg);
	}
	
	public void addConfiguredPhp_Front(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "-php-front";
		addToArglist("-php-front", arg);
	}
	
	public void addConfiguredRemap(ValueParam arg)
	{
		arg.task = this;
		arg.option = "-remap";
		addToArglist("-remap", arg);
	}
	
	public void execute() throws BuildException
	{
		
		String output = "";
		
		for (String o : _options.keySet())
		{
			String cmd = buildCommand(o);
			if (cmd != "")
			{
				output += buildCommand(o) + "\n";
			}
		}
		
		if (_haxe.endsWith("haxe") || _haxe.endsWith("haxe.exe"))
		{
			
			ZarkovTargetsView.addTarget("haxe", output, null);
			HaxeWrapper.call(output, this, _basedir, _haxe);
			while (_exit != true)
			{
				
			}
			ZarkovUtil.checkError(_error, _errormessage);
		}
		else
		{
			throw new BuildException(ZarkovUtil.getTranslation("haxe.executable_not_set"));
		}
	}
}
