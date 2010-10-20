package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.AbstractParam;
import de.bigsource.zarkov.ant.nested.EmptyParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.ant.nested.ValueParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.AdlWrapper;

public class Adl extends ZarkovTask
{
	
	public String _sdk = "";
	
	public Adl()
	{
		
		_options.put("runtime", new CO(false, false));
		_options.put("pubid", new CO(false, false));
		_options.put("nodebug", new CO(false, false));
		_options.put("app-desc", new CO(false, false));
		_options.put("root-dir", new CO(false, false));
		_options.put("parameter", new CO(false, false));
		
	}
	
	public void setSDK(String sdk)
	{
		_sdk = sdk;
	}
	
	public void addConfiguredRuntime(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "runtime";
		addToArglist("runtime", arg);
	}
	
	public void addConfiguredpubid(ValueParam arg)
	{
		arg.task = this;
		arg.option = "pubid";
		addToArglist("pubid", arg);
	}
	
	public void addConfiguredNodebug(EmptyParam arg)
	{
		addToArglist("nodebug", arg);
	}
	
	public void addConfiguredApp_desc(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "app_desc";
		addToArglist("app-desc", arg);
	}
	
	public void addConfiguredRoot_dir(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "root_dir";
		addToArglist("root-dir", arg);
	}
	
	public void addConfiguredParameter(ValueParam arg)
	{
		arg.task = this;
		arg.option = "parameter";
		addToArglist("parameter", arg);
	}
	
	public void execute() throws BuildException
	{
		
		String output = "";
		
		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();
		
		for (String o : _options.keySet())
		{
			output += buildADLCommand(o);
		}
		
		if (_sdk != "")
		{
			ZarkovTargetsView.addTarget("adl", output, _sdk);
			AdlWrapper.call(output, this, _sdk);
			
			while (_exit != true)
			{
				cal = Calendar.getInstance();
				if (cal.getTimeInMillis() - starttime > 1000)
				{
					this.quit();
				}
			}
			checkError(_error, _errormessage);
		}
		else
		{
			throw new BuildException(TranslationUtil.getTranslation("general.usage_of_preferences"));
		}
	}
	
	protected String buildADLCommand(String key)
	{
		String output = "";
		CO co = (CO) _options.get(key);
		ArrayList<AbstractParam> val = _args.get(key);
		if (val != null)
		{
			if (!key.equals("app-desc") && !key.equals("root-dir") && !key.equals("parameter"))
			{
				if (val.size() > 1)
				{
					for (int i = 0; i < val.size(); i++)
					{
						if (co.pluralize)
						{
							output += " -" + key + "+=" + val.get(i);
						}
						else
						{
							output += " -" + key + " " + val.get(i);
						}
					}
				}
				else
				{
					if (val.size() > 0)
					{
						if (co.equalize)
						{
							output += " -" + key + "=" + val.get(0);
						}
						else
						{
							output += " -" + key + " " + val.get(0);
						}
						
					}
				}
			}
			else if (key.equals("app-desc"))
			{
				output += " " + val.get(0);
			}
			else if (key.equals("root-dir"))
			{
				output += " " + val.get(0);
			}
			else if (key.equals("parameter"))
			{
				
				if (val.size() > 0)
				{
					output += " --";
				}
				
				for (int i = 0; i < val.size(); i++)
				{
					output += " " + val.get(i);
				}
			}
		}
		
		return output;
	}
	
}
