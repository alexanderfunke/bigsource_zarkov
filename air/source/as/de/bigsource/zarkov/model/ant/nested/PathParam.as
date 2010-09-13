package de.bigsource.zarkov.model.ant.nested 
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	import flash.filesystem.File;

	public class PathParam extends AbstractParam 
	{

		private var _path : String;
		private var _relative : Boolean = false;
		private var _basedir : String = "";
		private var _task : ZarkovTask;
		private var _option : String = "";
		private var _presetRelative : Boolean;

		public function PathParam(p_task : ZarkovTask, p_option : String, p_basedir : String, p_info : XML, p_properties : Array, p_useRelative : Boolean = false) 		
		{
			
			_task = p_task;
			_option = p_option;
			_basedir = p_basedir;			_relative = p_useRelative;
			
			_path = PropertyBuilder.checkString(p_info.@path, p_properties);
			_relative = PropertyBuilder.checkBoolean(p_info.@relative, p_properties);
			_presetRelative = p_useRelative;
		}

		public function toString() : String 
		{
			
			if (_path == null) 
			{
				_task.callException("You have to specify a path for " + _option);
			}

			if (_path != null) 
			{
				
				if(!_presetRelative)
				{
					var f : File;
					try
					{
						f = new File(_path);
					} catch(e : Error)
					{
						_relative = false;
					}
					if (f != null && f.exists) 
					{
						_relative = true;
					}
				
					if (_relative != true) 
					{
						_path = _basedir + _path;
					}
					if (_path.indexOf(" ") > -1) 
					{
						return "\"" + _path + "\"";
					}
				}
			}
			return _path;
			
			return "";
		}

		public function set relative(relative : Boolean) : void
		{
			_relative = relative;
		}
	}
}
