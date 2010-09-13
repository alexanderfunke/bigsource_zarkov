package de.bigsource.zarkov.ant;

import java.io.File;
import java.io.IOException;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

import de.bigsource.zarkov.Settings;
import de.bigsource.zarkov.base.ZarkovUtil;

public class FlashPlayer extends Task
{
	private String _swf = "";
	private String _basedir = "";
	private String _player = "";
	private Boolean _enabledInStandalone = false;
	
	public void setSwf(String swf)
	{
		_swf = swf;
	}
	
	public void setBasedir(String basedir)
	{
		_basedir = basedir;
	}
	
	public void setPlayer(String player)
	{
		_player = player;
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
				if (_basedir == "")
				{
					throw new BuildException(ZarkovUtil.getTranslation("general.basedir_not_set"));
				}
				
				if (_swf == "")
				{
					throw new BuildException(ZarkovUtil.getTranslation("flashplayer.swf_not_set"));
				}
				
				if (_player == "")
				{
					throw new BuildException(ZarkovUtil.getTranslation("flashplayer.executable_not_set"));
				}
				
				File executable = new File(_player);
				if (!executable.exists())
				{
					throw new BuildException(ZarkovUtil.getTranslation("flashplayer.swf_not_set"));
				}
				
				File swfPath = new File(_basedir + "/" + _swf);
				if (!swfPath.exists())
				{
					throw new BuildException(ZarkovUtil.getTranslation("flashplayer.executable_not_found").replace("{#PATH#}", _basedir + "/" + _swf));
				}
				
				String[] parameters = new String[]
				{};
				
				if (osName.contains("Windows"))
				{
					parameters = new String[]
					{ _player, _basedir + "/" + _swf };
				}
				else if (osName.contains("Mac"))
				{
					parameters = new String[]
					{ "/usr/bin/open", "-a", _player, _basedir + "/" + _swf };
					
				}
				else if (osName.contains("Linux"))
				{
					parameters = new String[]
					{ "open", _player, _basedir + "/" + _swf };
				}
				
				Runtime.getRuntime().exec(parameters);
				
			}
			catch (IOException e)
			{
			}
		}
		else
		{
			System.out.println(ZarkovUtil.getTranslation("flashplayer.deactivated"));
		}
	}
	
}
