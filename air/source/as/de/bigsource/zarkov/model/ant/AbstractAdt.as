package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.model.base.ZarkovTask;

	public class AbstractAdt extends ZarkovTask
	{

		protected var onlyFirstError : Boolean = false;

		public static const COMMON_NAME : String = "cn";
		public static const ORGANISATION_UNIT : String = "ou";
		public static const ORGANISATION : String = "o";
		public static const COUNTRY : String = "c";
		public static const STORETYPE : String = "storetype";
		public static const KEYSTORE : String = "keystore";
		public static const KEYPASS : String = "keypass";
		public static const AIR_INTERMEDIATE_FILE : String = "air_intermediate_file";
		public static const AIR_FILE : String = "air_file";
		public static const STOREPASS : String = "storepass";
		public static const ALIAS : String = "alias";
		public static const PROVIDERNAME : String = "providerName";
		public static const TSA : String = "tsa";
		public static const APP_XML : String = "app_xml";
		public static const ADD_FILE : String = "add_file";
		public static const ADD_DIR : String = "add_dir";
		public static const ROOTPATH : String = "rootpath";
		public static const AIRTARGET : String = "target";

		public function setOnlyFirstError(onlyfirsterror : Boolean) : void
		{
			onlyFirstError = onlyfirsterror;
		}
	}
}
