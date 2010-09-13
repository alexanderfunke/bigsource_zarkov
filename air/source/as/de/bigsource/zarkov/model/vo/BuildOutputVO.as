package de.bigsource.zarkov.model.vo 
{
	import de.bigsource.model.vo.AbstractVO;

	/**
	 * @author alexanderfunke
	 */
	public class BuildOutputVO extends AbstractVO 
	{
		public var taskName:String;		public var messages:Array;		public var state:String;		public var targetName:String;		public var projectName:String;		public var lastMessage : String;		public var id : int;
		public var duration : String;

		public function BuildOutputVO()
		{
			messages = [];
		}
	}
}
