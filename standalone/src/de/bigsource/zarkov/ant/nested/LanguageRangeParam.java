package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.TranslationUtil;

public class LanguageRangeParam extends AbstractParam {

	private String _lang;
	private String _range;
	public ZarkovTask task;
	public String option = "";

	public String toString() {

		if (_lang == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (_range == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
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
