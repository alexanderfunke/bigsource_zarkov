package de.bigsource.zarkov.ant.nested;

public class BooleanParam extends AbstractParam {

	private boolean _value = false;

	public String toString() {
		return ""+_value;
	}

	public void setValue(boolean value) {
		this._value = value;
	}
}
