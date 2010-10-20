package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.translations.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.CompilerWrapper;

public class Amxmlc extends Mxmlc
{
	
	public Amxmlc()
	{
		super();
	}
	
	public void execute() throws BuildException
	{
		
		ArrayList<String> output = new ArrayList<String>();
		
		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();
		
		for (String o : _options.keySet())
		{
			output = buildCommand(o, output);
		}
		
		checkPreconditions();
		
		if (_sdk != "")
		{
			ZarkovTargetsView.addTarget("amxmlc", output, _sdk);
			CompilerWrapper.call("amxmlc", "bat", output, this, _sdk);
			
			while (_exit != true)
			{
				cal = Calendar.getInstance();
				if (cal.getTimeInMillis() - starttime > _max_execution_time)
				{
					throw new BuildException(TranslationUtil.getTranslation("general.max_execution_time"));
				}
			}
			onlyFirstError(onlyFirstError, lasterror);
			checkError(_error, _errormessage);
		}
	}
	
}
