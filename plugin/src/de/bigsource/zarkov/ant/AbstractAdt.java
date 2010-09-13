package de.bigsource.zarkov.ant;

import de.bigsource.zarkov.base.ZarkovTask;

public class AbstractAdt extends ZarkovTask
{
	
	protected Boolean onlyFirstError = false;
	
	public static final String COMMON_NAME = "cn";
	public static final String ORGANISATION_UNIT = "ou";
	public static final String ORGANISATION = "o";
	public static final String COUNTRY = "c";
	public static final String STORETYPE = "storetype";
	public static final String KEYSTORE = "keystore";
	public static final String KEYPASS = "keypass";
	public static final String AIR_INTERMEDIATE_FILE = "air_intermediate_file";
	public static final String AIR_FILE = "air_file";
	public static final String STOREPASS = "storepass";
	public static final String ALIAS = "alias";
	public static final String PROVIDERNAME = "providerName";
	public static final String TSA = "tsa";
	public static final String APP_XML = "app_xml";
	public static final String ADD_FILE = "add_file";
	public static final String ADD_DIR = "add_dir";
	public static final String ROOTPATH = "rootpath";
	public static final String AIRTARGET = "target";
	
	public void setOnlyFirstError(Boolean onlyfirsterror)
	{
		onlyFirstError = onlyfirsterror;
	}
	
}
