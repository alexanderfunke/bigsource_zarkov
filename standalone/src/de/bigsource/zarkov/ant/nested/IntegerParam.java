package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.TranslationUtil;

public class IntegerParam extends AbstractParam {

	private String _value;
	public ZarkovTask task;
	public String option = "";
	
	public String toString() {

		if (_value==null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
			return "";
		} else {
			return "" + _value;
		}
	}

	public void setValue(int value) {
		_value = ""+value;
	}
}
