package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.ACompcProxy;

	public class ACompc extends Compc 
	{
		private var _acompcProxy : ACompcProxy;

		public function ACompc(p_target:AntTarget, p_task : XML, p_properties : Array)
		{
			_acompcProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(ACompcProxy.NAME) as ACompcProxy;
    	
			super(p_target, p_task, p_properties);
		}

		override public function execute() : void 
		{
			var output : Array = new Array();

			for (var key : String in _options) 
			{
				output = buildCommand(key, output);
			}
		
			checkPreconditions();

			_acompcProxy.call(output, this, sdk);
		}
	}
}
