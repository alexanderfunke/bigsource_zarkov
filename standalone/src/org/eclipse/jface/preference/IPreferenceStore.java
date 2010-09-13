package org.eclipse.jface.preference;

public interface IPreferenceStore {

	String getString(String p_value);

	void setDefault(String p_key, String p_value);

}
