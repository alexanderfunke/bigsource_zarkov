package de.bigsource.zarkov.model.database 
{
	import de.bigsource.model.database.base.AbstractTable;
	import de.bigsource.model.database.base.Relation;

	/**
	 * @author alexanderfunke
	 */
	public class AntTargets extends AbstractTable 
	{
		
		public var has_many_anttaskmessages : Relation;
		
		public var taskName:String;
		public var state:String;
		public var projectName:String;
		public var lastMessage : String;
		public var targetName : String;
		public var startTime : Date;
		public var endTime : Date;

		public static function clone() : AntTargets
		{
			return new AntTargets();	
		}
	}
}
