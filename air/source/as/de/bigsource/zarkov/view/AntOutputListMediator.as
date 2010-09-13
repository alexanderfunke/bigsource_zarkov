package de.bigsource.zarkov.view 
{
	import de.bigsource.zarkov.model.AntFilesProxy;
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.notifications.BuildNotifications;
	import de.bigsource.zarkov.view.components.UIAntOutputList;
	import de.bigsource.zarkov.view.events.AntOutputListEvent;

	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	public class AntOutputListMediator extends Mediator implements IMediator
	{
		public static const NAME : String = "AntOutputListMediator";

		private var _antFilesProxy : AntFilesProxy;
		private var _buildProxy : BuildProxy;

		public function AntOutputListMediator( p_viewComponent : Object )
		{
			super(NAME, p_viewComponent);
		}

		override public function onRegister() : void
		{
			_antFilesProxy = facade.retrieveProxy(AntFilesProxy.NAME) as AntFilesProxy;
			_buildProxy = facade.retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
			_ui.addEventListener(AntOutputListEvent.ON_DOUBLE_CLICK, onShowOutputDetail, false, 0, true);			_ui.addEventListener(AntOutputListEvent.ON_CLEAR_LIST, onClearList, false, 0, true);
		}

		private function onClearList(event : AntOutputListEvent) : void 
		{
			sendNotification(BuildNotifications.ON_CLEAR_REQUEST);
		}

		private function onShowOutputDetail(event : AntOutputListEvent) : void 
		{
			sendNotification(BuildNotifications.ON_SET_BUILDID_REQUEST, event.outputVO.id);
		}

		override public function listNotificationInterests( ) : Array
		{
			return [BuildNotifications.ON_BUILD_RESPONSE];
		}

		override public function handleNotification( p_note : INotification ) : void
		{
			switch ( p_note.getName() ) 
			{
				case BuildNotifications.ON_BUILD_RESPONSE:
					_ui.vo = _buildProxy.targets;
					break;
			}
		}

		override public function onRemove() : void
		{
			_ui.destroy();
		}

		protected function get _ui() : UIAntOutputList
		{
			return viewComponent as UIAntOutputList;
		}
	}
}