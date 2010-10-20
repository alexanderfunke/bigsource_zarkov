package de.bigsource.zarkov.ant.nested;

import java.io.File;

import de.bigsource.zarkov.translations.TranslationUtil;

public class NamespaceParam extends AbstractParam {

	private String _uri = "";
	private String _manifest = "";
	public String basedir = "";

	public String toString() {
	    String file = _manifest;
		File f = new File(_manifest);
		if (!f.exists()) {
		    _manifest = basedir +"/"+ _manifest;
		}
		f = new File(_manifest);
		if (!f.exists()) {
			System.out.println(TranslationUtil.getTranslation("param.specify_a_value_for").replace("{#FILE#}", file));
		}
		return _uri+" "+_manifest;
	}

	public void setUri(String uri) {
		this._uri = uri;
	}

	public void setManifest(String manifest) {
		this._manifest = manifest;
	}
}
