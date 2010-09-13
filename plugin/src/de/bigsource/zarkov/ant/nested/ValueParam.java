package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;

public class ValueParam extends AbstractParam {

	private String _value;
	public ZarkovTask task;
	public String option = "";
	private Boolean _append = false;

	public String toString() {

		if (_value == null) {
			task.callException("You have to specify a value for " + option);
			return "";
		} else {
			if (_value.indexOf(" ") > -1) {
//				_value = _value.replace(" ", "\\ ");
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
