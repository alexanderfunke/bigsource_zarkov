package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;

public class ScriptLimitParam extends AbstractParam {

	private String _max_recursion_depth;
	public String max_execution_time;
	public ZarkovTask task;
	public String option = "";

	public String toString() {

		if (_max_recursion_depth == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (max_execution_time == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (_max_recursion_depth != null && max_execution_time != null) {
			return " " + _max_recursion_depth + " " + max_execution_time;
		}
		return "";
	}

	public void setMax_recursion_depth(String value) {
		this._max_recursion_depth = value;
	}

	public void setmax_execution_time(String value) {
		this.max_execution_time = value;
	}
}
