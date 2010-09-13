package de.bigsource.zarkov.controller.startup 
{
	import de.bigsource.model.ExternalLinkProxy;
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.model.ACompcProxy;
	import de.bigsource.zarkov.model.AdlProxy;
	import de.bigsource.zarkov.model.AdtProxy;
	import de.bigsource.zarkov.model.AmxmlcProxy;
	import de.bigsource.zarkov.model.AntFilesProxy;
	import de.bigsource.zarkov.model.AsDocProxy;
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.model.DatabaseProxy;
	import de.bigsource.zarkov.model.FcshProxy;
	import de.bigsource.zarkov.model.HaxeProxy;
	import de.bigsource.zarkov.model.MtascProxy;
	import de.bigsource.zarkov.model.UpdaterProxy;

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class StartupModelCommand extends SimpleCommand
	{
		
		override public function execute( p_note : INotification ) : void
		{
			Trace.info("StartupModelCommand");
			facade.registerProxy(new ExternalLinkProxy());
	}
}