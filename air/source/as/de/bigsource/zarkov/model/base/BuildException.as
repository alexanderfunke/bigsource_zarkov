package de.bigsource.zarkov.model.base 
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.BuildProxy;

	/**
	 * @author alexanderfunke
	 */
	public class BuildException
	{

		public function BuildException(p_message : String, p_id : int) 
		{
			var buildProxy : BuildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
			buildProxy.callException(p_message, p_id);
		}
	}
}
