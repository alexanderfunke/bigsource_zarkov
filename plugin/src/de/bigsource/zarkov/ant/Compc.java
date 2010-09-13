package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.BooleanParam;
import de.bigsource.zarkov.ant.nested.NameParam;
import de.bigsource.zarkov.ant.nested.NamePathParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.FlexStandardTask;
import de.bigsource.zarkov.base.TranslationUtil;
import de.bigsource.zarkov.fcsh.FcshWrapper;

public class Compc extends FlexStandardTask
{

	public Compc()
	{
		super();
		_options.put("compute-digest", new CO(true, false));
		_options.put("directory", new CO(true, false));
		_options.put("dump-config", new CO(false, false));
		_options.put("include-classes", new CO(false, true));
		_options.put("include-file", new CO(false, false));
		_options.put("include-lookup-only", new CO(true, false));
		_options.put("include-namespaces", new CO(false, true));
		_options.put("include-sources", new CO(false, false));
		_options.put("include-stylesheet", new CO(false, true));

	}

	/*
	 * compute-digest
	 */

	public void addConfiguredCompute_digest(BooleanParam arg)
	{
		addToArglist("compute-digest", arg);
	}

	/*
	 * directory
	 */

	public void addConfiguredDirectory(BooleanParam arg)
	{
		addToArglist("directory", arg);
	}

	/*
	 * dump-config
	 */

	public void addConfiguredDump_config(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "dump_config";
		addToArglist("dump-config", arg);
	}

	/*
	 * include-classes
	 */

	public void addConfiguredInclude_classes(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "include_classes";
		addToArglist("include-classes", arg);
	}

	/*
	 * include-file
	 */

	public void addConfiguredInclude_file(NamePathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "include_file";
		addToArglist("include-file", arg);
	}

	/*
	 * include-lookup-only
	 */

	public void addConfiguredInclude_lookup_only(BooleanParam arg)
	{
		addToArglist("include-lookup-only", arg);
	}

	/*
	 * include-namespaces
	 */

	public void addConfiguredInclude_namespaces(NameParam arg)
	{
		arg.task = this;
		arg.option = "include_namespaces";
		addToArglist("include-namespaces", arg);
	}

	/*
	 * include-sources
	 */

	public void addConfiguredInclude_sources(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "include_sources";
		addToArglist("include-sources", arg);
	}

	/*
	 * include-stylesheet
	 */

	public void addConfiguredInclude_stylesheet(NamePathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "include_stylesheet";
		addToArglist("include-stylesheet", arg);
	}

	public void execute() throws BuildException
	{

		ArrayList<String> output = new ArrayList<String>();

		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();

		for (String o : _options.keySet())
		{
			output = buildCommand(o, output);
		}

		// Call FCSH

		checkPreconditions();

		FcshWrapper.compile("compc", output, this, _sdk);

		while (_exit != true)
		{
			cal = Calendar.getInstance();
			if (cal.getTimeInMillis() - starttime > _max_execution_time)
			{
				throw new BuildException(TranslationUtil.getTranslation("general.max_execution_time"));
			}
		}

		onlyFirstError(onlyFirstError, lasterror);
		checkError(_error, _errormessage);

	}

}
