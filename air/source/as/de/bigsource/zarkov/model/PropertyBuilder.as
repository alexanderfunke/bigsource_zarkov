package  
de.bigsource.zarkov.model{
	import de.bigsource.utils.StringUtil;
	import de.bigsource.model.logging.Trace;

	/**
	 * @author alexanderfunke
	 */
	public class PropertyBuilder 
	{

		public static function parse(p_properties:Array, p_file : String) : Array
		{
		
			var lines : Array = p_file.split("\n");
			for (var i : int = 0;i < lines.length;i++) 
			{
				if(StringUtil.trim(lines[i]) != "")
				{
					
					var line : Array = String(lines[i]).split("=");
					var value:String = StringUtil.trim(line[1]);
					
					if(value.indexOf("$")>-1)
					{
						for (var key : String in p_properties) {
							value = StringUtil.replace(value, "${"+key+"}", p_properties[key]);
						}
					}
					p_properties[StringUtil.trim(line[0])] = value;
				}
			}
			return p_properties;		
		}

		public static function checkBoolean(p_str : String, p_properties : Array) : Boolean 
		{
			p_str = checkString(p_str, p_properties);
			if(p_str=="true")
			{
				return true;
			}
			return false;
		}
		
		public static function checkString(p_str : String, p_properties : Array) : String 
		{
			if(p_str.indexOf("$") > -1)
			{
				for (var key : String in p_properties) 
				{
					p_str = StringUtil.replace(p_str, "${" + key + "}", p_properties[key]);	
				}
			}
			return p_str;
		}

		public static function checkInteger(p_str : String, p_properties : Array) : int 
		{
			p_str = checkString(p_str, p_properties);
			return int(p_str);
		}
	}
}
