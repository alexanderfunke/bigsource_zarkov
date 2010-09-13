package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class NameParam extends AbstractParam 
	{

		private var _name : String;
		private var _task : ZarkovTask;
		private var _option : String = "";
		
		public function NameParam(p_task:ZarkovTask, p_option:String, p_info : XML, p_properties : Array) 		
		{
			_task = p_task;			_option = p_option;
			_name = PropertyBuilder.checkString(p_info.@name, p_properties);
		}
		
		public function toString() : String 
		{
			if (_name == null) 
			{
				_task.callException("You have to specify a name for " + _option);
				return "";
			} 
			else 
			{
				return _name;
			}
		}
	}
}