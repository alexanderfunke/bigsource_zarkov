package de.bigsource.zarkov.wrapper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.reader.InputReader;
import de.bigsource.zarkov.views.ZarkovMonitor;

public class AdlWrapper
{
	public static ZarkovTask _task;
	private static Process _p;
	private static ProcessBuilder _pb;
	
	public AdlWrapper()
	{
		
	}
	
	public static void call(String command, ZarkovTask parent, String sdk)
	{
		
		_task = parent;
		
		try
		{
			
			ZarkovMonitor.addMessage("\n\n----------- COMMAND -----------");
			ZarkovMonitor.addMessage(command + "\n\n");
			ZarkovMonitor.addMessage("----------- OUTPUT -----------");
			
			ArrayList<String> calls = new ArrayList<String>();
			String osName = System.getProperty("os.name");
			
			if (osName.contains("Windows"))
			{
				calls.add(sdk + "\\bin\\adl.exe");
			}
			
			if (osName.contains("Mac") || osName.contains("Linux"))
			{
				calls.add(sdk + "/bin/adl");
			}
			
			String[] commandlist = command.split(" ");
			for (int i = 1; i < commandlist.length; i++)
			{
				calls.add(commandlist[i]);
			}
			
			_pb = new ProcessBuilder(calls);
			Map<String, String> env = _pb.environment();
			env.put("-Xms32m","");
			env.put("-Xmx256m","");
			_p = _pb.start();
			
			InputReader errReader = new InputReader(_p.getErrorStream(), _task);
			Thread errThread = new Thread(errReader);
			errThread.start();
			
			InputReader inReader = new InputReader(_p.getInputStream(), _task);
			Thread inThread = new Thread(inReader);
			inThread.start();
			
			int exitval = _p.waitFor();
			if (exitval != 0)
			{
				_task.callException();
			}
			_task.quit();
			
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
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
