package de.bigsource.zarkov.ant;

import de.bigsource.zarkov.ant.nested.FloatParam;
import de.bigsource.zarkov.base.CO;

public class Reducer extends AbstractApparat
{
	
	public Reducer()
	{
		super();
		_options.put("d", new CO(false, false));
		_options.put("q", new CO(false, false));
		
		apparatPart = "apparat.tools.reducer.Reducer";
	}

	public void addConfiguredDeblockingStrength(FloatParam arg)
	{
		arg.task = this;
		arg.option = "d";
		addToArglist("d", arg);
	}
	
	public void addConfiguredQuality(FloatParam arg)
	{
		arg.task = this;
		arg.option = "q";
		addToArglist("q", arg);
	}

}
