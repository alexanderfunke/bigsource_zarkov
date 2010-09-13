package de.bigsource.zarkov.model
{

	
	public class AmxmlcProxy extends AbstractFlexCompilerProxy
	{
		public static const NAME : String = "AmxmlcProxy";
		
		public function AmxmlcProxy() 
		{
			NAME = "amxmlc";
			WIN_SUFFIX = "exe";
			super(NAME);
		}
	}
}