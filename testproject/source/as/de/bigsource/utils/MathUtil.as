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
	/**
	 * @author KimC
	 */
	public class MathUtil 
	{
		/**
		 * No instance allowed
		 */
		public function MathUtil() 
		{
		}
		/**
		 * Converts passed-in {@code angle} angle in radian.
		 * 
		 * @param p_angle Angle in degree 
		 * @return Radian convertion
		 */
		public static function toRadian( p_angle : Number ) : Number
		{
			return (p_angle * Math.PI) / 180;
		}
		/**
		 * Converts passed-in {@code angle} angle in degree.
		 * 
		 * @param p_angle Angle in radian
		 * @return Radian convertion
		 */
		public static function toDegre( p_angle : Number ) : Number
		{
			return ( p_angle * 180 ) / Math.PI;
		}
		/**
		 * Calculates distance between two points
		 * 
		 * @param p_x1 first x value		 * @param p_y1 first y value		 * @param p_x2 second x value		 * @param p_y2 second y value
		 * 
		 * @return distance calculation
		 */
		public static function calcDistance( p_x1 : Number, p_y1 : Number, p_x2 : Number, p_y2 : Number ) : Number
		{
			var disx : Number = p_x2 - p_x1;
			var disy : Number = p_y2 - p_y1;
		
			return Math.sqrt((disx * disx) + (disy * disy));
		}
		/**
		 * calculates the column position depending on p_item_nr in a grid
		 * starts with 0
		 * 
		 * @param	p_item_nr	number of the item in grid
		 * @param	p_columns	amount of columns in the grid
		 */
		public static function getColumn(p_item_nr : int, p_columns : int) : int 
		{
			return p_item_nr % p_columns;
		}
		/**
		 * calculates the row position depending on p_item_nr in a grid
		 * starts with 0
		 * 
		 * example grid 4x3:
		 * 
		 * @param	p_item_nr	number of the item in grid
		 * @param	p_columns	amount of columns in the grid
		 */
		public static function getRow(p_item_nr : int, p_columns : int) : int 
		{
			return (p_item_nr - (p_item_nr % p_columns)) / p_columns;
		}
		/**
		 * checks the minimum value of an Number
		 * 
		 * @param	p_min	minimum value
		 * @param	p_val	current value
		 */
		public static function min(p_min : Number, p_val : Number) : int 
		{
			if(p_val < p_min)			{
				return p_min;
			}
			return p_val;
		}
		
		public static function round(p_value : Number, p_behind_comma : Number) : Number
		{
			var multiplier:String = "1";
			for(var i:Number = 0;i<p_behind_comma;i++){
				multiplier+="0";
			}
			
			return Math.round(p_value*int(multiplier)) / int(multiplier);
		}
	}
}