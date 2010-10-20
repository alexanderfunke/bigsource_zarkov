package de.bigsource.zarkov.translations;

import java.util.HashMap;
import java.util.Locale;
import java.util.ResourceBundle;

public class TranslationUtil
{
	
	private static HashMap<String, HashMap<String, String>> _locales;
	
	public static void initialize()
	{
		_locales = new HashMap<String, HashMap<String, String>>();
		
		HashMap<String, String> de_DE = new HashMap<String, String>();
		
		de_DE.put("general.max_execution_time", "Die maximale Ausf\u00fchrungszeit wurde erreicht.");
		de_DE.put("general.specify_file_specs", "Bitte geben Sie die Hauptklasse an. <file_specs.../>.");
		de_DE
				.put(
						"general.usage_of_preferences",
						"Die Nutzung der Eclipse Einstllungen ist aus Kompatibilit\u00E4tsgr\u00fcnden nicht mehr verwendbar. Bitte benutzen Sie das sdk Attribut in Ihren Tasks.\nBeispiel: <bigsource.xxx basedir=\"${basedir}\" sdk=\"PATH TO SDK\" />");
		de_DE.put("general.standard_configuration", "Benutze Standardkonfiguration.");
		de_DE.put("general.using_flex", "Sie benutzen die SDK mit {#SDK#} als Flexpath");
		de_DE.put("general.using_configuration", "Benutze Konfiguration ");
		de_DE.put("general.compiler_had_error", "Der Compiler hat Fehler geworfen!");
		de_DE.put("general.basedir_not_set", "Basedir ist nicht gesetzt. Bitte setzen Sie das Task Attribut basedir. Beispiel: basedir=\"${basedir}\"");
		de_DE.put("general.executable_not_found", "Der Compiler wurde nicht gefunden. Bitte pr\u00fcfen Sie den SDK Pfad.");
		de_DE.put("browser.url_not_set", "Url ist nicht gesetzt. Bitte setzen Sie das Task Attribut url. Beispiel: url=\"deploy/index.html\"");
		de_DE.put("browser.url_not_found", "Url wurde nicht gefunden. Der genutzte Pfad ist: {#URL#}. Bitte korrigieren Sie Ihre Einstellungen.");
		de_DE.put("browser.executable_not_set", "Browser ist nicht gesetzt. Bitte setzen Sie das Task Attribut browser. Beispiel: browser=\"c:\\Program Files\\Mozilla\\Firefox\\Firefox.exe\"");
		de_DE.put("browser.executable_not_found", "Browser wurde nicht gefunden. Der genutzte Pfad ist: {#BROWSER#}. Bitte korrigieren Sie Ihre Einstellungen.");
		de_DE.put("browser.deactivated", "Browser Task ist deaktiviert. Aktivierbar \u00fcber die Einstellung enableInStandalone=\"true\".");
		de_DE.put("flashplayer.swf_not_set", "Swf ist nicht gesetzt. Bitte setzen Sie das Task Attribut swf. Beispiel: swf=\"deploy/swf/application.swf\"");
		de_DE.put("flashplayer.swf_not_found", "Swf wurde nicht gefunden. Der genutzte Pfad ist: {#PATH#}. Bitte korrigieren Sie Ihre Einstellungen.");
		de_DE.put("flashplayer.executable_not_set",
				"Player ist nicht gesetzt. Bitte setzen Sie das Task Attribut player. Beispiel: player=\"/workspace/flashlibs/flex_sdk_3.3/runtimes/player/mac/Flash Player.app\"");
		de_DE.put("flashplayer.executable_not_found", "Der Playerpfad ist falsch. Bitte korrigieren Sie Ihre Einstellungen.");
		de_DE.put("flashplayer.deactivated", "Flashplayer Task ist deaktiviert. Aktivierbar \u00fcber die Einstellung enableInStandalone=\"true\".");
		de_DE.put("mtasc.executable_not_set", "Sie haben den MTASC compiler nicht gesetzt. Bitte setzen Sie das Task Attribut mtasc=\"PATH TO MTASC\".");
		de_DE.put("mtasc.executable_not_found", "MTASC compiler nicht gefunden. Bitte w\u00E4hlen Sie eine andere Datei!");
		de_DE.put("haxe.executable_not_set", "Sie haben den HAXE compiler nicht gestezt. Bitte setzen Sie das Task Attribut haxe=\"PATH TO HAXE\".");
		de_DE.put("haxe.executable_not_found", "HAXE compiler nicht gefunden. Bitte w\u00E4hlen Sie eine andere Datei!");
		de_DE.put("adt.specify_air_intermediate_file", "Sie m\u00fcssen die Air intermediate Datei angeben.");
		de_DE.put("adt.specify_air_file", "Sie m\u00fcssen die Air Datei angeben.");
		de_DE.put("adt.specify_storetype", "Sie m\u00fcssen den storetype angeben.");
		de_DE.put("adt.specify_app_xml", "Sie m\u00fcssen die Air App Description XML angeben.");
		de_DE.put("adt.specify_rootpath", "Sie m\u00fcssen den rootpath angeben");
		de_DE.put("adt.rootpath_end", "rootpath muss immer auf / enden.");
		de_DE.put("apparat.apparat_directory_not_set", "Sie haben noch keinen Apparat Ordner gesetzt. Bitte setzen Sie das Task Attribut \"apparatdirectory\"");
		de_DE.put("apparat.apparat_directory_not_found", "Ihr Apparat Ordner ist falsch.");
		de_DE.put("apparat.scala_not_set", "Sie haben den Pfad zu Scala nicht gesetzt. Bitte setzen sie das Task Attibut \"scala\"");
		de_DE.put("apparat.scala_not_found", "Ihr Scala wurde nicht gefunden.");
		de_DE.put("param.specify_a_value_for", "Sie m\u00fcssen einen Wert angeben f\u00fcr: ");
		de_DE.put("param.not_found", "{#FILE#} wurde nicht gefunden.");
		de_DE.put("fcsh.executable_not_found", "FCSH wurde nicht gefunden. Bitte pr\u00fcfen Sie den sdk Pfad. Es sollte auf das Hauptverzeichnis zeigen und nicht auf den bin Ordner.");
		de_DE.put("fcsh.java_heap", "FCSH wurde beendet! Es wird bei der n\u00E4chsten Kompilierung neu gestartet!");
		de_DE.put("fcsh.spaces_in_path", "Sie haben Leerzeichen in einem Ihrer Optionen. FCSH und die anderen Flex Compiler k\u00F6nnen nicht mit Leerzeichen umgehen.\n\n");
		
		_locales.put("de_DE", de_DE);
		
		HashMap<String, String> en_US = new HashMap<String, String>();
		en_US.put("general.max_execution_time", "Max execution time reached!");
		en_US.put("general.specify_file_specs", "Please specify the main class with <file_specs.../>.");
		en_US
				.put("general.usage_of_preferences",
						"Usage of Eclipse Preferences is deprecated for compatibility reasons. Please use the sdk attribute at your tasks.\nExample: <bigsource.xxx basedir=\"${basedir}\" sdk=\"PATH TO SDK\" />");
		en_US.put("general.standard_configuration", "Using standard configuration.");
		en_US.put("general.using_flex", "You are using the SDK with {#SDK#} as Flexpath");
		en_US.put("general.using_configuration", "Using config ");
		en_US.put("general.compiler_had_error", "Compiler had errors!");
		en_US.put("general.basedir_not_set", "Basedir not set. Please correct your settings. Example: basedir=\"${basedir}\"");
		en_US.put("general.executable_not_found", "Executable not found. Please check the sdk path.");
		en_US.put("browser.url_not_set", "Url not set. Please correct your settings. Example: url=\"deploy/index.html\"");
		en_US.put("browser.url_not_found", "URL not found. Used path is: {#URL#}. Please correct your settings.");
		en_US.put("browser.executable_not_set", "Please specify the path to the Browser! Example: browser=\"c:\\Program Files\\Mozilla\\Firefox\\Firefox.exe\"");
		en_US.put("browser.executable_not_found", "Browser not found. Used path is: {#BROWSER#}. Please correct your settings.");
		en_US.put("browser.deactivated", "Browser Task deactivated. Activate by setting enableInStandalone='true'");
		en_US.put("flashplayer.swf_not_set", "Swf not set. Please correct your settings. Example: swf=\"deploy/swf/application.swf\"");
		en_US.put("flashplayer.swf_not_found", "SWF not found. Used path is: {#PATH#}. Please correct your settings.");
		en_US.put("flashplayer.executable_not_set",
				"Player not set. Please specify the path to the Flashplayer. Example: player=\"/workspace/flashlibs/flex_sdk_3.3/runtimes/player/mac/Flash Player.app\"");
		en_US.put("flashplayer.executable_not_found", "Player-Path wrong. Please correct your settings.");
		en_US.put("flashplayer.deactivated", "Flashplayer Task deactivated. Activate by setting enableInStandalone='true'");
		en_US.put("mtasc.executable_not_set", "You have not choosen the MTASC compiler. Please choose a file!");
		en_US.put("mtasc.executable_not_found", "MTASC compiler not found. Please choose a different file!");
		en_US.put("haxe.executable_not_set", "You have not choosen the HAXE compiler. Please set it with the attribute haxe=\"PATH TO HAXE\"");
		en_US.put("haxe.executable_not_found", "HAXE compiler not found. Please choose a different file!");
		en_US.put("adt.specify_air_intermediate_file", "You have to specify the Air intermediate file.");
		en_US.put("adt.specify_air_file", "You have to specify the Air file.");
		en_US.put("adt.specify_storetype", "You have to specify the storetype.");
		en_US.put("adt.specify_app_xml", "You have to specify the Air App Description XML.");
		en_US.put("adt.specify_rootpath", "You have to specify the rootpath");
		en_US.put("adt.rootpath_end", "rootpath must end with a /");
		en_US.put("apparat.apparat_directory_not_set", "You have not choosen the ApparatDirectory. Please set the task attribute \"apparatdirectory\"");
		en_US.put("apparat.apparat_directory_not_found", "Your ApparatDirectory is wrong!");
		en_US.put("apparat.scala_not_set", "You have not choosen the path to scala executable. Please set the task attribute \"scala\"");
		en_US.put("apparat.scala_not_found", "Your Scala executable doesn't exist!");
		en_US.put("param.specify_a_value_for", "You have to specify a value for");
		en_US.put("param.not_found", "{#FILE#} was not found");
		en_US.put("fcsh.executable_not_found", "FCSH not found. Please check the sdk path. It should be set to the basedir of the sdk, not the bin folder.");
		en_US.put("fcsh.java_heap", "FCSH quit! Will start again at next compilation!");
		en_US.put("fcsh_spaces_in_path", "You have spaces in one of your options. FCSH and the other Flex Compiler can't use spaces.\n\n");
		
		_locales.put("en_US", en_US);
	}
	
	public static String getTranslation(String key)
	{
		String value = "";
		if (_locales.get(Locale.getDefault()) != null)
		{
			value = _locales.get(Locale.getDefault()).get(key);
			if (value == null)
			{
				value = _locales.get("en_US").get(key);
			}
		}
		else
		{
			value = _locales.get("en_US").get(key);
		}
		
		return value;
	}
	
}
