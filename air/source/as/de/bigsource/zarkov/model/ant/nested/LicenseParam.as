package de.bigsource.zarkov.model.ant.nested
{

	import de.bigsource.zarkov.model.PropertyBuilder;
	public class LicenseParam extends AbstractParam 
	{

		private var _product_name : String = "";
		private var _license_key : String = "";

		public function LicenseParam(p_info : XML, p_properties : Array) 
		{
			_product_name = PropertyBuilder.checkString(p_info.@product_name, p_properties);
			_license_key = PropertyBuilder.checkString(p_info.@license_key, p_properties);
		}

		public function toString() : String 
		{
			return _product_name + " " + _license_key;
		}
	}
}