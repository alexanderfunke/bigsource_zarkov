package de.bigsource.zarkov.fcsh;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.core.resources.IMarker;
import org.eclipse.core.resources.IResource;

import de.bigsource.zarkov.views.ZarkovMonitor;

public class FcshInputReader implements Runnable
{
	private BufferedReader _input;
	private String _type;
	public long lasterror;
	
	public FcshInputReader(InputStream is, String type)
	{
		_input = new BufferedReader(new InputStreamReader(is));
		_type = type;
	}
	
	public void run()
	{
		try
		{
			String line;
			
			while ((line = _input.readLine()) != null)
			{
				line = line.replace("(fcsh) (fcsh)", "");
				if (FcshWrapper.getTask() != null)
				{
					if (_type == "Error")
					{
						
						if (line.toLowerCase().endsWith("java heap)"))
						{
							FcshWrapper.quitall();
							FcshWrapper.getTask().callException("FCSH quit! Will start again at next compilation!");
						}
						else
						{
							
							if (line.contains("Fejl:") ||
							line.contains("\u932f\u8aa4:") ||
							line.contains("\u9519\u8bef:") ||
							line.contains("Fel:") ||
							line.contains("\u041e\u0448\u0438\u0431\u043a\u0430:") ||
							line.contains("Erro:") ||
							line.contains("Fout:") ||
							line.contains("Feil:") ||
							line.contains("\uc624\ub958:") ||
							line.contains("\u30a8\u30e9\u30fc:") ||
							line.contains("Errore:") ||
							line.contains("Erreur:") ||
							line.contains("Virhe:") ||
							line.contains("Error:") ||
							line.contains("Fehler:"))
							{
								
								Pattern p = Pattern.compile("([\\d\\D]*)\\((\\d+)\\): col: (\\d+) ([\\d\\D]*)");
								Matcher matcher = p.matcher(line);
								if (matcher.matches())
								{
									IResource res = FcshWrapper.getTask().getFile(matcher.group(1));
									if (res != null)
									{
										IMarker marker = res.createMarker(IMarker.PROBLEM);
										marker.setAttribute("folder", matcher.group(1));
										marker.setAttribute(IMarker.SEVERITY, IMarker.SEVERITY_ERROR);
										marker.setAttribute(IMarker.LOCATION, "Line: " + matcher.group(2));
										marker.setAttribute(IMarker.LINE_NUMBER, new Integer(matcher.group(2)));
										marker.setAttribute(IMarker.CHAR_START, new Integer(matcher.group(3)));
										marker.setAttribute(IMarker.MESSAGE, matcher.group(4).replace("Error: ", ""));
										marker.setAttribute("bigsource", true);
									}
								}
								FcshWrapper.getTask().callException();
								Calendar cal = Calendar.getInstance();
								FcshWrapper.getTask().lasterror = cal.getTimeInMillis();
							}
							else if (line.toLowerCase().contains("warning"))
							{
								Pattern p = Pattern.compile("([\\d\\D]*)\\((\\d+)\\): col: (\\d+) ([\\d\\D]*)");
								Matcher matcher = p.matcher(line);
								if (matcher.matches())
								{
									IResource res = FcshWrapper.getTask().getFile(matcher.group(1));
									if (res != null)
									{
										IMarker marker = res.createMarker(IMarker.PROBLEM);
										marker.setAttribute("folder", matcher.group(1));
										marker.setAttribute(IMarker.SEVERITY, IMarker.SEVERITY_WARNING);
										marker.setAttribute(IMarker.LOCATION, "Line: " + matcher.group(2));
										marker.setAttribute(IMarker.LINE_NUMBER, matcher.group(2));
										marker.setAttribute(IMarker.CHAR_START, matcher.group(3));
										marker.setAttribute(IMarker.MESSAGE, matcher.group(4).replace("Warning: ", ""));
										marker.setAttribute("bigsource", true);
									}
								}
							}
						}
						
					}
					
					if (_type == "Input" && (line.toLowerCase().endsWith("bytes)") || line.toLowerCase().endsWith("byte)")))
					{
						Calendar cal = Calendar.getInstance();
						FcshWrapper.getTask().lasterror = cal.getTimeInMillis();
						FcshWrapper.getTask().quit();
					}
					
					if (line.toLowerCase().endsWith("default arguments may not be interspersed with other options"))
					{
						FcshWrapper.getTask().callException("You have spaces in one of your options. FCSH and the other Flex Compiler can't use spaces.\n\n");
					}
					
					FcshWrapper.getTask().addMessage(line);
				}
				ZarkovMonitor.addMessage(line);
			}
			
		}
		catch (Throwable t)
		{
			
		}
	}
}