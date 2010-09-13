package de.bigsource.model 
{
	import de.bigsource.model.logging.Trace;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;	

	/**
	 * @author kimchristiansen
	 */
	public class ExternalLinkProxy extends Proxy implements IProxy 
	{
		public static const NAME:String = "ExternalLinkProxy";
		
		public function ExternalLinkProxy() 
		{
			super(NAME);
		}
		
		public function getURL(p_url : String, p_window : String = "_self") : void
		{
			var req : URLRequest = new URLRequest(p_url);

			try
			{
				navigateToURL(req, p_window);
			}
			catch (e : Error)
			{
				Trace.warn("Navigate to URL failed" + e.message);
			}
		}
		
		override public function onRemove() : void
		{
		}
	}
}
