package de.bigsource.zarkov.model.ant.nested
{

	import de.bigsource.zarkov.model.PropertyBuilder;
	public class NameDescriptionParam extends AbstractParam 
	{

		private var _description : String = "";
		private var _name : String = "";
		
		public function NameDescriptionParam(p_info : XML, p_properties : Array) 		
		{
			_description = PropertyBuilder.checkString(p_info.@description, p_properties);
			_name = PropertyBuilder.checkString(p_info.@name, p_properties);
		}
		
		public function toString() : String 
		{
			return _name + " \"" + _description + "\"";
		}

	}
}