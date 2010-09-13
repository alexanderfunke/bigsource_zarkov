package de.bigsource.zarkov.fcsh;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Calendar;
import java.util.Map;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.views.ZarkovMonitor;

public class FcshThread extends Thread
{
	
	private BufferedWriter _output = null;
	private ProcessBuilder _pb = null;
	private Process _p = null;
	private String _sdk = "";
	
	public FcshThread(String sdk)
	{
		try
		{
			_sdk = sdk;
			String osName = System.getProperty("os.name");
			
			if (osName.contains("Windows"))
			{
				_pb = new ProcessBuilder(_sdk + "\\bin\\fcsh.exe");
			}
			if (osName.contains("Mac") || osName.contains("Linux"))
			{
				_pb = new ProcessBuilder(_sdk + "/bin/fcsh");
			}
			
			if (_pb != null)
			{
				Map<String, String> env = _pb.environment();
				env.put("-Xms32m","");
				env.put("-Xmx256m","");
				_p = _pb.start();
				_output = new BufferedWriter(new OutputStreamWriter(_p.getOutputStream()));
				
				FcshInputReader errReader = new FcshInputReader(_p.getErrorStream(), "Error");
				Thread errThread = new Thread(errReader);
				errThread.start();
				
				FcshInputReader inReader = new FcshInputReader(_p.getInputStream(), "Input");
				Thread inThread = new Thread(inReader);
				inThread.start();
			}
			
		}
		catch (IOException e)
		{
			throw new BuildException("FCSH not found. Please check the sdk path. It should be set to the basedir of the sdk, not the bin folder.");
		}
	}
	
	public void run()
	{
		
	}
	
	public void call(String command, String id) throws IOException
	{
		if (_output != null)
		{
			Calendar cal = Calendar.getInstance();
			FcshWrapper.getTask().lasterror = cal.getTimeInMillis() + 60000;
			_output.write(command + "\n\n\n");
			_output.flush();
		}
	}
	
	public void addMessage(String msg)
	{
		ZarkovMonitor.addMessage(msg);
	}
	
}
