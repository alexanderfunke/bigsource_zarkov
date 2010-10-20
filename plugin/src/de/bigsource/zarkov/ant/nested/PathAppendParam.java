package de.bigsource.zarkov.ant.nested;

import java.io.File;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;

public class PathAppendParam extends AbstractParam {

	private String _path;
	private Boolean _relative = false;
	private Boolean _append = false;
	public String basedir = "";
	public ZarkovTask task;
	public String option = "";

	public String toString() {

		if (_path == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
		}

		if (_path != null) {
			File f = new File(_path);
			if (f.exists()) {
				if (option != "rootpath" && option != "output") {
					_relative = true;
				}
			}
			if (_relative != true) {
				_path = basedir + "/" + _path;
			}
			if (_path.indexOf(" ") > -1) {
				return "\"" + _path + "\"";
			}
			return _path;
		}
		return "";
	}
	
	public void setPath(String path) {
		_path = path;
	}

	public void setUserelative(Boolean relative) {
		_relative = relative;
	}
	
	public void setAppend(Boolean append) {
		_append = append;
	}
	
	public boolean append(){
	    return _append;
	}
}
