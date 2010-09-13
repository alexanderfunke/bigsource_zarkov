package de.bigsource.zarkov.controller 
{
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.notifications.AntFilesNotifications;
	import de.bigsource.zarkov.model.AntFilesProxy;
	import de.bigsource.zarkov.notifications.ApplicationNotifications;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	/**
	 * @author kimchristiansen
	 */
	public class AntFilesCommand extends SimpleCommand
	{	
		override public function execute( p_note : INotification ) : void 
		{
			
			var antFilesProxy:AntFilesProxy = facade.retrieveProxy(AntFilesProxy.NAME) as AntFilesProxy;
			
			switch( p_note.getName())
			{
				case AntFilesNotifications.ON_FILE_ADD_REQUEST:
					antFilesProxy.add(p_note.getBody() as String);
					break;
					
				case AntFilesNotifications.ON_FILE_REMOVE_REQUEST:
					antFilesProxy.remove(p_note.getBody() as String);
					break;
					
				case AntFilesNotifications.ON_FILELIST_REFRESH_REQUEST:
					Trace.debug("ON_FILELIST_REFRESH_REQUEST");
					antFilesProxy.refresh();
					break;
				
				case AntFilesNotifications.ON_FILELIST_SORT_REQUEST:
					antFilesProxy.sort();
					break;

			}
		}
	}
}
