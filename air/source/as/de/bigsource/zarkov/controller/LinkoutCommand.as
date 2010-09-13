package de.bigsource.zarkov.controller 
{
	import de.bigsource.model.ExternalLinkProxy;
	import de.bigsource.zarkov.notifications.ApplicationNotifications;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	/**
	 * @author kimchristiansen
	 */
	public class LinkoutCommand extends SimpleCommand
	{	
		override public function execute( p_note : INotification ) : void 
		{
			var externalLinkProxy : ExternalLinkProxy = facade.retrieveProxy(ExternalLinkProxy.NAME) as ExternalLinkProxy;
			
			switch( p_note.getName())
			{
				case ApplicationNotifications.ON_LINKOUT:
					externalLinkProxy.getURL(p_note.getBody() as String, "_blank");
					break;
			}
		}
	}
}
