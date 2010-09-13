package de.bigsource.zarkov.controller.startup 
{
	import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

	public class StartupCommand extends AsyncMacroCommand
	{
		override protected function initializeAsyncMacroCommand() : void
		{
			addSubCommand(StartupModelCommand);					// Register Proxys to facade			addSubCommand(StartupLoggingCommand);				// register Logging			addSubCommand(StartupMediatorCommand);				// Link mediators to views			addSubCommand(StartupUpdaterCommand);				// Initialize the Updater
			addSubCommand(StartupDatabaseCommand);				// Fill the DB			addSubCommand(StartupAntFilesCommand);				// Fill antfiles			addSubCommand(StartupReadyCommand);					// dispatch ready		}
	}
}
