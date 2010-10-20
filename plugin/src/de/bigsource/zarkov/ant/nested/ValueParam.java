package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;

public class ValueParam extends AbstractParam {

	private String _value;
	public ZarkovTask task;
	public String option = "";
	private Boolean _append = false;

	public String toString() {

		if (_value == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
			return "";
		} else {
			if (_value.indexOf(" ") > -1) {
				return "\"" + _value + "\"";
			}
			return _value;
		}
	}

	public void setValue(String value) {
		_value = value;
	}
	
	public void setAppend(Boolean append) {
		_append = append;
	}
	
	public boolean append(){
	    return _append;
	}
}
