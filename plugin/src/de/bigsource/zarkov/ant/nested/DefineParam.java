package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;

public class DefineParam extends AbstractParam {

	private String _value;
	private String _name;
	public String basedir = "";
	public ZarkovTask task;
	public String option = "";
	private boolean _append = false;

	public String toString() {
		if (_value == null) {
			task.callException("You have to specify a value for " + option);
		}
		
		if (_name == null) {
			task.callException("You have to specify a name for " + option);
		}

		if (_value != null && _name!=null) {
			return _name+","+_value;
		}
		
		return "";
	}

	public void setValue(String value) {
		_value = value;
	}
	
	public void setName(String name) {
		_name = name;
	}
	
	public void setAppend(Boolean append) {
		_append = append;
	}
	
	public boolean append(){
	    return _append;
	}

}