package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class DimensionParam extends AbstractParam 
	{

		private var _width : String;
		private var _height : String;
		private var _task : ZarkovTask;
		private var _option : String = "";
		
		public function DimensionParam(p_task : ZarkovTask, p_option : String, p_info : XML, p_properties : Array) 		
		{
			
			_task = p_task;
			_option = p_option;
			
			_width = PropertyBuilder.checkString(p_info.@width, p_properties);
			_height = PropertyBuilder.checkString(p_info.@height, p_properties);
			
		}
		
		public function toString() : String 
		{
			if (_width == null) 
			{
				_task.callException("You have to specify a width for " + _option);
			}

			if (_height == null) 
			{
				_task.callException("You have to specify a height for " + _option);
			}

			if (_width != null && _height != null) 
			{
				return _width + " " + _height;
			}
			return "";
		}
	}
}