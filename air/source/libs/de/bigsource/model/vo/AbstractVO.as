package de.bigsource.model.vo 
{
	/**
	 * @author kimchristiansen
	 */
	public class AbstractVO 
	{
		public function setData(p_data:*):void
		{
			for(var prop:* in p_data) 
			{
				try{
					this[prop] = p_data[prop];				
				}
				catch( e:Error )
				{
//					Trace.error("Value not in VO: " + prop);
				}
			}
		}
	}
}
