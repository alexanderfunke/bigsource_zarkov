package de.bigsource.zarkov.model 
{
	import de.bigsource.zarkov.model.database.AntTaskMessages;
	import de.bigsource.zarkov.model.database.AntTargets;

	/**	 * @author alexanderfunke	 */	public class DBTables 
	{

		protected var anttargets : AntTargets;		protected var anttaskmessages : AntTaskMessages;
		
		public static const ANTTARGETS : String = "AntTargets";		public static const ANTTASK_MESSAGES : String = "AntTaskMessages";	}}