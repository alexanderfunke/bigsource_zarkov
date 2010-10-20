package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.AbstractParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.ant.nested.ValueParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.translations.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.CompilerWrapper;

public class AdtCertificate extends AbstractAdt
{
	
	public String _sdk = "";
	
	public AdtCertificate()
	{
		
		_options.put(COMMON_NAME, new CO(false, false));
		_options.put(ORGANISATION_UNIT, new CO(false, false));
		_options.put(ORGANISATION, new CO(false, false));
		_options.put(COUNTRY, new CO(false, false));
		_options.put(STORETYPE, new CO(false, false));
		_options.put(KEYSTORE, new CO(false, false));
		_options.put(KEYPASS, new CO(false, false));
		_options.put(STOREPASS, new CO(false, false));
		_options.put(ALIAS, new CO(false, false));
		_options.put(PROVIDERNAME, new CO(false, false));
		_options.put(TSA, new CO(false, false));
		
	}
	
	public void setSDK(String sdk)
	{
		_sdk = sdk;
	}
	
	public void addConfiguredCommon_name(ValueParam arg)
	{
		arg.task = this;
		arg.option = COMMON_NAME;
		addToArglist(COMMON_NAME, arg);
	}
	
	public void addConfiguredOrganisation_unit(ValueParam arg)
	{
		arg.task = this;
		arg.option = ORGANISATION_UNIT;
		addToArglist(ORGANISATION_UNIT, arg);
	}
	
	public void addConfiguredOrganisation(ValueParam arg)
	{
		arg.task = this;
		arg.option = ORGANISATION;
		addToArglist(ORGANISATION, arg);
	}
	
	public void addConfiguredCountry(ValueParam arg)
	{
		arg.task = this;
		arg.option = COUNTRY;
		addToArglist(COUNTRY, arg);
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
		output.add("-certificate");
		
		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();

		for (String o : _options.keySet())
		{
			output = buildADTCommand(o, output);
		}
		
		output.add(_args.get(STORETYPE).get(0).toString());
		output.add(_args.get(KEYSTORE).get(0).toString());
		output.add(_args.get(KEYPASS).get(0).toString());
		
		if (_sdk != "")
		{
			ZarkovTargetsView.addTarget("adt", output, _sdk);
			CompilerWrapper.call("adt", "bat", output, this, _sdk);
			
			while (_exit != true)
			{
				cal = Calendar.getInstance();
				if (cal.getTimeInMillis() - starttime > 1000)
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
	
	protected ArrayList<String> buildADTCommand(String key, ArrayList<String> output)
	{
		CO co = (CO) _options.get(key);
		ArrayList<AbstractParam> val = _args.get(key);
		if (val != null)
		{
			if (!key.equals(STORETYPE) && !key.equals(KEYSTORE) && !key.equals(KEYPASS))
			{
				if (val.size() > 1)
				{
					for (int i = 0; i < val.size(); i++)
					{
						if (co.pluralize)
						{
							output.add("-" + key + "+=" + val.get(i));
						}
						else
						{
							output.add("-" + key + " " + val.get(i));
						}
					}
				}
				else
				{
					if (val.size() > 0)
					{
						if (co.equalize)
						{
							output.add("-" + key + "=" + val.get(0));
						}
						else
						{
							output.add("-" + key + " " + val.get(0));
						}
					}
				}
			}
		}
		
		return output;
	}
	
}
