package de.bigsource.zarkov.controller.startup 
{
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.model.UpdaterProxy;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

	public class StartupUpdaterCommand extends AsyncCommand
	{

		override public function execute( p_note : INotification ) : void
		{
			Trace.info("StartupUpdaterCommand");
			
			var checkUpdateProxy : UpdaterProxy = facade.retrieveProxy(UpdaterProxy.NAME) as UpdaterProxy;
			checkUpdateProxy.onComplete = commandComplete;
			checkUpdateProxy.init();
		}
	}
}
