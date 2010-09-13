package de.bigsource.model.database {	import flash.utils.describeType;		import de.bigsource.model.database.base.AbstractTable;	import de.bigsource.model.database.base.DBConfig;	import de.bigsource.model.logging.Trace;	import de.bigsource.utils.DateUtil;	import de.bigsource.utils.StringUtil;			/**	 * @author alexanderfunke	 */	public class DB	{		private static var _ids : Array = new Array();		private static var _entries : Array = new Array();		public static const ASCENDING : String = "asc"; 		public static const DESCENDING : String = "desc";		private static var _tables : Array;		public static function findMany(p_table : String,p_args : *, p_max_results : int = 0, p_order_by : *= "id", p_sortorrder : String = DB.DESCENDING, p_distinct : String = null) : Array		{			//TODO: Max Results						var table_id : int = _tables.indexOf(p_table);			var entry : AbstractTable = AbstractTable(DBConfig.getTable(p_table));			var results : Array = new Array();			var destinctarr : Array = new Array();						if(p_args is Number)			{				if(_entries[table_id][p_args])				{					return _entries[table_id][p_args];				} 				else 				{					Trace.warn("Error 404. The Element with the ID " + p_args + " was not found!");				}			} 			else			{				var tmpdata : Array = _entries[table_id];				var first : Boolean = true;				var entries : Array;				var entrycount : uint;				for each (var index : String in entry.indexes) 				{					if(Object(p_args).hasOwnProperty(index))					{						if(first)						{							entries = _entries[table_id];							entrycount = _entries[table_id].length;							tmpdata = new Array();						} 						else 						{							entries = tmpdata;							entrycount = tmpdata.length;							tmpdata = new Array();						}						var count : uint = 0;						var result : Array = new Array();						while(count < entrycount)						{							if(_entries[table_id][count] != null && _entries[table_id][count][index] is Date)							{								if(_entries[table_id][count][index + "_short"] == p_args[index])								{									result.push(count);								}								if(_entries[table_id][count][index + "_long"] == p_args[index])								{									result.push(count);								}							}							++count;							}						count = 0;						var resultlength : uint = result.length;						while(count < resultlength)						{							tmpdata[result[count]] = entries[result[count]];							++count;						}						first = false;					}				}				for (var i : Number = 0;i < tmpdata.length; i++) 				{					if(checkConditions(tmpdata[i], p_args))					{						if(p_distinct != null)												{							if(destinctarr.indexOf(tmpdata[i][p_distinct]) == -1)							{								destinctarr.push(tmpdata[i][p_distinct]);								results.push(tmpdata[i]);							}						} 						else 						{							results.push(tmpdata[i]);						}					}				}								//TODO: Numeric abfangen				results = results.sortOn(p_order_by, Array.NUMERIC);					if(p_sortorrder == DB.ASCENDING)				{					results = results.reverse();				}			}			return results;		}		public static function findOne(p_table : String,p_args : *, p_order_by : *= "id", p_sortorrder : String = DB.DESCENDING) : AbstractTable		{			var table_id : int = _tables.indexOf(p_table);			var entry : AbstractTable = AbstractTable(DBConfig.getTable(p_table));			var results : Array = new Array();						if(p_args is Number)			{				if(_entries[table_id][p_args])				{					return _entries[table_id][p_args];				} 				else 				{					return null;					//throw new Error("Error 404. The Element with the ID " + p_args + " was not found!");					}			} 			else			{								var tmpdata : Array = _entries[table_id];				var first : Boolean = true;				var entries : Array;				var entrycount : uint;				for each (var index : String in entry.indexes) 				{					if(Object(p_args).hasOwnProperty(index))					{						if(first)						{							entries = _entries[table_id];							entrycount = _entries[table_id].length;							tmpdata = new Array();						} 						else 						{							entries = tmpdata;							entrycount = tmpdata.length;							tmpdata = new Array();						}						var count : uint = 0;						var result : Array = new Array();						while(count < entrycount)						{							if(_entries[table_id][index] is Date)							{																				if(_entries[table_id][count][index + "_short"] == p_args[index])								{									result.push(count);								}								if(_entries[table_id][count][index + "_long"] == p_args[index])								{									result.push(count);								}							}							++count;							}															count = 0;						var resultlength : uint = result.length;						while(count < resultlength)						{							tmpdata[result[count]] = entries[result[count]];							++count;						}					}				}												for (var i : Number = 0;i < tmpdata.length; i++) 				{					if(checkConditions(tmpdata[i], p_args))					{						results.push(tmpdata[i]);					}				}								results = results.sortOn(p_order_by, p_sortorrder);					if(p_sortorrder == DB.ASCENDING)				{					results = results.reverse();				}								return results[0];			}		}		public static function executeSql(p_sql : String) : Array		{			var results : Array = new Array();			var destinctarr : Array = new Array();			var index : int = 0;						var sqlregexp : RegExp = /(Select|Insert) (\*|Distinct\((\w*)\)) from ([a-zA-Z0-9_]+) where (.*)/gi;			var sqlparts : Object = sqlregexp.exec(p_sql);			if(sqlparts == null)			{				Trace.debug("You have an syntax error in your sql!");				return results;			}			var action : String = sqlparts[1];			var distinct : Boolean = (sqlparts[2].charAt(0) == "D") ? true : false;			var distinctfield : String = sqlparts[3];			var table : String = sqlparts[4];			var table_id : int = _tables.indexOf(table);						var conditions : String = sqlparts[5].split("order by ")[0];			var orderby : String = sqlparts[5].split("order by ")[1];						var addtoresult : Array;			var equalconditionparts : Array;			var likeconditionparts : Array;			var smallerconditionparts : Array;			var greaterconditionparts : Array;			var field : String;			var value : String;			var orid : int;									if(action.toLowerCase() == "select")			{								for each (var entry : AbstractTable in _entries[table_id]) 				{					addtoresult = [];					orid = 0;					for each(var orcondition:String in conditions.split(" or "))					{						addtoresult[orid] = true;						for each(var andcondition:String in orcondition.split(" and "))						{							//Equal							equalconditionparts = andcondition.split("=");							if(equalconditionparts.length > 1)							{								field = equalconditionparts[0];								value = equalconditionparts[1];								if(field.indexOf("!") == -1)								{									if(entry[field] is Date)																{										if(DateUtil.getMysqlDate(entry[field]) != cleanValue(value) && DateUtil.getMysqlDateTime(entry[field]) != cleanValue(value))										{											addtoresult[orid] = false;										}									} else if(entry[field] is Number)									{										if(entry[field] != Number(value))										{											addtoresult[orid] = false;										}									} else if(entry[field] is String)									{										if(entry[field] != cleanValue(value))										{											addtoresult[orid] = false;										}									} 									else 									{										Trace.warn("The type of the field \"" + field + "\" with the operator = is not supported.");									}								}								else 								{									field = equalconditionparts[0].substr(0, equalconditionparts[0].length - 1);									if(entry[field] is Date)																{										if(DateUtil.getMysqlDate(entry[field]) == cleanValue(value) || DateUtil.getMysqlDateTime(entry[field]) == cleanValue(value))										{											addtoresult[orid] = false;										}									} else 									if(entry[field] is Number)									{										if(entry[field] == Number(value))										{											addtoresult[orid] = false;										}									} else if(entry[field] is String)									{										if(entry[field] == cleanValue(value))										{											addtoresult[orid] = false;										}									} else 									{//										Trace.warn("The type of the field \"" + field + "\" with the operator = is not supported.");									}								} 							}														//Like							likeconditionparts = andcondition.split(" like ");							if(likeconditionparts.length > 1)							{								field = likeconditionparts[0];								value = likeconditionparts[1];								if(entry[field] is String)								{									if(String(entry[field]).toLowerCase() != cleanValue(value).toLowerCase())									{										addtoresult[orid] = false;									}								} 								else 								{									Trace.warn("The type of the field \"" + field + "\" with the operator like is not supported.");								}							} 														//Smaller							smallerconditionparts = andcondition.split("<");							if(smallerconditionparts.length > 1)							{								field = smallerconditionparts[0];								value = smallerconditionparts[1];								if(entry[field] is Date)															{									if(entry[field] > DateUtil.parseMysqlDate(cleanValue(value)))									{										addtoresult[orid] = false;									}								} else if(entry[field] is Number)								{									if(entry[field] > Number(value))									{										addtoresult[orid] = false;									}								} 								else 								{									Trace.warn("The type of the field \"" + field + "\" with the operator < is not supported.");								}							}														//Greater							greaterconditionparts = andcondition.split(">");							if(greaterconditionparts.length > 1)							{								field = greaterconditionparts[0];								value = greaterconditionparts[1];								if(entry[field] is Date)															{									if(entry[field] < DateUtil.parseMysqlDate(cleanValue(value)))									{										addtoresult[orid] = false;									}								} else if(entry[field] is Number)								{									if(entry[field] < Number(value))									{										addtoresult[orid] = false;									}								} 								else 								{									Trace.warn("The type of the field \"" + field + "\" with the operator > is not supported.");								}							}						}						++orid;					}					if(addtoresult.indexOf(true) > -1)					{						if(distinct)												{							if(destinctarr.indexOf(entry[distinctfield]) == -1)							{								destinctarr.push(entry[distinctfield]);								//								results[index] = entry;								results[entry.id] = entry;								index++;//								results.push(entry);							}						} 						else 						{							//							results[index] = entry;							results[entry.id] = entry;							index++;//							results.push(entry);						}					}				}			}			if(orderby != null)			{				results = results.sortOn(orderby, Array.NUMERIC);			}			results.length = index;			return results;		}		public static function create(p_table : String, p_args : Object) : Object		{			var table_id : int = _tables.indexOf(p_table);			var entry : AbstractTable = AbstractTable(DBConfig.getTable(p_table));			var key : String;			var setID : Boolean = false;						var variables : XMLList = describeType(p_args)..variable;						for each(var variable:XML in variables)			{				key = variable.@name.toString();				try				{					if(key != "id" && key != "created_at" && key != "updated_at" && key != "indexes")					{						entry[key] = p_args[key];					}				} catch(e : Error)				{					throw new Error("The field \"" + key + "\" in Table \"" + p_table + "\" does not exist");					}			}						for (key in p_args) 			{				try				{					entry[key] = p_args[key];					if(key=="id"){						setID = true;					}				} catch(e : Error)				{					throw new Error("The field \"" + key + "\" in Table \"" + p_table + "\" does not exist");					}											}						if(setID)			{				entry["id"] = p_args["id"];			} 			else 			{				entry["id"] = _ids[table_id];			}						if(entry.indexes)			{				for (var index : Number = 0;index < entry.indexes.length; index++) 				{					if(entry[entry.indexes[index]] is Date && p_args[entry.indexes[index]] != null)					{						entry[entry.indexes[index] + "_short"] = DateUtil.getMysqlDate(entry[entry.indexes[index]]);					}				}			}									entry["created_at"] = new Date();			entry["updated_at"] = new Date();			_entries[table_id][_ids[table_id]] = entry;				_ids[table_id]++;			return entry;		}		public static function remove(p_table : String ,p_args : *) : void		{			var table_id : int = _tables.indexOf(p_table);			if(p_args is Number)			{				_entries[table_id][p_args].destroy();				_entries[table_id][p_args] = null;			} 			else			{				for (var i : Number = 0;i < _entries.length; i++) 				{					if(checkConditions(_entries[p_table][i], p_args))					{						_entries[table_id][i].destroy();						_entries[table_id][i] = null;						delete _entries[table_id][i];					}				}				}		}		public static function getAll(p_table : String) : Array		{			var table_id : int = _tables.indexOf(p_table);			return _entries[table_id];		}		private static function checkConditions(element : AbstractTable, p_args : *) : Boolean		{						if(element != null)			{				if(p_args is Array)				{					var queryparts : Array;					for each (var vals : String in p_args) 					{						if(vals.indexOf(">") > 0)						{							//TODO: Trimmen							queryparts = vals.split(">");							if(element[queryparts[0]] == null && queryparts[1] != "null")							{								queryparts = null;								return false;							}							if(element[queryparts[0]] is Date)							{								if(element[queryparts[0]] <= DateUtil.parseMysqlDate(queryparts[1]))								{									queryparts = null;									return false;									}							} 							else 							{								if(element[queryparts[0]] <= queryparts[1])								{									queryparts = null;									return false;									}							}						} else if(vals.indexOf("<") > 0)						{							//TODO: Trimmen							queryparts = vals.split("<");							if(element[queryparts[0]] == null && queryparts[1] != "null")							{								queryparts = null;								return false;							}							if(element[queryparts[0]] is Date)							{								if(element[queryparts[0]] >= DateUtil.parseMysqlDate(queryparts[1]))								{									queryparts = null;									return false;									}							} 							else 							{															if(element[queryparts[0]] >= queryparts[1])								{									queryparts = null;									return false;									}							}						} else if(vals.indexOf("like") > 0)						{							queryparts = vals.split(" like ");							if(String(element[queryparts[0]]).toLowerCase() != String(queryparts[1]).toLowerCase())							{								queryparts = null;								return false;								}						} else if(vals.indexOf("=") > 0)						{							queryparts = vals.split("=");							if(element[queryparts[0]] is Date)							{								if(element[queryparts[0]] != DateUtil.parseMysqlDate(queryparts[1]) && DateUtil.getFormattedDate("%Y-%m-%d", element[queryparts[0]]) != DateUtil.getFormattedDate("%Y-%m-%d", DateUtil.parseMysqlDate(queryparts[1])))								{									queryparts = null;									return false;									}							} 							else 							{								if(element[queryparts[0]] != queryparts[1])								{									queryparts = null;									return false;									}							}						}					}					queryparts = null;					return true;				} 				else 				{									for (var key : String in p_args) 					{						if(element[key] is Date)						{							if(DateUtil.getMysqlDate(element[key]) != p_args[key] && DateUtil.getMysqlDateTime(element[key]) != p_args[key])							{								p_args = null;								return false;								}						} 						else 						{							if(element[key] != p_args[key])							{								p_args = null;								return false;								}						}					}					return true;				}			} 			else 			{				return false;				}		}		private static function cleanValue(p_value : String) : String		{			return StringUtil.trim(p_value.replace("'", "").replace("'", ""));		}		public static function addTable(p_table : String) : void		{			if(_tables == null)			{				_tables = new Array();				}			if(_tables.indexOf(p_table) == -1)			{				_tables.push(p_table);				var table_id : int = _tables.indexOf(p_table);				if(_entries[table_id] == null)				{					_entries[table_id] = new Array();					_ids[table_id] = 0;					}			}			}		public static function truncate(p_table : String) : void		{			var table_id : int = _tables.indexOf(p_table);			_entries[table_id] = new Array();			_ids[table_id] = 0;			}	}}