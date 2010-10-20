package de.bigsource.zarkov.ant;

import java.io.File;
import java.io.IOException;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

import de.bigsource.zarkov.Settings;
import de.bigsource.zarkov.translations.TranslationUtil;

public class Browser extends Task
{
	private String _url = "";
	private String _basedir = "";
	private String _browser = "";
	private Boolean _enabledInStandalone = false;
	
	public void setURL(String url)
	{
		_url = url;
	}
	
	public void setBasedir(String basedir)
	{
		_basedir = basedir;
	}
	
	public void setBrowser(String browser)
	{
		_browser = browser;
	}
	
	public void setEnableInStandalone(Boolean enableInStandalone)
	{
		_enabledInStandalone = enableInStandalone;
	}
	
	public void execute() throws BuildException
	{
		
		if (Settings.enviroment == Settings.ENV_PLUGIN || Settings.enviroment == Settings.ENV_STANDALONE && _enabledInStandalone)
		{
			try
			{
				
				String osName = System.getProperty("os.name");
				
				if (_basedir == "" && !_url.startsWith("http://") && !_url.startsWith("https://") && !_url.startsWith("file://"))
				{
					throw new BuildException(TranslationUtil.getTranslation("general.basedir_not_set"));
				}
				
				if (_url == "")
				{
					throw new BuildException(TranslationUtil.getTranslation("browser.url_not_set"));
				}
				
				if (!_url.startsWith("http://") && !_url.startsWith("https://") && !_url.startsWith("file://"))
				{
					_url = _basedir + "/" + _url;
					File page = new File(_url);
					if (!page.exists())
					{
						throw new BuildException(TranslationUtil.getTranslation("browser.url_not_found").replace("{#URL#}", _url));
					}
				}
				
				if (osName.contains("Windows"))
				{
					if (_browser == "")
					{
						throw new BuildException(TranslationUtil.getTranslation("browser.executable_not_set"));
					}
					
					File executable = new File(_browser);
					if (!executable.exists())
					{
						throw new BuildException(TranslationUtil.getTranslation("browser.executable_not_set").replace("{#BROWSER#}", _browser));
					}
					
					Runtime.getRuntime().exec(new String[]
					{ _browser, _url });
				}
				else if (osName.contains("Mac"))
				{
					Runtime.getRuntime().exec(new String[]
					{ "/usr/bin/open", _url });
				}
				else if (osName.contains("Linux"))
				{
					Runtime.getRuntime().exec(new String[]
					{ "open", _url });
				}
				
			}
			catch (IOException e)
			{
			}
		}
		else
		{
			System.out.println(TranslationUtil.getTranslation("browser.deactivated"));
		}
	}
	
}
