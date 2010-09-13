package de.bigsource.zarkov.model 
{
	import de.bigsource.model.logging.Trace;
	import de.bigsource.zarkov.model.ant.EchoTask;
	import de.bigsource.utils.StringUtil;
	import de.bigsource.zarkov.model.ant.AAsDoc;
	import de.bigsource.zarkov.model.ant.ACompc;
	import de.bigsource.zarkov.model.ant.Adl;
	import de.bigsource.zarkov.model.ant.AdtCertificate;
	import de.bigsource.zarkov.model.ant.AdtPackage;
	import de.bigsource.zarkov.model.ant.AdtPrepare;
	import de.bigsource.zarkov.model.ant.AdtSign;
	import de.bigsource.zarkov.model.ant.Amxmlc;
	import de.bigsource.zarkov.model.ant.AntFile;
	import de.bigsource.zarkov.model.ant.AntTarget;
	import de.bigsource.zarkov.model.ant.AsDoc;
	import de.bigsource.zarkov.model.ant.Browser;
	import de.bigsource.zarkov.model.ant.Compc;
	import de.bigsource.zarkov.model.ant.FlashPlayer;
	import de.bigsource.zarkov.model.ant.Haxe;
	import de.bigsource.zarkov.model.ant.Mtasc;
	import de.bigsource.zarkov.model.ant.Mxmlc;
	import de.bigsource.zarkov.notifications.AntFilesNotifications;

	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	import mx.controls.Alert;

	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class AntFilesProxy extends Proxy implements IProxy 
	{
		public static const NAME : String = "AntFilesProxy";
		private var _buildfiles : Array;
		public var onComplete : Function;
		private var _databaseProxy : DatabaseProxy;

		public function AntFilesProxy() 
		{
			super(NAME);
		}

		override public function onRegister() : void
		{
			_buildfiles = new Array();			_databaseProxy = facade.retrieveProxy(DatabaseProxy.NAME) as DatabaseProxy;
			_databaseProxy.onAddAntFiles = onAntFileAdded;			_databaseProxy.onGetAntFiles = onAntFilesReceived;			_databaseProxy.onRemoveAntFiles = onAntFileRemoved;
		}

		public function initFileList() : void 
		{
			refresh();
			onComplete();
		}

		private function onAntFileAdded() : void
		{
			refresh();
		}

		private function onAntFilesReceived(p_files : Array) : void
		{
			for each (var buildfile : String in p_files) 
			{
				load(buildfile);
			}
			sendNotification(AntFilesNotifications.ON_FILELIST_REFRESH_RESPONSE);
		}

		private function onAntFileRemoved() : void
		{
			refresh();
		}

		public function add(p_buildfile : String) : void
		{
			_databaseProxy.addAntFile(p_buildfile);
		}

		public function refresh() : void 
		{
			_buildfiles = new Array();
			_databaseProxy.getAntFiles();
		}

		public function remove(p_buildfile : String) : void 
		{
			_databaseProxy.removeAntFile(p_buildfile);
		}

		public function sort() : void 
		{
			_buildfiles = _buildfiles.sortOn("name", Array.DESCENDING);
			sendNotification(AntFilesNotifications.ON_FILELIST_REFRESH_RESPONSE);
		}

		public function load(p_buildfile : String) : void
		{
			if(p_buildfile == "null")
			{
				remove(buildfile);
				return;
			}
			var buildfile : String = p_buildfile.replace("file://localhost", "");
			var f : File = new File(buildfile);
			if(!f.exists)
			{
				remove(buildfile);
				return;
			}
			
			var fs : FileStream = new FileStream();
			fs.open(f, FileMode.READ);
			try
			{
				var data : XML = new XML(fs.readUTFBytes(fs.bytesAvailable));
			} catch(e : Error)
			{
				Alert.show("The file is malformed!", "Attention");
				remove(buildfile);
				return;
			}
			fs.close();
			
			if(data.name() != "project")
			{
				Alert.show("The file you added was not an correct build.xml!", "Attention");
				remove(buildfile);
				return;
			}
	
			var antfile : AntFile = new AntFile();
			antfile.name = data.@name;
			antfile.path = f.nativePath;
			var properties : Array = [];
			properties["basedir"] = f.nativePath.replace(f.name, "");
			properties["user.dir"] = File.userDirectory.nativePath;			properties["user.home"] = File.userDirectory.nativePath;			properties["user.name"] = File.userDirectory.name;
			
			for each (var propertyItem : XML in data..property) 
			{
				var propf : File = new File(PropertyBuilder.checkString(f.nativePath.replace(f.name, propertyItem.@file), properties));
				if(!propf.exists)
				{
					Alert.show("The file " + propertyItem.@file + " was not found. Please check the AntFile for project \"" + antfile.name + "\"");
					antfile.hasError = true;
					_buildfiles.push(antfile);
					return;
				}
				var propfs : FileStream = new FileStream();
				propfs.open(propf, FileMode.READ);
				var propData : String = new String(propfs.readUTFBytes(propfs.bytesAvailable));
				propfs.close();
						
				properties = PropertyBuilder.parse(properties, propData);
			}
			
			var antTarget : AntTarget;
			var depends : Array = [];
			var dependsAttr : String;
			var tar : String;
			var task : XML;
			
			for each (var target : XML in data..target) 
			{
				antTarget = new AntTarget();
				antTarget.name = target.@name;
				antTarget.antFile = antfile;
				antTarget.isDefault = (target.@name == data.@default);
				depends = [];
				dependsAttr = target.@depends;
				if(dependsAttr != null && dependsAttr != "")
				{
					for each (tar in dependsAttr.split(",")) 
					{
						depends.push(StringUtil.trim(tar));
					}
				}
				antTarget.dependendTaskNames = depends;
				for each (task in target.children()) 
				{
					initTasks(QName(task.name()).localName, antTarget, task, properties);
				}
					
				antfile.children.push(antTarget);
			}
			
			for each (antTarget in antfile.children) 
			{
				for (var i : int = antTarget.dependendTaskNames.length - 1;i >= 0 ;i--) 
				{
					target = data..target.(@name == antTarget.dependendTaskNames[i])[0];
					dependsAttr = target.@depends;
					
					if(target != null)
					{
							
						antTarget.dependendTaskNames.splice(antTarget.dependendTaskNames.indexOf(antTarget.dependendTaskNames[i]), 1);
						
						if(dependsAttr != null && dependsAttr != "")
						{
							for each (tar in dependsAttr.split(",")) 
							{
								antTarget.dependendTaskNames.push(StringUtil.trim(tar));
							}
						}
				
						for each (task in target.children()) 
						{
							initTasks(QName(task.name()).localName, antTarget, task, properties, true);
						}
					}
				}
			}
			_buildfiles.push(antfile);
			
			sendNotification(AntFilesNotifications.ON_FILELIST_REFRESH_RESPONSE);
		}

		private function initTasks(p_taskName : String, p_antTarget : AntTarget, p_task : XML, p_properties : Array, p_depends : Boolean = false) : AntTarget 
		{
			switch(p_taskName)
			{
				case "bigsource.browser":

					var browser : Browser = new Browser(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(browser);					} 
					else 
					{
						p_antTarget.children.push(browser);
					}
							
					break;
				case "bigsource.flashplayer":
								
					var flashplayer : FlashPlayer = new FlashPlayer(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(flashplayer);
					} 
					else 
					{
						p_antTarget.children.push(flashplayer);
					}
							
					break;
				case "bigsource.mxmlc":
								
					var mxmlc : Mxmlc = new Mxmlc(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(mxmlc);
					} 
					else 
					{
						p_antTarget.children.push(mxmlc);
					}
							
					break;
				case "bigsource.amxmlc":
								
					var amxmlc : Amxmlc = new Amxmlc(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(amxmlc);
					} 
					else 
					{
						p_antTarget.children.push(amxmlc);
					}
							
					break;
				case "bigsource.compc":
								
					var compc : Compc = new Compc(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(compc);
					} 
					else 
					{
						p_antTarget.children.push(compc);
					}
							
					break;
				case "bigsource.acompc":
								
					var acompc : ACompc = new ACompc(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(acompc);
					} 
					else 
					{
						p_antTarget.children.push(acompc);
					}
							
					break;
				case "bigsource.asdoc":
								
					var asdoc : AsDoc = new AsDoc(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(asdoc);
					} 
					else 
					{
						p_antTarget.children.push(asdoc);
					}
							
					break;
				case "bigsource.aasdoc":
								
					var aasdoc : AAsDoc = new AAsDoc(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(aasdoc);
					} 
					else 
					{
						p_antTarget.children.push(aasdoc);
					}
							
					break;
				case "bigsource.haxe":
								
					var haxe : Haxe = new Haxe(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(haxe);
					} 
					else 
					{
						p_antTarget.children.push(haxe);
					}
							
					break;
				case "bigsource.mtasc":
								
					var mtasc : Mtasc = new Mtasc(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(mtasc);
					} 
					else 
					{
						p_antTarget.children.push(mtasc);
					}
							
					break;
				case "bigsource.adl":
								
					var adl : Adl = new Adl(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(adl);
					} 
					else 
					{
						p_antTarget.children.push(adl);
					}
							
					break;
				case "bigsource.adt_certificate":
								
					var adtCertificate : AdtCertificate = new AdtCertificate(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(adtCertificate);
					} 
					else 
					{
						p_antTarget.children.push(adtCertificate);
					}
							
					break;
				case "bigsource.adt_package":
								
					var adtPackage : AdtPackage = new AdtPackage(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(adtPackage);
					} 
					else 
					{
						p_antTarget.children.push(adtPackage);
					}
							
					break;
				case "bigsource.adt_sign":
								
					var adtSign : AdtSign = new AdtSign(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(adtSign);
					} 
					else 
					{
						p_antTarget.children.push(adtSign);
					}
							
					break;
				case "bigsource.adt_prepare":
								
					var adtPrepare : AdtPrepare = new AdtPrepare(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(adtPrepare);
					} 
					else 
					{
						p_antTarget.children.push(adtPrepare);
					}
							
					break;
				case "echo":
					Trace.fatal(p_task);			
					var echo : EchoTask = new EchoTask(p_antTarget, p_task, p_properties);
					if(p_depends)
					{
						p_antTarget.dependendTasks.unshift(echo);
					} 
					else 
					{
						p_antTarget.children.push(echo);
					}
							
					break;
				default:
			}
			return p_antTarget;
		}

		public function get buildfiles() : Array
		{
			return _buildfiles;
		}	

		override public function onRemove() : void
		{
		}
	}
}