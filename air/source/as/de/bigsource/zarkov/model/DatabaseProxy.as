package de.bigsource.zarkov.model 
{
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	import mx.controls.Alert;

	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;

	public class DatabaseProxy extends Proxy implements IProxy 
	{
		public static const NAME : String = "DatabaseProxy";
		
		public var onComplete : Function;
		public var onGetAntFiles:Function;
		public var onAddAntFiles:Function;		public var onRemoveAntFiles:Function;
		
		private var _sqlConnection : SQLConnection;
		private var _dbFile : File;

		public function DatabaseProxy() 
		{
			super(NAME);
		}

		override public function onRegister() : void
		{
			_sqlConnection = new SQLConnection();
			_sqlConnection.addEventListener(SQLEvent.OPEN, onDatabaseOpen, false, 0, true);
			_sqlConnection.addEventListener(SQLErrorEvent.ERROR, onError, false, 0, true);
			
			_dbFile = File.applicationStorageDirectory.resolvePath("zarkov.db");
		}

		public function initDatabase() : void
		{
			_sqlConnection.open(_dbFile);
		}

		private function onDatabaseOpen(event : SQLEvent = null) : void
		{
			var antFilesSQL:String = "CREATE TABLE IF NOT EXISTS antfiles (location TEXT PRIMARY KEY)";
			var createAntFiles:SQLStatement = new SQLStatement();
			createAntFiles.sqlConnection = _sqlConnection;
			createAntFiles.text = antFilesSQL;
			createAntFiles.addEventListener(SQLErrorEvent.ERROR, onError, false, 0, true);
			createAntFiles.execute();
			
			var settingsSQL:String = "CREATE TABLE IF NOT EXISTS settings (key TEXT PRIMARY KEY, value TEXT)";
			var createSettings:SQLStatement = new SQLStatement();
			createSettings.sqlConnection = _sqlConnection;
			createSettings.text = settingsSQL;
			createSettings.addEventListener(SQLEvent.RESULT, onTablesCreated, false, 0, true);
			createSettings.addEventListener(SQLErrorEvent.ERROR, onError, false, 0, true);
			createSettings.execute();     

		}
		
		private function onTablesCreated(event : SQLEvent) : void
		{
			onComplete();
		}
		
		public function getAntFiles() : void
		{
			var selectSQL : String = "SELECT * FROM antfiles";
			
			var selectAntFiles:SQLStatement = new SQLStatement();
			selectAntFiles.sqlConnection = _sqlConnection;
			selectAntFiles.text = selectSQL;
			selectAntFiles.addEventListener(SQLEvent.RESULT, onSelectAntFilesResult, false, 0, true);
			selectAntFiles.addEventListener(SQLErrorEvent.ERROR, onError, false, 0, true);
			selectAntFiles.execute();                     
		}


		private function onSelectAntFilesResult(event : SQLEvent) : void
		{
			var sqlresult : SQLResult = SQLStatement(event.currentTarget).getResult();                             
			var files:Array = [];
			for each (var entry : * in sqlresult.data) 
			{
				files.push(entry["location"]);
			}
			onGetAntFiles(files);
		}

		public function addAntFile(p_buildfile : String) : void
		{
			var buildfile : String = p_buildfile.replace("file://localhost", "");
			var sql:String = "INSERT OR IGNORE INTO antfiles values('" + buildfile + "')";
			var addFile:SQLStatement = new SQLStatement();
			addFile.sqlConnection = _sqlConnection;
			addFile.text = sql;
			addFile.addEventListener(SQLEvent.RESULT, onAddAntFileResult, false, 0, true);
			addFile.addEventListener(SQLErrorEvent.ERROR, onError, false, 0, true);
			addFile.execute();   
		}
		
		public function onAddAntFileResult(event : SQLEvent) : void
		{
			onAddAntFiles();
		}

		public function removeAntFile(p_buildfile : String) : void 
		{
			var buildfile : String = p_buildfile.replace("file://localhost", "");
			
			var removeFile:SQLStatement = new SQLStatement();
			removeFile.sqlConnection = _sqlConnection;
			removeFile.text = "DELETE FROM antfiles where location='" + buildfile + "'";
			removeFile.addEventListener(SQLEvent.RESULT, onRemoveAntFileResult, false, 0, true);
			removeFile.addEventListener(SQLErrorEvent.ERROR, onError, false, 0, true);
			removeFile.execute();     
		}

		private function onRemoveAntFileResult(event : SQLEvent) : void 
		{
			onRemoveAntFiles();
		}
		
		private function onError(event : SQLErrorEvent) : void 
		{
			Alert.show("An error occured.", "Error");
		}

		override public function onRemove() : void
		{
		}
	}
}