package de.bigsource.zarkov.controller.startup 
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import air.update.ApplicationUpdater;

	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.notifications.ApplicationNotifications;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	import flash.filesystem.File;

	public class StartupReadyCommand extends SimpleCommand
	{
		private var updater : ApplicationUpdater;

		override public function execute( p_note : INotification ) : void 
		{
			Trace.info("StartupReadyCommand");
			
			sendNotification(ApplicationNotifications.ON_STARTUP_FINISH);
		}
	}
}