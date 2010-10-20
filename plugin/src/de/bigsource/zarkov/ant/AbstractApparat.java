package de.bigsource.zarkov.ant;

import java.io.File;
import java.util.ArrayList;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.BooleanParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.ApparatWrapper;

public class AbstractApparat extends ZarkovTask
{
	
	protected String _apparatDirectory = "";
	protected String _scala = "";
	protected String apparatPart = "";
	
	public AbstractApparat()
	{
		_options.put("i", new CO(false, false));
		_options.put("o", new CO(false, false));
		_options.put("s", new CO(false, false));
		_options.put("Dapparat.threads", new CO(true, false));
		_options.put("Dapparat.7z.enabled", new CO(true, false));
		_options.put("Dapparat.7z.path", new CO(true, false));
	}
	
	public void setApparatDirectory(String apparatDirectory)
	{
		_apparatDirectory = apparatDirectory;
	}
	
	public void setScala(String scala)
	{
		_scala = scala;
	}
	
	public void addConfiguredInputFile(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "i";
		addToArglist("i", arg);
	}
	
	public void addConfiguredOutputFile(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "o";
		addToArglist("o", arg);
	}
	
	public void addConfiguredThreads(BooleanParam arg)
	{
		addToArglist("Dapparat.threads", arg);
	}
	
	public void addConfiguredSet7zEnabled(BooleanParam arg)
	{
		addToArglist("Dapparat.7z.enabled", arg);
	}
	
	public void addConfiguredSet7zPath(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "Dapparat.7z.path";
		addToArglist("Dapparat.7z.path", arg);
	}
	
	public void execute() throws BuildException
	{
		
		ArrayList<String> output = new ArrayList<String>();
		
		for (String o : _options.keySet())
		{
			output = buildCommand(o, output);
		}
		
		if (_apparatDirectory == "")
		{
			throw new BuildException(TranslationUtil.getTranslation("apparat.apparat_directory_not_set"));
		}
		
		if (!new File(_apparatDirectory).exists())
		{
			throw new BuildException(TranslationUtil.getTranslation("apparat.apparat_directory_not_found"));
		}
		
		if (_scala == "")
		{
			throw new BuildException(TranslationUtil.getTranslation("apparat.scala_not_set"));
		}
		
		if (!new File(_scala).exists())
		{
			throw new BuildException(TranslationUtil.getTranslation("apparat.scala_not_found"));
		}
		
		ZarkovTargetsView.addTarget("apparat", output, null);
		ApparatWrapper.call(output, this, _scala, _apparatDirectory, apparatPart);
		while (_exit != true)
		{
			
		}
		checkError(_error, _errormessage);
		
	}
	
}
