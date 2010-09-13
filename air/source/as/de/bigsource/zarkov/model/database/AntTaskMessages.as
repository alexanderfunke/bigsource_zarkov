package de.bigsource.zarkov.model.database 
{
	import de.bigsource.model.database.base.AbstractTable;
	import de.bigsource.model.database.base.Relation;

	/**
	 * @author alexanderfunke
	 */
	public class AntTaskMessages extends AbstractTable 
	{
		
		public var belongs_to_anttargets : Relation;
		
		public var message:String;		public var anttarget_id:int;
		
		public static function clone() : AntTaskMessages
		{
			return new AntTaskMessages();	
		}
	}
}
