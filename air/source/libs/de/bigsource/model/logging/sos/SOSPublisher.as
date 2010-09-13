/** * $Id$ * $Date$ * Source by BigSource Alexander Funke und Kim Christiansen GbR * Visit blog.bigsource.de for updates and more free code. * Please contact info@bigsource.de for more information. *//** * Copyright (c) 2008 BigSource Alexander Funke und Kim Christiansen GbR *  * Permission is hereby granted, free of charge, to any person  * obtaining a copy of this software and associated documentation  * files (the "Software"), to deal in the Software without  * restriction, including without limitation the rights to use,  * copy, modify, merge, publish, distribute, sublicense, and/or sell  * copies of the Software, and to permit persons to whom the  * Software is furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be  * included in all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,  * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES  * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND  * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT  * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,  * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR  * OTHER DEALINGS IN THE SOFTWARE. *//** * Publisher for Powerflasher SOS *  * @author kimchristiansen */package de.bigsource.model.logging.sos {	import de.bigsource.model.logging.IPublisher;	import de.bigsource.model.logging.LogItem;	import de.bigsource.model.logging.LogLevel;	import de.bigsource.model.logging.sos.SOSFoldMessage;		import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IOErrorEvent;	import flash.events.SecurityErrorEvent;	import flash.net.XMLSocket;	import flash.system.Security;		
	public class SOSPublisher extends EventDispatcher implements IPublisher 	{
		public static var clearOnConnect : Boolean = true;
		private var COLOR_FATAL : Number = 0xFF0000;
		private var COLOR_ERROR : Number = 0xFF6666;
		private var COLOR_WARN : Number = 0xFFCCCC;
		private var COLOR_INFO : Number = 0xDDDDDD;
		private var COLOR_DEBUG : Number = 0xFFFFFF;

		private var _history : Array;		private var _sosPort : Number;
		private var _appname : String;		private var _connected : Boolean;		private var _sosServer : String;		private var _socket : XMLSocket;				/**
		 * SOSPublisher
		 * Initalises communications with SOS through an XMLSocket.
		 * 
		 * @param
		 * appName: The name of this app [defaults to "UNKNOWN"]
		 * sosServer: The IP address of the SOS server.	[defaults to localhost]
		 * sosPort:	The command port of the SOS server to connect to. [defaults to 4444 - the default Log-Port];
		 */
		public function SOSPublisher(appName : String, sosServer : String, sosPort : Number ) 		{
	
			_sosServer = (sosServer ? sosServer : "127.0.0.1");			_sosPort = (sosPort ? sosPort : 4445);						_appname = appName ? appName : "Undefined";			_socket = new XMLSocket();			_history = new Array();			_connected = false;						Security.loadPolicyFile("http://" + _sosServer + "/crossdomain.xml");		
			startConnection();
		}		/**		 * Send LogItem to SOS		 */		public function sendLogItem(p_item : LogItem) : void 
		{  			if (_connected) 
			{				var levelname : String = LogLevel.getLogLevelName(p_item.level);
				var outputmessage : SOSFoldMessage = SOSObjectAnalyzer.getFoldMessage(p_item);		
				_socket.send("<showFoldMessage key=\"" + levelname + "\"><title><![CDATA[" + outputmessage.title + "]]></title><message><![CDATA[" + outputmessage.message + "]]></message></showFoldMessage>");
			}else 
			{				startConnection();
				_history.push(p_item);
			}
		}		/**		 * Close connection		 */		public function destroy() : void		{			closeConnection();		}
		private function startConnection() : void 
		{			if( !_connected)			{				if( !_socket.hasEventListener("connect") ) 				{					_socket.addEventListener("connect", onConnect, false,0,true);					_socket.addEventListener(IOErrorEvent.IO_ERROR, onError, false,0,true);					_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError, false,0,true);				}				_socket.connect(_sosServer, _sosPort);			}		}				private function onError(evt : Event) : void {			//Nothing to do here. Just for error handling!		}
		private function onConnect(e : Event) : void		{			var success : Boolean = true;						if( success )			{				_connected = true;							if(clearOnConnect) 				{					sendCommand('<clear/>\n');				}							sendCommand("<appName>" + _appname + "</appName>");				sendCommand("<setKey><name>FATAL</name><color>" + COLOR_FATAL + "</color></setKey>");				sendCommand("<setKey><name>ERROR</name><color>" + COLOR_ERROR + "</color></setKey>");				sendCommand("<setKey><name>WARN</name><color>" + COLOR_WARN + "</color></setKey>");				sendCommand("<setKey><name>INFO</name><color>" + COLOR_INFO + "</color></setKey>");				sendCommand("<setKey><name>DEBUG</name><color>" + COLOR_DEBUG + "</color></setKey>");							var logitem : LogItem;				for(var i : int = 0;i < _history.length; i++)				{					logitem = _history[i];					sendLogItem(logitem);				}			}					}
		private function sendCommand(command : String) : void 		{
			if (!_connected) 			{
				startConnection();
			}		
			_socket.send(command);
		}		private function closeConnection() : void		{			_socket.close();		}
	}
}