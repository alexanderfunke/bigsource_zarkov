package de.bigsource.zarkov.view.events 
{
	import de.bigsource.zarkov.model.vo.BuildOutputVO;

	import flash.events.Event;

	public class AntOutputListEvent extends Event 
	{
		public static const ON_DOUBLE_CLICK:String = "AntOutputListEvent.ON_DOUBLE_CLICK";		public static const ON_CLEAR_LIST:String = "AntOutputListEvent.ON_CLEAR_LIST";		public var outputVO : BuildOutputVO;

		public function AntOutputListEvent(type : String, p_outputVO:BuildOutputVO = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			outputVO = p_outputVO;
		}
	}
}
