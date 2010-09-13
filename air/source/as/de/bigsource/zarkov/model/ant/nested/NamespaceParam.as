package de.bigsource.zarkov.model.ant.nested
{
	import de.bigsource.zarkov.model.PropertyBuilder;
	import flash.filesystem.File;

	public class NamespaceParam extends AbstractParam 
	{

		private var _uri : String = "";
		private var _manifest : String = "";
		private var _basedir : String = "";

		public function NamespaceParam(p_basedir : String, p_info : XML, p_properties : Array) 		
		{
			
			_basedir = p_basedir;
			_uri = PropertyBuilder.checkString(p_info.@uri, p_properties);
			_manifest = PropertyBuilder.checkString(p_info.@manifest, p_properties);
		}

		public function toString() : String 
		{
			//TODO: Prüfen, ob nicht möglich Fehler mit "exists" abzufangen
			try
			{
			var f : File = new File(_manifest);
			} catch(e:Error)
			{
				_manifest = _basedir + "/" + _manifest;
			}

			f = new File(_manifest);
			if (!f.exists) 
			{
			//System.out.println(file+" was not found");
			}
			return _uri + " " + _manifest;
		}

	}
}