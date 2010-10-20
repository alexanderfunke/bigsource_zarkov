package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.ant.nested.ValueParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.translations.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.CompilerWrapper;

public class AdtSign extends AbstractAdt
{
	
	public String _sdk = "";
	
	public AdtSign()
	{
		
		_options.put(STORETYPE, new CO(false, false));
		_options.put(KEYSTORE, new CO(false, false));
		_options.put(KEYPASS, new CO(false, false));
		_options.put(AIR_INTERMEDIATE_FILE, new CO(false, false));
		_options.put(AIR_FILE, new CO(false, false));
		_options.put(STOREPASS, new CO(false, false));
		_options.put(ALIAS, new CO(false, false));
		_options.put(PROVIDERNAME, new CO(false, false));
		_options.put(TSA, new CO(false, false));
		
	}
	
	public void setSDK(String sdk)
	{
		_sdk = sdk;
	}
	
	public void addConfiguredstoretype(ValueParam arg)
	{
		arg.task = this;
		arg.option = STORETYPE;
		addToArglist(STORETYPE, arg);
	}
	
	public void addConfiguredKeystore(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = KEYSTORE;
		addToArglist(KEYSTORE, arg);
	}
	
	public void addConfiguredKeypass(ValueParam arg)
	{
		arg.task = this;
		arg.option = KEYPASS;
		addToArglist(KEYPASS, arg);
	}
	
	public void addConfiguredAir_file(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = AIR_FILE;
		addToArglist(AIR_FILE, arg);
	}
	
	public void addConfiguredAir_intermediate_file(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = AIR_INTERMEDIATE_FILE;
		addToArglist(AIR_INTERMEDIATE_FILE, arg);
	}
	
	public void addConfiguredStorepass(ValueParam arg)
	{
		arg.task = this;
		arg.option = STOREPASS;
		addToArglist(STOREPASS, arg);
	}
	
	public void addConfiguredAlias(ValueParam arg)
	{
		arg.task = this;
		arg.option = ALIAS;
		addToArglist(ALIAS, arg);
	}
	
	public void addConfiguredProvidername(ValueParam arg)
	{
		arg.task = this;
		arg.option = PROVIDERNAME;
		addToArglist(PROVIDERNAME, arg);
	}
	
	public void addConfiguredTsa(ValueParam arg)
	{
		arg.task = this;
		arg.option = TSA;
		addToArglist(TSA, arg);
	}
	
	public void execute() throws BuildException
	{
		
		ArrayList<String> output = new ArrayList<String>();
		output.add("-sign");
		
		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();
		
		if (_args.get(AIR_INTERMEDIATE_FILE) == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("adt.specify_air_intermediate_file"));
		}
		
		if (_args.get(AIR_FILE) == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("adt.specify_air_file"));
		}
		
		if (_args.get(STORETYPE) == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("adt.specify_storetype"));
		}
		
		if (_args.get(ALIAS) != null)
		{
			output.add("-" + ALIAS + " " + _args.get(ALIAS).get(0));
		}
		
		if (_args.get(STORETYPE) != null)
		{
			output.add("-" + STORETYPE + " " + _args.get(STORETYPE).get(0));
		}
		
		if (_args.get(KEYSTORE) != null)
		{
			output.add("-" + KEYSTORE + " " + _args.get(KEYSTORE).get(0));
		}
		
		if (_args.get(STOREPASS) != null)
		{
			output.add("-" + STOREPASS + " " + _args.get(STOREPASS).get(0));
		}
		
		output.add(_args.get(AIR_INTERMEDIATE_FILE).get(0).toString());
		output.add(_args.get(AIR_FILE).get(0).toString());
		
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
