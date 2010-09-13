package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class ValueParam extends AbstractParam 
	{

		private var _value : String;
		private var _task : ZarkovTask;
		private var _option : String = "";
		private var _append : Boolean = false;
		
		public function ValueParam(p_task : ZarkovTask, p_option : String, p_info : XML, p_properties : Array) 		
		{
			
			_task = p_task;
			_option = p_option;
			_value = PropertyBuilder.checkString(p_info.@value, p_properties);
			_append = PropertyBuilder.checkBoolean(p_info.@relative, p_properties);
			
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
				if (_value.indexOf(" ") > -1) 
				{
					//				_value = _value.replace(" ", "\\ ");
					return "\"" + _value + "\"";
				}
				return _value;
			}
		}
	}
}
