package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class IntegerParam extends AbstractParam 
	{

		private var _value : String;
		private var _task : ZarkovTask;
		private var _option : String = "";
		
		public function IntegerParam(p_task : ZarkovTask, p_option : String, p_info : XML, p_properties : Array) {
			
			_task = p_task;
			_option = p_option;
			_value = PropertyBuilder.checkString(p_info.@value, p_properties);
			
		}
		
		public function toString() : String 
		{

			if (_value == null) 
			{
				_task.callException("You have to specify a value for " + _option);
				return "";
			} 
			else 
			{
				return "" + _value;
			}
		}
		
	}
}
