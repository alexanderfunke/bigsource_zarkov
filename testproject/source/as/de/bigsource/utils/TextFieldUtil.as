package de.bigsource.utils 
{
	import flash.text.TextField;	
	
	/**
	 * @author kimchristiansen
	 */
	public class TextFieldUtil 
	{
		public static function adjustWidth( p_txt : TextField, p_width : int, p_replace : String = "", p_wholeword : Boolean = false) : Boolean
		{
			if( p_txt.width < p_width)
			{
				return false;
			}
			
			var cut_txt : String = p_txt.text;
			var cut_index:int;
			
			while( p_txt.width > p_width )
			{
				if( p_wholeword )
				{
					cut_index = cut_txt.lastIndexOf(" ");
				}else
				{		
					cut_index = cut_txt.length - 1;		
				}
				
				cut_index = cut_index < 0 ? 0 : cut_index;
				cut_txt = cut_txt.substr(0, cut_index);
				p_txt.text = cut_txt + p_replace;
			}
			
			return true;
		}
	}
}
