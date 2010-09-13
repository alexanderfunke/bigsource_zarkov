package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	import flash.filesystem.File;

	public class NamePathParam extends AbstractParam 
	{

		private var _path : String;
		private var _name : String;
		private var _relative : Boolean;
		private var _basedir : String = "";
		private var _task : ZarkovTask;
		private var _option : String = "";
		
		public function NamePathParam(p_task:ZarkovTask, p_option:String, p_basedir:String, p_info : XML, p_properties : Array) 		
		{
			_task = p_task;
			_option = p_option;			_basedir = p_basedir;
			_path = PropertyBuilder.checkString(p_info.@path, p_properties);			_name = PropertyBuilder.checkString(p_info.@name, p_properties);			_relative = PropertyBuilder.checkBoolean(p_info.@relative, p_properties);
		}
		
		public function toString() : String 
		{
			if (_path == null) 
			{
				_task.callException("You have to specify a path for " + _option);
			}
		
			if (_name == null) 
			{
				_task.callException("You have to specify a name for " + _option);
			}

			if (_path != null && _name != null) 
			{
				var f : File = new File(_path);
				if (!f.exists && !_relative) 
				{
					_path = _basedir + "/" + _path;
				}
				return _name + " " + _path;
			}
		
			return "";
		}
	}
}