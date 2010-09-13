package de.bigsource.zarkov.ant.nested;

import java.io.File;

import de.bigsource.zarkov.base.ZarkovTask;

public class PathParam extends AbstractParam {

	private String _path;
	private Boolean _relative = false;
	public String basedir = "";
	public ZarkovTask task;
	public String option = "";

	public String toString() {

		if (_path == null) {
			task.callException("You have to specify a path for " + option);
		}

		if (_path != null) {
			File f = new File(_path);
			if (f.exists()) {
			    _relative = true;
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
}
