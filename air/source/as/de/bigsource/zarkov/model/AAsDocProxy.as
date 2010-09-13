package de.bigsource.zarkov.model
{

	
	public class AAsDocProxy extends AbstractFlexCompilerProxy 
	{
		public static const NAME : String = "AAsDocProxy";
		
		public function AAsDocProxy() 
		{
			NAME = "aasdoc";
			WIN_SUFFIX = "bat";
			super(NAME);
		}
	}
}