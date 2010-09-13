package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.AmxmlcProxy;
	import de.bigsource.zarkov.model.base.BuildException;

	public class Amxmlc extends Mxmlc 
	{
		private var _amxmlcProxy : AmxmlcProxy;

		public function Amxmlc(p_target:AntTarget, p_task : XML, p_properties : Array) 
		{
			_amxmlcProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(AmxmlcProxy.NAME) as AmxmlcProxy;
			
			super(p_target, p_task, p_properties);
		}

		override public function execute() : void 
		{
			
			if (_basedir == null) 
			{
				new BuildException("You have to specify a basedir.", targetID);
				return;
			}
			
			var file_specs : Array = _args["file-specs"];
			if (file_specs == null) 
			{
				new BuildException("Please specify the main class with <file_specs.../>", targetID);
				return;
			}
			
			var output : Array = new Array();

			for (var key : String in _options) 
			{
				output = buildCommand(key, output);
			}
		
			checkPreconditions();

			_amxmlcProxy.call(output, this, sdk);
		}
	}
}
