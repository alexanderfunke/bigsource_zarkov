package de.bigsource.zarkov.ant;

import java.util.ArrayList;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.EmptyParam;
import de.bigsource.zarkov.ant.nested.IntegerParam;
import de.bigsource.zarkov.ant.nested.MtascHeaderParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.ant.nested.ValueParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.CompilerWrapper;

public class Mtasc extends ZarkovTask
{
	
	private String _mtasc = "";
	
	public Mtasc()
	{
		
		_options.put("swf", new CO(false, false));
		_options.put("cp", new CO(false, false));
		_options.put("main", new CO(false, false));
		_options.put("header", new CO(false, false));
		_options.put("mx", new CO(false, false));
		_options.put("version", new CO(false, false));
		_options.put("v", new CO(false, false));
		_options.put("out", new CO(false, false));
		_options.put("msvc", new CO(false, false));
		_options.put("strict", new CO(false, false));
		_options.put("exclude", new CO(false, false));
		_options.put("trace", new CO(false, false));
		_options.put("keep", new CO(false, false));
		_options.put("frame", new CO(false, false));
		_options.put("pack", new CO(false, false));
		_options.put("group", new CO(false, false));
		_options.put("wimp", new CO(false, false));
		_options.put("infer", new CO(false, false));
	}
	
	public void setMtasc(String mtasc)
	{
		_mtasc = mtasc;
	}
	
	public void addConfiguredSwf(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "swf";
		addToArglist("swf", arg);
	}
	
	public void addConfiguredCp(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "cp";
		addToArglist("cp", arg);
	}
	
	public void addConfiguredMain(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "main";
		addToArglist("main", arg);
	}
	
	public void addConfiguredHeader_For_Mtasc(MtascHeaderParam arg)
	{
		arg.task = this;
		arg.option = "header";
		addToArglist("header", arg);
	}
	
	public void addConfiguredMx(EmptyParam arg)
	{
		addToArglist("mx", arg);
	}
	
	public void addConfiguredVersion(IntegerParam arg)
	{
		arg.task = this;
		arg.option = "version";
		addToArglist("version", arg);
	}
	
	public void addConfiguredV(EmptyParam arg)
	{
		addToArglist("v", arg);
	}
	
	public void addConfiguredOut(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "out";
		addToArglist("out", arg);
	}
	
	public void addConfiguredMsvc(EmptyParam arg)
	{
		addToArglist("msvc", arg);
	}
	
	public void addConfiguredStrict(EmptyParam arg)
	{
		addToArglist("strict", arg);
	}
	
	public void addConfiguredExclude(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "exclude";
		addToArglist("exclude", arg);
	}
	
	public void addConfiguredTrace(ValueParam arg)
	{
		
		arg.task = this;
		arg.option = "trace";
		addToArglist("trace", arg);
	}
	
	public void addConfiguredKeep(EmptyParam arg)
	{
		addToArglist("keep", arg);
	}
	
	public void addConfiguredFrame(EmptyParam arg)
	{
		addToArglist("frame", arg);
	}
	
	public void addConfiguredPack(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "pack";
		addToArglist("pack", arg);
	}
	
	public void addConfiguredGroup(EmptyParam arg)
	{
		addToArglist("group", arg);
	}
	
	public void addConfiguredWimp(EmptyParam arg)
	{
		addToArglist("wimp", arg);
	}
	
	public void addConfiguredInfer(EmptyParam arg)
	{
		addToArglist("infer", arg);
	}
	
	public void execute() throws BuildException
	{
		
		ArrayList<String> output = new ArrayList<String>();
		
		for (String o : _options.keySet())
		{
			output = buildCommand(o, output);
		}
		if (_mtasc!="" && (_mtasc.endsWith("mtasc") || _mtasc.endsWith("mtasc.exe")))
		{
			ZarkovTargetsView.addTarget("mtasc", output, null);
			CompilerWrapper.call(_mtasc, null, output, this, null);
			while (_exit != true)
			{
				
			}
			checkError(_error, _errormessage);
		}
		else
		{
			throw new BuildException(TranslationUtil.getTranslation("mtasc.executable_not_set"));
		}
	}
	
}
