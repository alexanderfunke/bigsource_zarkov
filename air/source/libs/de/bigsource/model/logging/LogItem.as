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
 
/**
 * Log item class storing logging information
 *  * @author kimchristiansen */
package de.bigsource.model.logging 
{	public class LogItem 
	{
		public var data : *;					// stores logging data		public var level : int;				// loglevel		public var logdate : Date;				// date of logging
		public var fileName : String;				// mtasc param - file name of executed trace
		public var functionname : String;			// mtasc param - function name of executed trace		public var lineNumber : int;	// mtasc param - line number of executed trace	}}