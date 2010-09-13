package de.bigsource.zarkov 
{
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.controller.AntFilesCommand;
	import de.bigsource.zarkov.controller.BuildCommand;
	import de.bigsource.zarkov.controller.LinkoutCommand;
	import de.bigsource.zarkov.controller.ApplicationUpdaterCommand;
	import de.bigsource.zarkov.controller.startup.StartupCommand;
	import de.bigsource.zarkov.notifications.AntFilesNotifications;
	import de.bigsource.zarkov.notifications.ApplicationNotifications;
	import de.bigsource.zarkov.notifications.BuildNotifications;

	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.facade.Facade;

	import flash.display.Stage;

	public class ApplicationFacade extends Facade implements IFacade 
	{ 

		private var _ar_proxy : Array;
		private var _ar_mediator : Array;
		private var _stage : Stage;
		private var _application : Application;

		public function ApplicationFacade( p_key : String )
		{
			super(p_key);    
		}

		public static function getInstance( p_key : String ) : ApplicationFacade 
		{
			if ( instanceMap[ p_key ] == null ) instanceMap[ p_key ] = new ApplicationFacade(p_key);
			return instanceMap[ p_key ] as ApplicationFacade;
		}

		public function startup( p_ui : Application , p_stage : Stage) : void  
		{  
			_application = p_ui;
			_stage = p_stage;
			sendNotification(ApplicationNotifications.ON_STARTUP_START, p_ui); 
		}

		override protected function initializeController( ) : void  
		{ 
			super.initializeController();
			
			registerCommand(ApplicationNotifications.ON_STARTUP_START, StartupCommand);

			registerCommand(ApplicationNotifications.ON_LINKOUT, LinkoutCommand);
						registerCommand(BuildNotifications.ON_BUILD_REQUEST, BuildCommand);
			registerCommand(BuildNotifications.ON_CLEAR_REQUEST, BuildCommand);						registerCommand(AntFilesNotifications.ON_FILE_ADD_REQUEST, AntFilesCommand);			registerCommand(AntFilesNotifications.ON_FILE_REMOVE_REQUEST, AntFilesCommand);			registerCommand(AntFilesNotifications.ON_FILELIST_REFRESH_REQUEST, AntFilesCommand);
			registerCommand(AntFilesNotifications.ON_FILELIST_SORT_REQUEST, AntFilesCommand);									registerCommand(ApplicationNotifications.ON_UPDATE_CHECK_REQUEST, ApplicationUpdaterCommand);
					}


		private function removeAllMediators() : void
		{
			var arTemp : Array = new Array().concat(_ar_mediator);
			
			for each( var name:String in arTemp)
			{
				Trace.debug("REMOVE MEDIATOR: " + name);
				removeMediator(name);
			}
		}

		override public function registerMediator(mediator : IMediator) : void
		{
			if (_ar_mediator == null) 
			{
				_ar_mediator = new Array();
			}
			
			_ar_mediator.push(mediator.getMediatorName());
			super.registerMediator(mediator);
		}

		override public function removeMediator(mediatorName : String) : IMediator
		{
			_ar_mediator.splice(_ar_mediator.indexOf(mediatorName), 1);
			return super.removeMediator(mediatorName);
		}
		

		private function removeAllProxies() : void
		{
			var arTemp : Array = new Array().concat(_ar_proxy);
			
			for each( var name:String in arTemp)
			{
				Trace.debug("REMOVE PROXY: " + name);
				removeProxy(name);
			}
		}

		override public function registerProxy(proxy : IProxy) : void
		{
			if (_ar_proxy == null) 
			{
				_ar_proxy = new Array();
			}
			
			_ar_proxy.push(proxy.getProxyName());
			super.registerProxy(proxy);
		}
		
		override public function removeProxy(proxyName : String) : IProxy
		{
			_ar_proxy.splice(_ar_proxy.indexOf(proxyName), 1);
			return super.removeProxy(proxyName);
		}
		
		public function destroy(p_key : String) : void
		{
			removeAllMediators();
			removeAllProxies();
			Facade.removeCore(p_key);
		}

		public function get application() : Application
		{
			return _application;
		}
	} 
} 
