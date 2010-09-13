/**
 * $Id$
 * $Date$
 * Source by BigSource Alexander Funke und Kim Christiansen GbR
 * Visit blog.bigsource.de for updates and more free code.
 * Please contact info@bigsource.de for more information.
 */

/**
 * Copyright (c) 2008 BigSource Alexander Funke und Kim Christiansen GbR
 * 
 * Permission is hereby granted, free of charge, to any person 
 * obtaining a copy of this software and associated documentation 
 * files (the "Software"), to deal in the Software without 
 * restriction, including without limitation the rights to use, 
 * copy, modify, merge, publish, distribute, sublicense, and/or sell 
 * copies of the Software, and to permit persons to whom the 
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
 * OTHER DEALINGS IN THE SOFTWARE.
 */

package de.bigsource.utils 
{

	public class StringUtil 
	{

		private static var _lb : String = " \n\r\t";

		/**
		 * String replacement function.
		 * @param string Original string
		 * @param oldValue A string to be replaced
		 * @param newValue A string to replace all occurrences of oldValue. 
		 */
		public static function replace(p_string : String, p_oldValue : String, p_newValue : String) : String 
		{
			return p_string.split(p_oldValue).join(p_newValue);
		} 

		public static function WithLeadingZero(p_number : int) : String
		{
			if(p_number < 10)			{
				return "0" + p_number.toString();
			}
			return p_number.toString();	
		}

		public static function trimRight(p_str : String) : String
		{ 			if (p_str)
			{ 				var i : int = p_str.length;
				while (--i > -1)
				{ 					if (_lb.indexOf(p_str.charAt(i)) < 0)
					{ 						return p_str.substr(0, i + 1);
					} 				} 			}
			return '';
		}

		public static function trimLeft(p_str : String) : String
		{ 			if (p_str)
			{ 				var i : int = -1;
				while (++i < p_str.length)
				{ 					if (_lb.indexOf(p_str.charAt(i)) < 0)
					{ 						return p_str.substr(i);
					} 				} 			}
			return '';
		}

		public static function trim(p_str : String) : String		{
			return trimRight(trimLeft(p_str));
		}
	}
}