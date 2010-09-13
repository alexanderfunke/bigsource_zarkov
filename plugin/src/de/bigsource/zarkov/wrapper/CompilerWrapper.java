package de.bigsource.zarkov.wrapper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.ZarkovUtil;
import de.bigsource.zarkov.views.ZarkovMonitor;

public class CompilerWrapper
{
	public static ZarkovTask _task;
	private static Process _p;
	public static String NAME;
	public static String WIN_SUFFIX;
	
	public CompilerWrapper()
	{
		
	}
	
	public static void call(String executable, String suffix, ArrayList<String> command, ZarkovTask parent, String sdk)
	{
		
		_task = parent;
		Calendar cal = Calendar.getInstance();
		getTask().lasterror = cal.getTimeInMillis() + 60000;
		try
		{
			
			_p = ZarkovUtil.callCommand(ZarkovUtil.getExecutable(sdk, executable, suffix), command, ZarkovUtil.BUILDTYPE_SUBITEMS);
			
			ZarkovUtil.logCommand(command);
			
			ZarkovUtil.addReader(_p.getErrorStream(), _task);
			ZarkovUtil.addReader(_p.getInputStream(), _task);
			
			int exitval = _p.waitFor();
			if (exitval != 0)
			{
				_task.wait1Second();
				_task.callException();
			}
			_task.quit();
			
		}
		catch (IOException e)
		{
			ZarkovMonitor.addMessage(executable + " was not found.");
		}
		catch (InterruptedException e)
		{
			ZarkovMonitor.addMessage(executable + " was interrupted.");
		}
		
	}
	
	public static void quit()
	{
		_p.destroy();
	}
	
	public static ZarkovTask getTask()
	{
		return _task;
	}
	
}
