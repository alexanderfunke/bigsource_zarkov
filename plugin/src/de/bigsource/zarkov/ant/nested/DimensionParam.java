package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;

public class DimensionParam extends AbstractParam {

	private String _width;
	private String _height;
	public ZarkovTask task;
	public String option = "";

	public String toString() {
		if (_width == null) {
			task.callException("You have to specify a width for " + option);
		}

		if (_height == null) {
			task.callException("You have to specify a height for " + option);
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
