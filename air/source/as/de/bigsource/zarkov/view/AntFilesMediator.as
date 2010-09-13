package de.bigsource.zarkov.view 
{
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.model.ant.AntTarget;
	import de.bigsource.zarkov.notifications.BuildNotifications;
	import de.bigsource.zarkov.notifications.AntFilesNotifications;
	import de.bigsource.zarkov.model.AntFilesProxy;
	import de.bigsource.zarkov.notifications.ApplicationNotifications;
	import de.bigsource.zarkov.view.components.UIAntFiles;
	import de.bigsource.zarkov.view.events.AntFilesEvent;

	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	/**
	 * @author kimchristiansen
	 */
	public class AntFilesMediator extends Mediator implements IMediator
	{
		public static const NAME : String = "AntFilesMediator";

		private var _antFilesProxy : AntFilesProxy;

		public function AntFilesMediator( p_viewComponent : Object )
		{
			super(NAME, p_viewComponent);
		}

		override public function onRegister() : void
		{
			_antFilesProxy = facade.retrieveProxy(AntFilesProxy.NAME) as AntFilesProxy;
			
			_ui.addEventListener(AntFilesEvent.ON_BUILD_START, onStartBuild, false, 0, true);			_ui.addEventListener(AntFilesEvent.ON_FILE_ADD, onAddBuildXML, false, 0, true);			_ui.addEventListener(AntFilesEvent.ON_FILELIST_REFRESH, onRefreshFiles, false, 0, true);			_ui.addEventListener(AntFilesEvent.ON_FILELIST_SORT, onSortFiles, false, 0, true);			_ui.addEventListener(AntFilesEvent.ON_FILE_REMOVE, onRemoveFile, false, 0, true);
		}

		private function onRemoveFile(event : AntFilesEvent) : void 
		{
			sendNotification(AntFilesNotifications.ON_FILE_REMOVE_REQUEST, String(event.data));
		}

		private function onSortFiles(event : AntFilesEvent) : void 
		{
			sendNotification(AntFilesNotifications.ON_FILELIST_SORT_REQUEST);
			Trace.debug("onSortFiles");
		}

		private function onRefreshFiles(event : AntFilesEvent) : void 
		{
			Trace.debug("onRefreshFiles");
			sendNotification(AntFilesNotifications.ON_FILELIST_REFRESH_REQUEST);
		}

		private function onAddBuildXML(event : AntFilesEvent) : void 
		{
			sendNotification(AntFilesNotifications.ON_FILE_ADD_REQUEST, String(event.data));
		}

		private function onStartBuild(event : AntFilesEvent) : void 
		{
			sendNotification(BuildNotifications.ON_BUILD_REQUEST, AntTarget(event.data));
		}

		override public function listNotificationInterests( ) : Array
		{
			return [AntFilesNotifications.ON_FILELIST_REFRESH_RESPONSE,
					ApplicationNotifications.ON_STARTUP_FINISH];
		}

		override public function handleNotification( p_note : INotification ) : void
		{
			switch ( p_note.getName() ) 
			{
				case AntFilesNotifications.ON_FILELIST_REFRESH_RESPONSE:
					_ui.vo = _antFilesProxy.buildfiles;
					break;
				case ApplicationNotifications.ON_STARTUP_FINISH:
					_ui.vo = _antFilesProxy.buildfiles;
					break;
			}
		}

		override public function onRemove() : void
		{
			_ui.destroy();
		}

		protected function get _ui() : UIAntFiles
		{
			return viewComponent as UIAntFiles;
		}
	}
}