package de.bigsource.zarkov.wrapper;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.reader.InputReader;
import de.bigsource.zarkov.translations.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovMonitor;

public class CompilerWrapper
{
	public static ZarkovTask _task;
	private static Process _p;
	
	public static final int BUILDTYPE_STANDARD = 0;
	public static final int BUILDTYPE_SUBITEMS = 1;
	
	public CompilerWrapper()
	{
		
	}
	
	public static void call(String executable, String suffix, ArrayList<String> command, ZarkovTask parent, String sdk)
	{
		//Fallback if not catched by ant task
		File execFile = new File(getExecutable(sdk, executable, suffix));
		if (!execFile.exists())
		{
			throw new BuildException(TranslationUtil.getTranslation("general.executable_not_found"));
		}
		
		_task = parent;
		Calendar cal = Calendar.getInstance();
		getTask().lasterror = cal.getTimeInMillis() + 60000;
		try
		{
			
			_p = callCommand(getExecutable(sdk, executable, suffix), command, BUILDTYPE_SUBITEMS);
			
			logCommand(command);
			
			addReader(_p.getErrorStream(), _task);
			addReader(_p.getInputStream(), _task);
			
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
	
	public static String getExecutable(String sdk, String name, String suffix)
	{
		if (suffix != null)
		{
			String osName = System.getProperty("os.name");
			if (osName.contains("Windows"))
			{
				return sdk + "\\bin\\" + name + "." + suffix;
			}

			if (osName.contains("Mac") || osName.contains("Linux"))
			{
				return sdk + "/bin/" + name;
			}
		} else
		{
			return name;
		}
		return "";
	}
	
	public static Process callCommand(String executable, ArrayList<String> command, int buildtype) throws IOException
	{
		ArrayList<String> calls = new ArrayList<String>();
		calls.add(executable);

		switch (buildtype)
		{
			case BUILDTYPE_STANDARD:

				break;
			case BUILDTYPE_SUBITEMS:
				for (int i = 0; i < command.size(); i++)
				{
					String[] suboption = (String[]) command.get(i).split(" ");
					calls.add(suboption[0]);
					if (suboption.length > 2 && suboption[1] != null)
					{
						calls.add(suboption[1]);
						calls.add(suboption[2]);
					} else if (suboption.length > 1 && suboption[1] != null)
					{
						calls.add(suboption[1]);
					}
				}
				break;
			default:
				break;
		}

		ProcessBuilder pb = new ProcessBuilder(calls);
		Map<String, String> env = pb.environment();
		env.put("-Xms32m", "");
		env.put("-Xmx256m", "");

		return pb.start();
	}
	
	public static void logCommand(ArrayList<String> command)
	{
		ZarkovMonitor.addMessage("\n\n----------- COMMAND -----------");
		ZarkovMonitor.addMessage(join(command, " ") + "\n\n");
		ZarkovMonitor.addMessage("----------- OUTPUT -----------");
	}

	private static String join(AbstractCollection<String> s, String delimiter)
	{
		if (s == null || s.isEmpty())
			return "";
		Iterator<String> iter = s.iterator();
		StringBuilder builder = new StringBuilder(iter.next());
		while (iter.hasNext())
		{
			builder.append(delimiter).append(iter.next());
		}
		return builder.toString();
	}
	
	public static void addReader(InputStream stream, ZarkovTask task)
	{
		InputReader errReader = new InputReader(stream, task);
		Thread errThread = new Thread(errReader);
		errThread.start();
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
