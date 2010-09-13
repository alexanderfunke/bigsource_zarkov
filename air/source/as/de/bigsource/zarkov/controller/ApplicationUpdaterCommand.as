package de.bigsource.zarkov.controller 
{
	import de.bigsource.zarkov.model.UpdaterProxy;
	import de.bigsource.zarkov.notifications.ApplicationNotifications;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class ApplicationUpdaterCommand extends SimpleCommand
	{	
		override public function execute( p_note : INotification ) : void 
		{
			var updaterProxy : UpdaterProxy = facade.retrieveProxy(UpdaterProxy.NAME) as UpdaterProxy;
			
			switch( p_note.getName())
			{
				case ApplicationNotifications.ON_UPDATE_CHECK_REQUEST:
					updaterProxy.check();
					break;
			}
		}
	}
}
