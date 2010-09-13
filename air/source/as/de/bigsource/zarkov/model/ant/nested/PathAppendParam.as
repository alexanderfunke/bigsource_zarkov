package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	import flash.filesystem.File;

	public class PathAppendParam extends AbstractParam 
	{

		private var _path : String;
		private var _userelative : Boolean = false;
		private var _append : Boolean = false;
		private var _basedir : String = "";
		private var _task : ZarkovTask;
		private var _option : String = "";
		
		public function PathAppendParam(p_task : ZarkovTask, p_option : String, p_basedir : String, p_info : XML, p_properties : Array) 		
		{
			
			_task = p_task;
			_option = p_option;
			_basedir = p_basedir;
			
			_path = PropertyBuilder.checkString(p_info.@path, p_properties);
			_userelative = PropertyBuilder.checkBoolean(p_info.@userelative, p_properties);			_append = PropertyBuilder.checkBoolean(p_info.@append, p_properties);
			
		}
		
		public function toString() : String 
		{

			if (_path == null) 
			{
				_task.callException("You have to specify a path for " + _option);
			}

			if (_path != null) 
			{
				var f : File;
				try
				{
					f = new File(_path);
				} catch(e : Error)
				{
					_userelative = false;
				}
				if (f != null && f.exists) 
				{
					if (_option != "rootpath" && _option != "output") 
					{
						_userelative = true;
					}
				}
				if (_userelative != true) 
				{
					_path = _basedir + _path;
				}
				if (_path.indexOf(" ") > -1) 
				{
					return "\"" + _path + "\"";
				}
				return _path;
			}
			return "";
		}
	}
}
