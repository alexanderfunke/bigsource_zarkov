package de.bigsource.zarkov.model.ant.nested
{

	import de.bigsource.zarkov.model.PropertyBuilder;
	public class BooleanParam extends AbstractParam 
	{

		private var _value : Boolean = false;

		public function BooleanParam(p_info : XML, p_properties : Array) 
		{
			_value = PropertyBuilder.checkBoolean(p_info.@value, p_properties);
		}

		public function toString() : String 
		{
			return "" + _value;
		}
	}
}
