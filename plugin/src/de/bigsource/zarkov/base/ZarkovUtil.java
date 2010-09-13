package de.bigsource.zarkov.base;

import java.io.IOException;
import java.io.InputStream;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.reader.InputReader;
import de.bigsource.zarkov.views.ZarkovMonitor;

public class ZarkovUtil
{

	public static final int BUILDTYPE_STANDARD = 0;
	public static final int BUILDTYPE_SUBITEMS = 1;

	private static ResourceBundle resourceBundle;

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

	public static String join(AbstractCollection<String> s, String delimiter)
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

	public static String getTranslation(String key)
	{
		if (resourceBundle == null)
		{
			resourceBundle = ResourceBundle.getBundle("Zarkov",Locale.getDefault());
		}
		return resourceBundle.getString(key);
	}

	public static void checkError(boolean error, String errormessage)
	{
		if (error == true)
		{
			if (errormessage != null)
			{
				throw new BuildException(errormessage);
			} else
			{
				throw new BuildException(ZarkovUtil.getTranslation("general.compiler_had_error"));
			}
		}

	}

	public static void onlyFirstError(boolean onlyFirstError, long lasterror)
	{
		if (!onlyFirstError)
		{
			Calendar calnow = Calendar.getInstance();
			lasterror = calnow.getTimeInMillis();
			while ((lasterror + 800) > calnow.getTimeInMillis())
			{
				calnow = Calendar.getInstance();
			}
		}
	}
}
