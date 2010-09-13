package de.bigsource.zarkov.ant.nested;

public class NameDescriptionParam extends AbstractParam {

	private String _description = "";
	private String _name = "";

	public String toString() {
		return _name+" \""+_description+"\"";
	}

	public void setDescription(String description) {
		_description = description;
	}
	
	public void setName(String name) {
		_name = name;
	}
}