package de.bigsource.zarkov.wrapper;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.reader.InputReader;
import de.bigsource.zarkov.views.ZarkovMonitor;

public class ApparatWrapper
{
	public static ZarkovTask _task;
	private static ProcessBuilder _pb;
	private static Process _p;
	
	public ApparatWrapper()
	{
		
	}
	
	public static void call(ArrayList<String> command, ZarkovTask parent, String scala, String reducer, String apparatPart)
	{
		
		_task = parent;
		
		try
		{
			
			String options = "";
			for (int i = 0; i < command.size(); i++)
			{
				options += " " + command.get(i);
			}
			ZarkovMonitor.addMessage("\n\n----------- COMMAND -----------");
			ZarkovMonitor.addMessage(options + "\n\n");
			ZarkovMonitor.addMessage("----------- OUTPUT -----------");
			
			ArrayList<String> calls = new ArrayList<String>();
			calls.add(scala);
			calls.add("-cp");
			calls.add("apparat.jar");
			calls.add(apparatPart);
			
			for (int i = 0; i < command.size(); i++)
			{
				String[] suboption = (String[]) command.get(i).split(" ");
				calls.add(suboption[0]);
				if (suboption.length > 1 && suboption[1] != null)
				{
					calls.add(suboption[1]);
				}
			}
			
			_pb = new ProcessBuilder(calls);
			
			_pb.directory(new File(reducer));
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
