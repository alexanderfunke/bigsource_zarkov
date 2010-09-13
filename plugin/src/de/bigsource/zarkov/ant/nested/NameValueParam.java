package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.TranslationUtil;

public class NameValueParam extends AbstractParam {

	private String _value;
	private String _name;
	public String basedir = "";
	public ZarkovTask task;
	public String option = "";

	public String toString() {
		if (_value == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}
		
		if (_name == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (_value != null && _name!=null) {
			return _name+" "+_value;
		}
		
		return "";
	}

	public void setValue(String value) {
		_value = value;
	}
	
	public void setName(String name) {
		_name = name;
	}

}