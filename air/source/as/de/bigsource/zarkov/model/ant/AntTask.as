package de.bigsource.zarkov.model.ant
{
	import flash.events.EventDispatcher;

	/**
	 * @author alexanderfunke
	 */
	public class AntTask extends EventDispatcher
	{
		public var name:String;
		public var properties: Array;
		public var targetID : uint;		public var antTarget : AntTarget;		public var depends : Array;

		public function AntTask() 
		{
			depends = new Array();
		}
		
		public function execute():void
		{
			
		}
	}
}
