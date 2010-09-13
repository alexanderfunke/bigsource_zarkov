package de.bigsource.zarkov.controller.startup 
{
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.model.AntFilesProxy;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

	public class StartupAntFilesCommand extends AsyncCommand
	{

		override public function execute( p_note : INotification ) : void
		{
			Trace.info("StartupAntFilesCommand");
			
			var antFilesProxy : AntFilesProxy = facade.retrieveProxy(AntFilesProxy.NAME) as AntFilesProxy;
			antFilesProxy.onComplete = commandComplete;
			antFilesProxy.initFileList();
			
		}
	}
}
