package de.bigsource.zarkov.model
{

	
	public class AsDocProxy extends AbstractFlexCompilerProxy
	{
		public static const NAME : String = "AmxmlcProxy";
		
		public function AsDocProxy() 
		{
			NAME = "asdoc";
			WIN_SUFFIX = "exe";
			super(NAME);
		}
	}
}