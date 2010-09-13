package de.bigsource.zarkov.ant;

import de.bigsource.zarkov.ant.nested.BooleanParam;
import de.bigsource.zarkov.ant.nested.FloatParam;
import de.bigsource.zarkov.base.CO;

public class TDSI extends AbstractApparat
{
	
	public TDSI()
	{
		super();
		_options.put("a", new CO(false, false));
		_options.put("e", new CO(false, false));
		_options.put("m", new CO(false, false));
		
		apparatPart = "apparat.tools.tdsi.TurboDieselSportInjection";
	}
	
	public void addConfiguredInlineAlchemyOperations(BooleanParam arg)
	{
		addToArglist("a", arg);
	}
	
	public void addConfiguredInlineExpansion(FloatParam arg)
	{
		addToArglist("e", arg);
	}
	
	public void addConfiguredMacroExpansion(FloatParam arg)
	{
		addToArglist("m", arg);
	}
	
}
