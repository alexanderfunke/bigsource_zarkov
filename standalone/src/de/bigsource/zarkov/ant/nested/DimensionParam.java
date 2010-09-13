package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.base.TranslationUtil;

public class DimensionParam extends AbstractParam {

	private String _width;
	private String _height;
	public ZarkovTask task;
	public String option = "";

	public String toString() {
		if (_width == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_width_for")+" " + option);
		}

		if (_height == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_width_for")+" " + option);
		}

		if (_width != null && _height != null) {
			return _width + " " + _height;
		}
		return "";
	}

	public void setWidth(String width) {
		this._width = width;
	}

	public void setHeight(String height) {
		this._height = height;
	}
}
