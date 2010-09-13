package de.bigsource.zarkov.ant;

import de.bigsource.zarkov.ant.nested.PathParam;
import de.bigsource.zarkov.base.CO;

public class Coverage extends AbstractApparat
{
	
	public Coverage()
	{
		_options.put("s", new CO(false, false));
		
		apparatPart = "apparat.tools.coverage.Coverage";
	}
	
	public void addConfiguredInstrumentPath(PathParam arg)
	{
		arg.basedir = _basedir;
		arg.task = this;
		arg.option = "s";
		addToArglist("s", arg);
	}
	
	
}
