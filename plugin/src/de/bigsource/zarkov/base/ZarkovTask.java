package de.bigsource.zarkov.base;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.apache.tools.ant.Task;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.IResource;
import org.eclipse.core.resources.ResourcesPlugin;

import de.bigsource.zarkov.Settings;
import de.bigsource.zarkov.ant.nested.AbstractParam;
import de.bigsource.zarkov.ant.nested.DefineParam;
import de.bigsource.zarkov.ant.nested.PathAppendParam;
import de.bigsource.zarkov.ant.nested.ValueParam;

public class ZarkovTask extends Task
{
	public String _id;
	public boolean _exit = false;
	public boolean _error = false;
	public String _errormessage;
	public Calendar calendar;
	public long starttime;
	
	public String _basedir = "";
	
	protected int _max_execution_time = 60000;
	protected HashMap<String, ArrayList<AbstractParam>> _args = new HashMap<String, ArrayList<AbstractParam>>();
	protected HashMap<String, Object> _options = new HashMap<String, Object>();
	public long lasterror;
	
	public void setBasedir(String basedir)
	{
		_basedir = basedir;
	}
	
	public void setId(String id)
	{
		_id = id;
	}
	
	public void setMaxExecutionTime(int max_execution_time)
	{
		_max_execution_time = max_execution_time;
	}
	
	protected void addToArglist(String key, AbstractParam val)
	{
		if (_args.containsKey(key))
		{
			_args.get(key).add(val);
		}
		else
		{
			ArrayList<AbstractParam> arr = new ArrayList<AbstractParam>();
			arr.add(val);
			_args.put(key, arr);
		}
	}
	
	protected String buildCommand(String key)
	{
		String output = "";
		CO co = (CO) _options.get(key);
		ArrayList<AbstractParam> val = _args.get(key);
		if (val != null && key != "args")
		{
			if (val.size() > 1)
			{
				for (int i = 0; i < val.size(); i++)
				{
					if (co.pluralize)
					{
						output += "-" + key + "+=" + val.get(i);
					}
					else
					{
						output += "-" + key + " " + val.get(i);
					}
				}
			}
			else
			{
				if (val.size() > 0)
				{
					if (co.equalize)
					{
						if (val.get(0) instanceof PathAppendParam && val.get(0).append() || val.get(0) instanceof DefineParam && val.get(0).append() || val.get(0) instanceof ValueParam
								&& val.get(0).append())
						{
							output += "-" + key + "+=" + val.get(0);
						}
						else
						{
							output += "-" + key + "=" + val.get(0);
						}
					}
					else
					{
						if (val.get(0) instanceof PathAppendParam && val.get(0).append() || val.get(0) instanceof DefineParam && val.get(0).append() || val.get(0) instanceof ValueParam
								&& val.get(0).append())
						{
							output += "-" + key + "+=" + val.get(0);
						}
						else
						{
							output += "-" + key + " " + val.get(0);
						}
						
					}
					
				}
			}
		}
		if (val != null && key == "args")
		{
			if (val.size() > 1)
			{
				for (int i = 0; i < val.size(); i++)
				{
					output += " " + val.get(i);
				}
			}
			else
			{
				if (val.size() > 0)
				{
					output += " " + val.get(0);
				}
			}
		}
		
		return output;
	}
	
	protected ArrayList<String> buildCommand(String key, ArrayList<String> output)
	{
		CO co = (CO) _options.get(key);
		ArrayList<AbstractParam> val = _args.get(key);
		if (val != null && key != "args")
		{
			if (val.size() > 1)
			{
				for (int i = 0; i < val.size(); i++)
				{
					if (co.pluralize)
					{
						output.add("-" + key + "+=" + val.get(i));
					}
					else
					{
						output.add("-" + key + " " + val.get(i));
					}
				}
			}
			else
			{
				if (val.size() > 0)
				{
					if (co.equalize)
					{
						if (val.get(0) instanceof PathAppendParam && val.get(0).append() || val.get(0) instanceof DefineParam && val.get(0).append() || val.get(0) instanceof ValueParam
								&& val.get(0).append())
						{
							output.add("-" + key + "+=" + val.get(0));
						}
						else
						{
							output.add("-" + key + "=" + val.get(0));
						}
					}
					else
					{
						if (val.get(0) instanceof PathAppendParam && val.get(0).append() || val.get(0) instanceof DefineParam && val.get(0).append() || val.get(0) instanceof ValueParam
								&& val.get(0).append())
						{
							output.add("-" + key + "+=" + val.get(0));
						}
						else
						{
							output.add("-" + key + " " + val.get(0));
						}
						
					}
					
				}
			}
		}
		if (val != null && key == "args")
		{
			if (val.size() > 1)
			{
				for (int i = 0; i < val.size(); i++)
				{
					output.add(val.get(i).toString());
				}
			}
			else
			{
				if (val.size() > 0)
				{
					output.add(val.get(0).toString());
				}
			}
		}
		
		return output;
	}
	
	public void callException()
	{
		_error = true;
		_exit = true;
	}
	
	public void callException(String message)
	{
		addMessage(message);
		_errormessage = message;
		_error = true;
		_exit = true;
	}
	
	public void quit()
	{
		_exit = true;
	}
	
	public void addMessage(String msg)
	{
		System.out.println(msg);
	}
	
	public void wait1Second()
	{
		if (Settings.enviroment == Settings.ENV_PLUGIN)
		{
			try
			{
				this.wait(1000);
			}
			catch (InterruptedException e)
			{
				
				// e.printStackTrace();
			}
		}
	}
	
	public IProject getActiveProject(String filename)
	{
		IProject activeProject = null;
		IProject[] projects = ResourcesPlugin.getWorkspace().getRoot().getProjects();
		for (int i = 0; i < projects.length; i++)
		{
			IProject project = projects[i];
			try
			{
				if (filename != null && project != null && project.getRawLocation() != null && filename.contains(project.getRawLocation().toString()))
				{
					activeProject = project;
				}
			}
			catch (Exception e)
			{
			}
		}
		return activeProject;
	}
	
	public IResource getFile(String filename)
	{
		IProject activeProject = getActiveProject(filename);
		if (activeProject != null)
		{
			return activeProject.getFile(filename.replace(activeProject.getRawLocation().toString(), ""));
		}
		else
		{
			addMessage("No active Project found for " + filename + "!");
			if (_basedir.startsWith("."))
			{
				addMessage("Please specify an absolute path for basedir!");
			}
			return null;
		}
	}
}
