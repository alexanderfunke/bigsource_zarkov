package de.bigsource.zarkov.model
{

	
	public class ACompcProxy extends AbstractFlexCompilerProxy
	{
		public static const NAME : String = "ACompcProxy";
		
		public function ACompcProxy() 
		{
			NAME = "acompc";
			WIN_SUFFIX = "bat";
			super(NAME);
		}
	}
}