package de.bigsource.zarkov.controller.startup 
{
	import de.bigsource.zarkov.view.BuildDetailsMediator;
	import de.bigsource.zarkov.view.AntFilesMediator;
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.view.AntOutputListMediator;
	import de.bigsource.model.logging.Trace;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class StartupMediatorCommand extends SimpleCommand
	{
		
		override public function execute( p_note : INotification ) : void 
		{
			Trace.info("StartupReadyCommand");
			
			var app:Application = ApplicationFacade.getInstance(Application.NAME).application;
			facade.registerMediator(new AntOutputListMediator(app.overview.antOutputList));			facade.registerMediator(new AntFilesMediator(app.overview.antFiles));			facade.registerMediator(new BuildDetailsMediator(app.overview.buildDetails));
		}
	}
}