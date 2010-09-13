package de.bigsource.zarkov.controller 
{
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.model.ant.AntTarget;
	import de.bigsource.zarkov.notifications.BuildNotifications;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class BuildCommand extends SimpleCommand
	{	
		override public function execute( p_note : INotification ) : void 
		{
			
			var buildProxy:BuildProxy = facade.retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
			switch( p_note.getName())
			{
				case BuildNotifications.ON_BUILD_REQUEST:
					buildProxy.build(p_note.getBody() as AntTarget);
					break;
				case BuildNotifications.ON_CLEAR_REQUEST:
					buildProxy.clear();
					break;
			}
		}
	}
}
