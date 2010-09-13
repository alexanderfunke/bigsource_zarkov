package de.bigsource.zarkov.model
{
	import de.bigsource.zarkov.model.base.ZarkovTask;

	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class HaxeProxy extends AbstractCompilerProxy
	{
		public static const NAME : String = "HaxeProxy";

		public function HaxeProxy()
		{
			super(NAME);
		}
		
		public function call(p_command : Array, p_task : ZarkovTask, p_haxe : String) : void
		{
			_task = p_task;
			_tool = p_haxe;	
			
			var tempFile:File = new File(File.createTempFile().nativePath+".hxml");
			var stream:FileStream = new FileStream();
			stream.open(tempFile, FileMode.WRITE);
			stream.writeUTFBytes(p_command.join("\n"));
			stream.close();

			callFromString(tempFile.nativePath, _task);
		}

	}
}
