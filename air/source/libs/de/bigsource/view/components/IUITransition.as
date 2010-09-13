package de.bigsource.view.components 
{
	import de.bigsource.view.components.IUI;	

	/**
	 * @author kimchristiansen
	 */
	public interface IUITransition extends IUI
	{
		function set vo(p_vo : *) : void
		function lock() : void
		function unlock() : void	
	}
}
