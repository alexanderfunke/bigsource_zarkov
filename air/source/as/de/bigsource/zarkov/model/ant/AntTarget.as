package de.bigsource.zarkov.model.ant
{

	/**
	 * @author alexanderfunke
	 */
	public class AntTarget extends AntElement
	{
		public var antFile:AntFile;
		public var isDefault : Boolean = false;
		public var currentIndex : int;
		public var dependendTaskNames : Array;
		public var dependendTasks : Array;

		public function AntTarget() 
		{
			super();
			dependendTaskNames = [];
			dependendTasks = [];
		}
	}
}
