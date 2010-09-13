package de.bigsource.zarkov.model
{
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class MtascProxy extends AbstractCompilerProxy
	{
		public static const NAME : String = "MtascProxy";

		public function MtascProxy()
		{
			super(NAME);
		}
		
		public function call(p_command : Array, p_task : ZarkovTask, p_mtasc : String) : void
		{
			_task = p_task;
			_tool = p_mtasc;	
			
			callFromArray(p_command, _task);
		}

	}
}
