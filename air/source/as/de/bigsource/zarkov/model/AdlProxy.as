package de.bigsource.zarkov.model
{
	import de.bigsource.zarkov.model.base.ZarkovTask;

	import flash.system.Capabilities;

	public class AdlProxy extends AbstractCompilerProxy
	{
		public static const NAME : String = "AdlProxy";

		public function AdlProxy()
		{
			super(NAME);
		}

		public function call(p_command : String, p_parent : ZarkovTask, p_sdk : String) : void
		{
			var osName : String = Capabilities.os;
			
			if (osName.indexOf("Windows") > -1)
			{
				_tool = p_sdk + "\\bin\\adl.exe";
			}
			if (osName.indexOf("Mac") > -1 || osName.indexOf("Linux") > -1)
			{
				_tool = p_sdk + "/bin/adl";
			}
			
			callFromString(p_command, p_parent);
		}
	}
}
