package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;

public class IntegerParam extends AbstractParam {

	private String _value;
	public ZarkovTask task;
	public String option = "";
	
	public String toString() {

		if (_value==null) {
			task.callException("You have to specify a value for " + option);
			return "";
		} else {
			return "" + _value;
		}
	}

	public void setValue(int value) {
		_value = ""+value;
	}
}
