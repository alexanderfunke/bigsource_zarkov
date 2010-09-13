package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;

public class LanguageRangeParam extends AbstractParam {

	private String _lang;
	private String _range;
	public ZarkovTask task;
	public String option = "";

	public String toString() {

		if (_lang == null) {
			task.callException("You have to specify a lang for " + option);
		}

		if (_range == null) {
			task.callException("You have to specify a range for " + option);
		}

		if (_lang != null && _range != null) {
			return _lang + " " + _range;
		}

		return "";
	}

	public void setLang(String lang) {
		this._lang = lang;
	}

	public void setRange(String range) {
		this._range = range;
	}
}
