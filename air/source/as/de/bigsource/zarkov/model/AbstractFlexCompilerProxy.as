package de.bigsource.zarkov.model
{
	import de.bigsource.zarkov.model.base.BuildException;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class AbstractFlexCompilerProxy extends AbstractCompilerProxy
	{

		public var NAME : String;
		public var WIN_SUFFIX : String;

		public function AbstractFlexCompilerProxy(p_name : String)
		{
			super(p_name);
		}

		override public function onRegister() : void
		{
		}

		public function call(p_command : Array, p_parent : ZarkovTask, p_sdk : String) : void 
		{

			_task = p_parent;

			var osName : String = "Mac";

			if (osName.indexOf("Windows") > -1) 
			{
				_tool = p_sdk + "\\bin\\" + NAME + "." + WIN_SUFFIX;
			} else if (osName.indexOf("Mac") > -1 || osName.indexOf("Linux") > -1) 
			{
				_tool = p_sdk + "/bin/" + NAME;
			} 
			else 
			{
				new BuildException("Your OS is currently not supported.", _task.targetID);
				return;
			}
			
			callFromArray(p_command, p_parent);
		}
	}
}
