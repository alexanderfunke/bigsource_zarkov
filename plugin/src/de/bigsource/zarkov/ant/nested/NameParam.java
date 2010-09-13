package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;

public class NameParam extends AbstractParam {

	private String _value;
	public ZarkovTask task;
	public String option = "";

	public String toString() {
		if (_value == null) {
			task.callException("You have to specify a name for " + option);
			return "";
		} else {
			return _value;
		}
		
	}

	public void setName(String value) {
		this._value = value;
	}
}
