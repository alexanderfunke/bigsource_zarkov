package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class MtascHeaderParam extends AbstractParam 
	{

		private var _width : String;
		private var _height : String;
		private var _fps : String;
		private var _bgcolor : String;
		private var _task : ZarkovTask;
		private var _option : String = "";
		
		public function MtascHeaderParam(p_task : ZarkovTask, p_option : String, p_info : XML, p_properties : Array) {
			
			_task = p_task;
			_option = p_option;
			
			_fps = PropertyBuilder.checkString(p_info.@fps, p_properties);
			_width = PropertyBuilder.checkString(p_info.@width, p_properties);			_height = PropertyBuilder.checkString(p_info.@height, p_properties);			_bgcolor = PropertyBuilder.checkString(p_info.@bgcolor, p_properties);
		}
		
		public function toString() : String 
		{
		
			if (_width == null) 
			{
				_task.callException("You have to specify a width for " + _option);
				return "";
			}
		
			if (_height == null) 
			{
				_task.callException("You have to specify a height for " + _option);
				return "";
			}
		
			if (_fps == null) 
			{
				_task.callException("You have to specify a fps for " + _option);
				return "";
			}
		
			if (_bgcolor == null) 
			{
				_task.callException("You have to specify a bgcolor for " + _option);
				return "";
			}
		
			return _width + ":" + _height + ":" + _fps + ":" + _bgcolor;
		}
	}
}
