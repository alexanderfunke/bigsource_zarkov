package de.bigsource.zarkov.wrapper;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.reader.InputReader;
import de.bigsource.zarkov.views.ZarkovMonitor;

public class HaxeWrapper
{
	public static ZarkovTask _task;
	private static ProcessBuilder _pb;
	private static Process _p;
	
	public HaxeWrapper()
	{
		
	}
	
	public static void call(String command, ZarkovTask parent, String basedir, String haxe)
	{
		
		_task = parent;
		
		try
		{
			
			ZarkovMonitor.addMessage("\n\n----------- COMMAND -----------");
			ZarkovMonitor.addMessage(command + "\n\n");
			ZarkovMonitor.addMessage("----------- OUTPUT -----------");
			
			ArrayList<String> calls = new ArrayList<String>();
			calls.add(haxe);
			
			File temp = File.createTempFile("zarkov", ".hxml", new File(basedir));
			
			BufferedWriter out = new BufferedWriter(new FileWriter(temp));
			out.write(command);
			out.flush();
			out.close();
			
			calls.add(temp.getAbsoluteFile().toString());
			
			_pb = new ProcessBuilder(calls);
			Map<String, String> env = _pb.environment();
			env.put("-Xms32m","");
			env.put("-Xmx256m","");
			_pb.directory(new File(basedir));
			_p = _pb.start();
			
			InputReader errReader = new InputReader(_p.getErrorStream(), _task);
			Thread errThread = new Thread(errReader);
			errThread.start();
			
			InputReader inReader = new InputReader(_p.getInputStream(), _task);
			Thread inThread = new Thread(inReader);
			inThread.start();
			
			int exitval = _p.waitFor();
			temp.delete();
			
			if (exitval != 0)
			{
				_task.callException();
			}
			
			_task.quit();
			
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		catch (InterruptedException e)
		{
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
