package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.AAsDocProxy;

	public class AAsDoc extends AsDoc
	{
		private var _aasdocProxy : AAsDocProxy;

		public function AAsDoc(p_target:AntTarget, p_task : XML, p_properties : Array)
		{
			_aasdocProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(AAsDocProxy.NAME) as AAsDocProxy;
    	
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

			_aasdocProxy.call(output, this, sdk);
		}
	}
}
