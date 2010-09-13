package de.bigsource.zarkov.controller.startup 
{
	import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

	public class StartupCommand extends AsyncMacroCommand
	{
		override protected function initializeAsyncMacroCommand() : void
		{
			addSubCommand(StartupModelCommand);					// Register Proxys to facade
			addSubCommand(StartupDatabaseCommand);				// Fill the DB
	}
}