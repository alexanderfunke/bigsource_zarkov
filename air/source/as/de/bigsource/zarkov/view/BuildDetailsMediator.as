package de.bigsource.zarkov.view 
{
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.notifications.BuildNotifications;
	import de.bigsource.zarkov.view.components.UIBuildDetails;

	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	public class BuildDetailsMediator extends Mediator implements IMediator
	{
		public static const NAME : String = "BuildDetailsMediator";

		private var _buildProxy : BuildProxy;
		private var _currentOutputVOID : int;

		public function BuildDetailsMediator( p_viewComponent : Object )
		{
			super(NAME, p_viewComponent);
		}

		override public function onRegister() : void
		{
			_buildProxy = facade.retrieveProxy(BuildProxy.NAME) as BuildProxy;
		}

		override public function listNotificationInterests( ) : Array
		{
			return [BuildNotifications.ON_SET_BUILDID_REQUEST,
					BuildNotifications.ON_BUILD_RESPONSE];
		}

		override public function handleNotification( p_note : INotification ) : void
		{
			switch ( p_note.getName() ) 
			{

				case BuildNotifications.ON_SET_BUILDID_REQUEST:
					_currentOutputVOID = p_note.getBody() as int;
					_ui.vo = _buildProxy.outputVO(_currentOutputVOID);
					break;
				case BuildNotifications.ON_BUILD_RESPONSE:
					_ui.vo = _buildProxy.outputVO(_currentOutputVOID);
					break;
				}
		}

		override public function onRemove() : void
		{
			_ui.destroy();
		}

		protected function get _ui() : UIBuildDetails
		{
			return viewComponent as UIBuildDetails;
		}
	}
}