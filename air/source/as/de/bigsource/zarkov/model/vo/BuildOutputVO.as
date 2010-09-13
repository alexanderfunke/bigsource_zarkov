package de.bigsource.zarkov.model.vo 
{
	import de.bigsource.model.vo.AbstractVO;

	/**
	 * @author alexanderfunke
	 */
	public class BuildOutputVO extends AbstractVO 
	{
		public var taskName:String;
		public var duration : String;

		public function BuildOutputVO()
		{
			messages = [];
		}
	}
}