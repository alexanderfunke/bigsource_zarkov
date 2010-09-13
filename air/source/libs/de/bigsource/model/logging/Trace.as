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
 * @author kimchristiansen
 */
package de.bigsource.model.logging {
	import de.bigsource.model.logging.IPublisher;
	public class Trace
	{

		private static var _publisher : IPublisher;
		public static var minLogLevel : int = 0;

		public function Trace() 		{
		}

		/**
		 * Add Publisher
		 * 
		 * @example Trace.addPublisher(new SOSPublisher("AS3 Test", "127.0.0.1", 4445));
		 */		public static function addPublisher(logTarget : IPublisher) : void 		{
			_publisher = logTarget;
		}

		/**
		 * Remove Publisher
		 */
		public static function removePublisher() : void
		{
			_publisher.destroy();
			_publisher = null;
		}

		/**
		 * Log DEBUG
		 */
		public static function debug(p_obj : *) : void 		{
			if( LogLevel.DEBUG >= minLogLevel && _publisher != null)
			{
				var m : LogItem = new LogItem();
				m.data = p_obj;
				m.level = LogLevel.DEBUG;
				m.logdate = new Date();
			
				_publisher.sendLogItem(m);
			}
		}

		/**
		 * Log INFO
		 */
		public static function info(p_obj : *) : void 		{
			if( LogLevel.INFO >= minLogLevel && _publisher != null)
			{
				var m : LogItem = new LogItem();
				m.data = p_obj;
				m.level = LogLevel.INFO;
				m.logdate = new Date();
			
				_publisher.sendLogItem(m);
			}
		}

		/**
		 * Log WARN
		 */			public static function warn(p_obj : *) : void 
		{
			if( LogLevel.WARN >= minLogLevel && _publisher != null)
			{
				var m : LogItem = new LogItem();
				m.data = p_obj;
				m.level = LogLevel.WARN;
				m.logdate = new Date();
		
				_publisher.sendLogItem(m);
			}
		}

		/**
		 * Log ERROR
		 */	
		public static function error(p_obj : *) : void 
		{
			if( LogLevel.ERROR >= minLogLevel && _publisher != null)
			{
				var m : LogItem = new LogItem();
				m.data = p_obj;
				m.level = LogLevel.ERROR;
				m.logdate = new Date();
		
				_publisher.sendLogItem(m);
			}
		}

		/**
		 * Log FATAL
		 */		public static function fatal(p_obj : *) : void 
		{
			if( LogLevel.FATAL >= minLogLevel && _publisher != null )
			{
				var m : LogItem = new LogItem();
				m.data = p_obj;
				m.level = LogLevel.FATAL;
				m.logdate = new Date();
		
				_publisher.sendLogItem(m);
			}
		}
	}
}
