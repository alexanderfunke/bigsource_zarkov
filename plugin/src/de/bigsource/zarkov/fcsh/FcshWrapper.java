package de.bigsource.zarkov.fcsh;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import de.bigsource.zarkov.Settings;
import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.views.ZarkovMonitor;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.CompilerWrapper;

public class FcshWrapper
{
	public static HashMap<String, FcshThread> _threads;
	public static ZarkovTask _task;

	public FcshWrapper()
	{

	}

	public static void compile(String option, ArrayList<String> command, ZarkovTask parent, String version)
	{
		if (_threads == null)
		{
			_threads = new HashMap<String, FcshThread>();
		}

		if (Settings.enviroment != Settings.ENV_PLUGIN)
		{
			CompilerWrapper.call(option, "exe", command, parent, version);
			return;
		} else
		{
			if (Targets.targetExists(option + command, version))
			{
				int targetid = Targets.getTarget(option + command, version);
				compileTarget((targetid + 1), parent, version);
				return;	
			}
		}

		try
		{
			Targets.addTarget(option + command, version);
			ZarkovTargetsView.addTarget(option, command, version);
			
			_task = parent;

			if (_threads.get(version) == null)
			{
				setThread(version);
			}

			for (int i = 0; i < command.size(); i++)
			{
				option += " " + command.get(i);
			}

			ZarkovMonitor.addMessage("\n\n----------- COMMAND -----------");
			ZarkovMonitor.addMessage(option + "\n\n");
			ZarkovMonitor.addMessage("----------- OUTPUT -----------");

			_threads.get(version).call(option, parent._id);
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public static void compileTarget(int target, ZarkovTask parent, String sdk)
	{
		if (_threads == null)
		{
			_threads = new HashMap<String, FcshThread>();
		}

		try
		{
			_task = parent;

			if (_threads.get(sdk) == null)
			{
				setThread(sdk);
			}
			ZarkovMonitor.addMessage("\n\n----------- COMMAND -----------");
			ZarkovMonitor.addMessage("compile " + target + "\n\n");
			ZarkovMonitor.addMessage("----------- OUTPUT -----------");
			_threads.get(sdk).call("compile " + target, parent._id);
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public static void quit(String sdk)
	{
		if (_threads == null)
		{
			_threads = new HashMap<String, FcshThread>();
		}
		try
		{
			Targets.clearTargets(sdk);
			if (_threads.get(sdk) != null)
			{
				ZarkovMonitor.addMessage("----------- FCSH of SDK " + sdk + " stopped! -----------");
				_threads.get(sdk).call("quit\n", "");
			}
			setThread(sdk);
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private static void setThread(String sdk)
	{
		ZarkovMonitor.addMessage("------------ FCSH of SDK " + sdk + " started!------------\n");
		_threads.put(sdk, new FcshThread(sdk));
		_threads.get(sdk).start();
	}

	public static ZarkovTask getTask()
	{
		return _task;
	}

	public static void quitall()
	{
		for (String name : _threads.keySet())
		{
			quit(name);
		}
	}
}
