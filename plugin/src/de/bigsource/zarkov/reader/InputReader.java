package de.bigsource.zarkov.reader;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.views.ZarkovMonitor;

public class InputReader implements Runnable
{
    private BufferedReader _input;
    private ZarkovTask _task;

    public InputReader(InputStream is, ZarkovTask task)
    {
	_input = new BufferedReader(new InputStreamReader(is));
	_task = task;
    }

    public void run()
    {
	try
	{
	    String line;

	    while ((line = _input.readLine()) != null)
	    {
		ZarkovMonitor.addMessage(line);
		if (_task != null)
		{
		    _task.addMessage(line);
		}

	    }
	}
	catch (Throwable t)
	{
		
	}

    }
}
