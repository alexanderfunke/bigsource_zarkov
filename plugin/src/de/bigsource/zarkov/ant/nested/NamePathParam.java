package de.bigsource.zarkov.ant.nested;

import java.io.File;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;

public class NamePathParam extends AbstractParam {

	private String _path;
	private String _name;
	private Boolean _relative;
	public String basedir = "";
	public ZarkovTask task;
	public String option = "";

	public String toString() {
		if (_path == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}
		
		if (_name == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (_path != null && _name!=null) {
			File f = new File(_path);
			if (!f.exists() && !_relative) {
				_path = basedir + "/" + _path;
			}
			return _name+" "+_path;
		}
		
		return "";
	}

	public void setPath(String path) {
		_path = path;
	}
	
	public void setName(String name) {
		_name = name;
	}
	
	public void setUserelative(Boolean relative) {
		_relative = relative;
	}
}