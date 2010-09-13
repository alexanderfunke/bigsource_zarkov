package de.bigsource.zarkov.ant;

import java.io.File;
import java.util.ArrayList;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.ValueParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.TranslationUtil;
import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.ApparatWrapper;

public class Concrete extends ZarkovTask
{
	
	private String _apparatDirectory = "";
	private String _scala = "";
	private String apparatPart = "";

	public Concrete()
	{
		_options.put("s", new CO(false, false));
		
		apparatPart = "apparat.tools.concrete.Concrete";
	}
	
	public void setApparatDirectory(String apparatDirectory)
	{
		_apparatDirectory = apparatDirectory;
	}
	
	public void setScala(String scala)
	{
		_scala = scala;
	}
	
	public void addConfiguredInputFiles(ValueParam arg)
	{
		arg.task = this;
		arg.option = "i";
		addToArglist("i", arg);
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
		
		if (_apparatDirectory == "")
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
