package de.bigsource.zarkov.base;

import java.util.Locale;
import java.util.ResourceBundle;

public class TranslationUtil
{

	private static ResourceBundle resourceBundle;

	public static String getTranslation(String key)
	{
		if (resourceBundle == null)
		{
			resourceBundle = ResourceBundle.getBundle("Zarkov",Locale.getDefault());
		}
		return resourceBundle.getString(key);
	}
	
}
