package de.bigsource.zarkov.model.ant
{
	import de.bigsource.zarkov.Application;
	import de.bigsource.zarkov.ApplicationFacade;
	import de.bigsource.zarkov.model.BuildProxy;
	import de.bigsource.zarkov.model.PropertyBuilder;

	public class EchoTask extends AntTask
	{
		private var _buildProxy : BuildProxy;
		private var _message : String;
		private var _level : String;
		private var _append : Boolean;

		public function EchoTask(p_target : AntTarget, p_task : XML, p_properties : Array) 
		{
			_buildProxy = ApplicationFacade.getInstance(Application.NAME).retrieveProxy(BuildProxy.NAME) as BuildProxy;
			
			properties = p_properties;
			name = p_task.name();
			antTarget = p_target;
			_message = PropertyBuilder.checkString(p_task.@message, p_properties);
			if(_message == "")
			{
				_message = PropertyBuilder.checkString(p_task.text().toXMLString(), p_properties);			}
			
			_level = PropertyBuilder.checkString(p_task.@level, p_properties);
			if(_level == "")
			{
				_level = "warning";
			}
			
			_append = PropertyBuilder.checkBoolean(p_task.@append, p_properties);
			
			super();
		}

		//file 	the file to write the message to. 	Optionally one of these may be specified.
		//output 	the Resource to write the message to (see note). Since Ant 1.8
		//append 	Append to an existing file (or open a new file / overwrite an existing file)? Default false. 	No; ignored unless output indicates a filesystem destination.
		//level 	Control the level at which this message is reported. One of "error", "warning", "info", "verbose", "debug" (decreasing order) 	No - default is "warning".
		//encoding 	encoding to use, default is ""; the local system encoding. since Ant 1.7

		override public function execute() : void 
		{
			_buildProxy.addMessage("[" + _level + "] " + _message, antTarget.currentIndex);			_buildProxy.buildComplete(this);
		}
	}
}