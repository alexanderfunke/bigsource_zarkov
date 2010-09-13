package de.bigsource.zarkov.model
{
	import de.bigsource.zarkov.model.base.ZarkovTask;

	import flash.system.Capabilities;

	public class AdtProxy extends AbstractCompilerProxy
	{
		public static const NAME : String = "AdtProxy";

		public function AdtProxy()
		{
			super(NAME);
		}

		public function call(p_command : String, p_parent : ZarkovTask, p_sdk:String) : void 
		{
				
			var osName : String = Capabilities.os;
			
			if (osName.indexOf("Windows") > -1)
			{
				_tool = p_sdk + "\\bin\\adt.exe";
			}
			if (osName.indexOf("Mac") > -1 || osName.indexOf("Linux") > -1)
			{
				_tool = p_sdk + "/bin/adt";
			}
			
			callFromString(p_command, p_parent);
		}

		override public function onRemove() : void
		{
		}
	}
}
