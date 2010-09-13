package de.bigsource.zarkov.ant.nested;

public class LocalizedParam extends AbstractParam {

	private String _text = "";
	private String _lang = "";

	public String toString() {
		return _text+" "+_lang;
	}

	public void setText(String text) {
		this._text = text;
	}

	public void setLang(String lang) {
		this._lang = lang;
	}
}
