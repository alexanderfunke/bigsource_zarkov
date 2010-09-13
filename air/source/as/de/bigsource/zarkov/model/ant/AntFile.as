package de.bigsource.zarkov.model.ant
{

	/**
	 * @author alexanderfunke
	 */
	public class AntFile extends AntElement
	{
		public var path:String;		public var hasError : Boolean = false;

		public function AntFile() {
			super();
		}

		public function destroy() : void 
		{
			
		}
	}
}
