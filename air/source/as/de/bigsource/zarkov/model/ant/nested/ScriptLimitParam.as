package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class ScriptLimitParam extends AbstractParam 
	{

		private var _max_recursion_depth : String;
		private var _max_execution_time : String;
		private var _task : ZarkovTask;
		private var _option : String = "";
		
		public function ScriptLimitParam(p_task : ZarkovTask, p_option : String, p_info : XML, p_properties : Array) 		
		{
			
			_task = p_task;
			_option = p_option;
			
			_max_recursion_depth = PropertyBuilder.checkString(p_info.@max_recursion_depth, p_properties);
			_max_execution_time = PropertyBuilder.checkString(p_info.@max_execution_time, p_properties);
			
		}
		
		public function toString() : String 
		{

			if (_max_recursion_depth == null) 
			{
				_task.callException("You have to specify max-recursion-depth for " + _option);
			}

			if (_max_execution_time == null) 
			{
				_task.callException("You have to specify max-execution-time for " + _option);
			}

			if (_max_recursion_depth != null && _max_execution_time != null) 
			{
				return " " + _max_recursion_depth + " " + _max_execution_time;
			}
			return "";
		}
		
		public function get max_execution_time() : String
		{
			return _max_execution_time;
		}
	}
}