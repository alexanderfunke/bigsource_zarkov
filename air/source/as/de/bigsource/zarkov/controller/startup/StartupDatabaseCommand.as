package de.bigsource.zarkov.controller.startup 
{
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.model.DatabaseProxy;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

	public class StartupDatabaseCommand extends AsyncCommand
	{

		override public function execute( p_note : INotification ) : void
		{
			Trace.info("StartupDatabaseCommand");
			
			var databaseProxy : DatabaseProxy = facade.retrieveProxy(DatabaseProxy.NAME) as DatabaseProxy;
			databaseProxy.onComplete = commandComplete;
			databaseProxy.initDatabase();
		}
	}
}
