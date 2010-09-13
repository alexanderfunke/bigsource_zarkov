/*
 PureMVC MultiCore Utility for AS3 - AsyncCommand
 Copyright(c) 2008 Duncan Hall <duncan.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.interfaces 
{
	 
	/** 
	 * Interface for an Asynchronous Command.
	 */ 
	public interface IAsyncCommand extends ICommand 
	{
	
		/**
		 * Registers the callback for a parent <code>AsyncMacroCommand</code>.  
		 * 
		 * @param value	The <code>AsyncMacroCommand</code> method to call on completion
		 */
		function setOnComplete ( value:Function ) : void
	
	}
}
