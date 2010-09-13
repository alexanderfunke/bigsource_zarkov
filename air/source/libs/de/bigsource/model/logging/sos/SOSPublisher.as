/**

		public static var clearOnConnect : Boolean = true;

		private var COLOR_ERROR : Number = 0xFF6666;
		private var COLOR_WARN : Number = 0xFFCCCC;
		private var COLOR_INFO : Number = 0xDDDDDD;
		private var COLOR_DEBUG : Number = 0xFFFFFF;

		private var _history : Array;
		private var _appname : String;
		 * SOSPublisher
		 * Initalises communications with SOS through an XMLSocket.
		 * 
		 * @param
		 * appName: The name of this app [defaults to "UNKNOWN"]
		 * sosServer: The IP address of the SOS server.	[defaults to localhost]
		 * sosPort:	The command port of the SOS server to connect to. [defaults to 4444 - the default Log-Port];
		 */
		public function SOSPublisher(appName : String, sosServer : String, sosPort : Number ) 
	
			_sosServer = (sosServer ? sosServer : "127.0.0.1");
			startConnection();
		}
		{  
			{
				var outputmessage : SOSFoldMessage = SOSObjectAnalyzer.getFoldMessage(p_item);		
				_socket.send("<showFoldMessage key=\"" + levelname + "\"><title><![CDATA[" + outputmessage.title + "]]></title><message><![CDATA[" + outputmessage.message + "]]></message></showFoldMessage>");
			}else 
			{
				_history.push(p_item);
			}
		}

		{
		private function onConnect(e : Event) : void

			if (!_connected) 
				startConnection();
			}
			_socket.send(command);
		}
	}
}