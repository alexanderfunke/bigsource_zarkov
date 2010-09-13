package de.bigsource.zarkov.ant;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.tools.ant.BuildException;

import de.bigsource.zarkov.ant.nested.BooleanParam;
import de.bigsource.zarkov.ant.nested.IntegerParam;
import de.bigsource.zarkov.ant.nested.NameDescriptionParam;
import de.bigsource.zarkov.ant.nested.NamespaceParam;
import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.ant.nested.ValueParam;
import de.bigsource.zarkov.base.CO;
import de.bigsource.zarkov.base.FlexStandardTask;
import de.bigsource.zarkov.base.TranslationUtil;
import de.bigsource.zarkov.views.ZarkovTargetsView;
import de.bigsource.zarkov.wrapper.CompilerWrapper;

public class AsDoc extends FlexStandardTask
{
	
	public AsDoc()
	{
		super();
		_options.put("doc-classes", new CO(true, false));
		_options.put("doc-namespaces", new CO(true, false));
		_options.put("doc-sources", new CO(true, false));
		_options.put("exclude-classes", new CO(true, false));
		_options.put("exclude-dependencies", new CO(true, false));
		_options.put("footer", new CO(true, false));
		_options.put("include-lookup-only", new CO(true, false));
		_options.put("left-frameset-width", new CO(false, false));
		_options.put("main-title", new CO(true, false));
		_options.put("packages.package", new CO(false, false));
		_options.put("templates-path", new CO(true, false));
		_options.put("window-title", new CO(true, false));
		
	}
	
	/*
	 * doc-classes
	 */

	public void addConfiguredDoc_classes(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "doc-classes";
		addToArglist("doc-classes", arg);
	}
	
	/*
	 * doc-namespaces
	 */

	public void addConfiguredDoc_namespaces(NamespaceParam arg)
	{
		arg.basedir = _basedir;
		addToArglist("doc-namespaces", arg);
	}
	
	/*
	 * doc-sources
	 */

	public void addConfiguredDoc_sources(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "doc-sources";
		addToArglist("doc-sources", arg);
	}
	
	/*
	 * exclude-classes
	 */

	public void addConfiguredExclude_classes(ValueParam arg)
	{
		arg.task = this;
		arg.option = "exclude-classes";
		addToArglist("exclude-classes", arg);
	}
	
	/*
	 * exclude-dependencies
	 */

	public void addConfiguredExclude_dependencies(BooleanParam arg)
	{
		addToArglist("exclude-dependencies", arg);
	}
	
	/*
	 * footer
	 */

	public void addConfiguredFooter_for_asdoc(ValueParam arg)
	{
		arg.task = this;
		arg.option = "footer_for_asdoc";
		addToArglist("footer", arg);
	}
	
	/*
	 * include-lookup-only
	 */

	public void addConfiguredInclude_lookup_only(BooleanParam arg)
	{
		addToArglist("include-lookup-only", arg);
	}
	
	/*
	 * left-frameset-width
	 */

	public void addConfiguredLeft_frameset_width(IntegerParam arg)
	{
		arg.task = this;
		arg.option = "left_frameset_width";
		addToArglist("left-frameset-width", arg);
	}
	
	/*
	 * main-title
	 */

	public void addConfiguredMain_title(ValueParam arg)
	{
		arg.task = this;
		arg.option = "main_title";
		addToArglist("main-title", arg);
	}
	
	/*
	 * packages.package
	 */

	public void addConfiguredPackages__package(NameDescriptionParam arg)
	{
		addToArglist("packages.package", arg);
	}
	
	public void addConfiguredPackage_for_asdoc(NameDescriptionParam arg)
	{
		addToArglist("packages.package", arg);
	}
	
	/*
	 * templates-path
	 */

	public void addConfiguredTemplate_path(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "templates-path";
		addToArglist("templates-path", arg);
	}
	
	/*
	 * window-title
	 */

	public void addConfiguredWindow_Title(ValueParam arg)
	{
		arg.task = this;
		arg.option = "window_title";
		addToArglist("window-title", arg);
	}
	
	public void execute() throws BuildException
	{
		
		ArrayList<String> output = new ArrayList<String>();
		
		Calendar cal = Calendar.getInstance();
		long starttime = cal.getTimeInMillis();
		
		for (String o : _options.keySet())
		{
			if (buildCommand(o) != "")
			{
				output = buildCommand(o, output);
			}
			
		}
		
		checkPreconditions();
		
		if (_sdk != "")
		{
			ZarkovTargetsView.addTarget("asdoc", output, _sdk);
			CompilerWrapper.call("asdoc", "exe", output, this, _sdk);
			
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
	
}
