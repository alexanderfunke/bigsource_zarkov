package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;

public class MtascHeaderParam extends AbstractParam {

	private String _width;
	private String _height;
	private String _fps;
	private String _bgcolor;
	public ZarkovTask task;
	public String option = "";

	public String toString() {
		
		if (_width == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
			return "";
		}
		
		if (_height == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
			return "";
		}
		
		if (_fps == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
			return "";
		}
		
		if (_bgcolor == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
			return "";
		}
		
		return _width+":"+_height+":"+_fps+":"+_bgcolor;
	}

	public void setWidth(String width) {
		_width = width;
	}


	public void setHeight(String height) {
		_height = height;
	}
	
	public void setFps(String p_fps) {
		_fps = p_fps;
	}
	
	public void setBgColor(String p_bgcolor) {
		_bgcolor = p_bgcolor;
	}
}
