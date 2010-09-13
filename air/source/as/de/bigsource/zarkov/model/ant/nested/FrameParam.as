package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class FrameParam extends AbstractParam 
	{

		private var _label : String;
		private var _class_name : String;
		private var _task : ZarkovTask;
		private var _option : String = "";
	
		public function FrameParam(p_task:ZarkovTask, p_option:String, p_info : XML, p_properties : Array) 
		{
			_task = p_task;
			_option = p_option;
			
			_label = PropertyBuilder.checkString(p_info.@label, p_properties);
			_class_name = PropertyBuilder.checkString(p_info.@class_name, p_properties);
		}
	
		public function toString() : String 
		{

			if (_label == null) 
			{
				_task.callException("You have to specify a label for " + _option);
			}

			if (_class_name == null) 
			{
				_task.callException("You have to specify a class_name for " + _option);
			}

			if (_label != null && _class_name != null) 
			{
				return " " + _label + " " + _class_name;
			}
			return "";
		}
	}
}