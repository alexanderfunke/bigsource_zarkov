/**
 * $Id: ColorUtil.as 47 2008-02-15 13:36:09Z Kim.Christiansen $
 * $Date: 2008-02-15 14:36:09 +0100 (Fri, 15 Feb 2008) $
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

	/**
	 * @author kimc
	 * @version 0.5
	 * @category Utils
	 * @example	The following code returns the blue value of the hexcolor 0xCC6699
	 * <listing version="3.0" >
	 * getBlue(0xcc6699);
	 * </listing>
	 */
	public class ColorUtil
	{
		public static function getAlpha( p_hexcolor : Number ) : Number
		{
			var a : Number = (p_hexcolor >> 24) & 0xff;
			if( a > 255 ) a = 255;
			return a;
		}

		public static function getRed( p_hexcolor : Number ) : Number
		{
			var r : Number = p_hexcolor >> 16;
			if( r > 255 ) r = 255;
			return r;
		}

		public static function getGreen( p_hexcolor : Number ) : Number
		{
			var g : Number = (p_hexcolor >> 8) & 0xff;
			if( g > 255 ) g = 255;
			return g;
		}

		public static function getBlue( p_hexcolor : Number ) : Number
		{
			var b : Number = p_hexcolor & 0xff;
			if( b > 255 ) b = 255;
			return b;
		}

		/**
		 * returns a hex value 
		 */
		public static function RGBtoHEX24(r : Number, g : Number, b : Number) : Number
		{
			return (r << 16 | g << 8 | b); 
		}

		/**
		 * returns a hex value 
		 */
		public static function RGBtoHEX32(a : Number, r : Number, g : Number, b : Number) : Number
		{
			return (a << 24 | r << 16 | g << 8 | b); 
		}

		/**
		 * returns a hex Number to a hex string
		 * hex value can be rgb and argb
		 */
		public static function hexToString(p_hex : Number) : String 
		{
			return (((p_hex >> 24) != 0) ? Number(p_hex >>> 24).toString(16) : "") + Number(p_hex & 0xFFFFFF).toString(16);
		}
	}
}
