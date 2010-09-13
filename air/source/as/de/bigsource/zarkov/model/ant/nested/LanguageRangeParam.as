package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class LanguageRangeParam extends AbstractParam 
	{

		private var _lang : String;
		private var _range : String;
		private var _task : ZarkovTask;
		private var _option : String = "";


		public function LanguageRangeParam(p_task:ZarkovTask, p_option:String, p_info : XML, p_properties : Array) 
		{
			_task = p_task;
			_option = p_option;
			
			_lang = PropertyBuilder.checkString(p_info.@lang, p_properties);
			_range = PropertyBuilder.checkString(p_info.@range, p_properties);
		}
		
		public function toString() : String 
		{

			if (_lang == null) 
			{
				_task.callException("You have to specify a lang for " + _option);
			}

			if (_range == null) 
			{
				_task.callException("You have to specify a range for " + _option);
			}

			if (_lang != null && _range != null) 
			{
				return _lang + " " + _range;
			}

			return "";
		}
	}
}
