/** * $Id$ * $Date$ * Source by BigSource Alexander Funke und Kim Christiansen GbR * Visit blog.bigsource.de for updates and more free code. * Please contact info@bigsource.de for more information. *//** * Copyright (c) 2008 BigSource Alexander Funke und Kim Christiansen GbR *  * Permission is hereby granted, free of charge, to any person  * obtaining a copy of this software and associated documentation  * files (the "Software"), to deal in the Software without  * restriction, including without limitation the rights to use,  * copy, modify, merge, publish, distribute, sublicense, and/or sell  * copies of the Software, and to permit persons to whom the  * Software is furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be  * included in all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,  * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES  * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND  * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT  * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,  * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR  * OTHER DEALINGS IN THE SOFTWARE. */package de.bigsource.utils {	/**	 * @author Alexander Funke (alexander.funke@bigsource.de)	 * @version 0.5	 * @category Utils	 */	 	public class ArrayUtil	{		/**		 * Joins a property of an Array with the given delimiter		 * @param p_ar Array Sourcearray		 * @param p_delimiter String Stringdelimiter		 * @param p_prop String Property of the Array		 */		public function propJoin(p_ar:Array, p_delimiter:String, p_prop:String):String		{			var ar_tmp:Array = new Array();			for(var i:Number = 0;i<p_ar.length;i++)			{				ar_tmp.push(p_ar[i][p_prop]);					}			return ar_tmp.join(p_delimiter);		}	}}