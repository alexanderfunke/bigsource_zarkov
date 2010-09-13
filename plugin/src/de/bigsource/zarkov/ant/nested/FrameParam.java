package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.TranslationUtil;

public class FrameParam extends AbstractParam {

	private String _label;
	private String _class_name;
	public ZarkovTask task;
	public String option = "";

	public String toString() {

		if (_label == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (_class_name == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (_label != null && _class_name != null) {
			return " " + _label + " " + _class_name;
		}
		return "";
	}

	public void setLabel(String label) {
		this._label = label;
	}

	public void setClass_name(String class_name) {
		this._class_name = class_name;
	}
}
