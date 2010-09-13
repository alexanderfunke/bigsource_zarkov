package de.bigsource.zarkov.controller.startup 
{
	import de.bigsource.model.logging.startpage.StartpagePublisher;
	import de.bigsource.model.logging.Trace;
	import de.bigsource.model.logging.demonsterdebugger.DeMonsterDebuggerPublisher;
	import de.bigsource.zarkov.ApplicationFacade;

	import nl.demonsters.debugger.MonsterDebugger;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class StartupLoggingCommand extends SimpleCommand
	{	

		override public function execute( p_note : INotification ) : void 
		{	
			
			Trace.info("Logging inited with loglevel: 1");
			Trace.minLogLevel = 1;
			
//			Trace.addPublisher(new StartpagePublisher());
			
			new MonsterDebugger(ApplicationFacade(facade));

			var publisher : DeMonsterDebuggerPublisher = new DeMonsterDebuggerPublisher();
			Trace.addPublisher(publisher);
			
			trace("StartupLoggingCommand");

		}
	}
}
