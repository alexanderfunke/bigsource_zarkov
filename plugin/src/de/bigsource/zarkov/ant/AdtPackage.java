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

public class AdtPackage extends AbstractAdt
{
	
	
	public String _sdk = "";
	
	public AdtPackage()
	{
		
		_options.put(STORETYPE, new CO(false, false));
		_options.put(KEYSTORE, new CO(false, false));
		_options.put(AIR_FILE, new CO(false, false));
		_options.put(APP_XML, new CO(false, false));
		_options.put(ADD_FILE, new CO(false, false));
		_options.put(ADD_DIR, new CO(false, false));
		_options.put(STOREPASS, new CO(false, false));
		_options.put(ROOTPATH, new CO(false, false));
		_options.put(ALIAS, new CO(false, false));
		_options.put(PROVIDERNAME, new CO(false, false));
		_options.put(TSA, new CO(false, false));
		_options.put(AIRTARGET, new CO(false, false));
		
		
	}
	
	public void setSDK(String sdk)
	{
		_sdk = sdk;
	}
	
	public void addConfiguredAir_file(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = AIR_FILE;
		addToArglist(AIR_FILE, arg);
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
	
	public void addConfiguredStoretype(ValueParam arg)
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
	
	public void addConfiguredStorepass(ValueParam arg)
	{
		arg.task = this;
		arg.option = STOREPASS;
		addToArglist(STOREPASS, arg);
	}
	
	public void addConfiguredRootpath(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = ROOTPATH;
		addToArglist(ROOTPATH, arg);
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
	
	public void addConfiguredAirtarget(ValueParam arg) 
	{
		arg.task = this;
		arg.option = AIRTARGET;
		addToArglist(AIRTARGET, arg);
	}
	
	public void execute() throws BuildException
	{
		
		calendar = Calendar.getInstance();
		starttime = calendar.getTimeInMillis();
		
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
		
		ArrayList<String> command = new ArrayList<String>();
		
		//Prefix
		command.add("-package");
		
		//Store Type
		if (_args.get(STORETYPE) != null)
		{
			command.add("-" + STORETYPE + " " + _args.get(STORETYPE).get(0));
		}
		
		//Key Type
		if (_args.get(KEYSTORE) != null)
		{
			command.add("-" + KEYSTORE + " " + _args.get(KEYSTORE).get(0));
		}
		
		//Store Pass
		if (_args.get(STOREPASS) != null)
		{
			command.add("-" + STOREPASS + " " + _args.get(STOREPASS).get(0));
		}
		
		//Airtarget
		if (_args.get(AIRTARGET) != null)
		{
			command.add("-" + AIRTARGET + " " + _args.get(AIRTARGET).get(0));
		}
		
		//Air File
		command.add(_args.get(AIR_FILE).get(0).toString());
		
		//App XML
		command.add(_args.get(APP_XML).get(0).toString());
		
		//Root Path
		command.add("-C");
		command.add(_args.get(ROOTPATH).get(0).toString());
		
		//Files
		if (_args.get(ADD_FILE) != null)
		{
			val = _args.get(ADD_FILE);
			for (int i = 0; i < val.size(); i++)
			{
				command.add(val.get(i).toString());
			}
		}
		
		//Directories
		if (_args.get(ADD_DIR) != null)
		{
			val = _args.get(ADD_DIR);
			for (int i = 0; i < val.size(); i++)
			{
				command.add(val.get(i).toString());
			}
		}
		
		if (_sdk != "")
		{
			ZarkovTargetsView.addTarget("adt", command, _sdk);
			CompilerWrapper.call("adt", "bat", command, this, _sdk);
			
			while (_exit != true)
			{
				calendar = Calendar.getInstance();
				if (calendar.getTimeInMillis() - starttime > _max_execution_time)
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
