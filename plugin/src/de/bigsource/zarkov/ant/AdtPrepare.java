package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.AbstractParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.translations.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.CompilerWrapper;

public class AdtPrepare extends AbstractAdt
{
	
	public String _sdk = "";
	
	public AdtPrepare()
	{
		
		_options.put(AIR_INTERMEDIATE_FILE, new CO(false, false));
		_options.put(APP_XML, new CO(false, false));
		_options.put(ADD_FILE, new CO(false, false));
		_options.put(ADD_DIR, new CO(false, false));
		_options.put(STOREPASS, new CO(false, false));
		_options.put(ROOTPATH, new CO(false, false));
		
	}
	
	public void setSDK(String sdk)
	{
		_sdk = sdk;
	}
	
	public void addConfiguredAir_intermediate_file(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = AIR_INTERMEDIATE_FILE;
		addToArglist(AIR_INTERMEDIATE_FILE, arg);
	}
	
	public void addConfiguredApp_xml(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = APP_XML;
		addToArglist(APP_XML, arg);
	}
	
	public void addConfiguredAdd_file(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = ADD_FILE;
		arg.setUserelative(true);
		addToArglist(ADD_FILE, arg);
	}
	
	public void addConfiguredAdd_dir(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = ADD_DIR;
		arg.setUserelative(true);
		addToArglist(ADD_DIR, arg);
	}
	
	public void addConfiguredRootpath(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = ROOTPATH;
		addToArglist(ROOTPATH, arg);
	}
	
	public void execute() throws BuildException
	{
		
		ArrayList<AbstractParam> val;
		_max_execution_time = 5000;
		
		if (_args.get(ROOTPATH) == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("adt.specify_rootpath"));
		}
		
		if (!_args.get(ROOTPATH).get(0).toString().endsWith("/"))
		{
			throw new BuildException(TranslationUtil.getTranslation("adt.rootpath_end"));
		}
		
		if (_args.get(AIR_INTERMEDIATE_FILE) == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("adt.specify_air_intermediate_file"));
		}
		
		if (_args.get(APP_XML) == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("adt.specify_app_xml"));
		}
		
		ArrayList<String> output = new ArrayList<String>();
		output.add("-prepare");
		
		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();
		System.out.println("Rootpath: " + _args.get(ROOTPATH).get(0));
		output.add(_args.get(AIR_INTERMEDIATE_FILE).get(0).toString());
		output.add(_args.get(APP_XML).get(0).toString());
		output.add("-C");
		output.add(_args.get(ROOTPATH).get(0).toString());
		
		if (_args.get(ADD_FILE) != null)
		{
			val = _args.get(ADD_FILE);
			for (int i = 0; i < val.size(); i++)
			{
				output.add(val.get(i).toString());
			}
		}
		
		if (_args.get(ADD_DIR) != null)
		{
			val = _args.get(ADD_DIR);
			for (int i = 0; i < val.size(); i++)
			{
				output.add(val.get(i).toString());
			}
		}
		
		if (_sdk != "")
		{
			ZarkovTargetsView.addTarget("adt", output, _sdk);
			CompilerWrapper.call("adt", "bat", output, this, _sdk);
			
			while (_exit != true)
			{
				cal = Calendar.getInstance();
				if (cal.getTimeInMillis() - starttime > _max_execution_time)
				{
					this.quit();
				}
			}
			onlyFirstError(onlyFirstError, lasterror);
			checkError(_error, _errormessage);
		}
		else
		{
			throw new BuildException(TranslationUtil.getTranslation("general.usage_of_preferences"));
		}
	}
}
