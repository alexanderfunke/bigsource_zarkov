package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.BooleanParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.EclipseUtil;
import de.bigsource.zarkov.base.FlexStandardTask;
import de.bigsource.zarkov.fcsh.FcshWrapper;
import de.bigsource.zarkov.translations.TranslationUtil;

public class Mxmlc extends FlexStandardTask
{

	public Mxmlc()
	{

		super();
		_options.put("dump-config", new CO(false, false));
		_options.put("generate-frame-loader", new CO(true, false));
		_options.put("file-specs", new CO(true, false));
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
	 * generate-frame-loader
	 */

	public void addConfiguredGenerate_frame_loader(BooleanParam arg)
	{
		addToArglist("generate-frame-loader", arg);
	}

	/*
	 * file-specs
	 */

	public void addConfiguredFile_specs(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "file_specs";
		addToArglist("file-specs", arg);
	}

	public void execute() throws BuildException
	{
		EclipseUtil.clearProjectProblems();

		checkPreconditions();

		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();
		
		if (_args.get("file-specs") == null)
		{
			throw new BuildException(TranslationUtil.getTranslation("general.specify_file_specs"));
		}

		ArrayList<String> output = new ArrayList<String>();
		for (String o : _options.keySet())
		{
			output = buildCommand(o, output);
		}

		FcshWrapper.compile("mxmlc", output, this, _sdk);

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
