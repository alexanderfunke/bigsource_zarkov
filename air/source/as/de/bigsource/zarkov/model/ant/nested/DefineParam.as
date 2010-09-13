package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class DefineParam extends AbstractParam 
	{

		private var _value : String;
		private var _name : String;
		private var _task : ZarkovTask;
		private var _option : String = "";

		public function DefineParam(p_task:ZarkovTask, p_option:String, p_info : XML, p_properties : Array) 
		{
			_task = p_task;			_option = p_option;
			
			_value = PropertyBuilder.checkString(p_info.@value, p_properties);			_name = PropertyBuilder.checkString(p_info.@name, p_properties);		}

		public function toString() : String 
		{
			if (_value == null) 
			{
				_task.callException("You have to specify a value for " + _option);
			}
		
			if (_name == null) 
			{
				_task.callException("You have to specify a name for " + _option);
			}

			if (_value != null && _name != null) 
			{
				return _name + "," + _value;
			}
		
			return "";
		}

	}
}