package de.bigsource.zarkov.model.ant.nested
{

	import de.bigsource.zarkov.model.PropertyBuilder;
	public class LocalizedParam extends AbstractParam 
	{

		private var _text : String = "";
		private var _lang : String = "";
		
		public function LocalizedParam(p_info : XML, p_properties : Array) 
		{
			_text = PropertyBuilder.checkString(p_info.@text, p_properties);
			_lang = PropertyBuilder.checkString(p_info.@lang, p_properties);
		}
		
		public function toString() : String 
		{
			return _text + " " + _lang;
		}
	}
}
