package de.bigsource.zarkov.model 
{
	import gs.TweenMax;

	import de.bigsource.model.database.DB;
	import de.bigsource.model.database.base.DBConfig;
	import de.bigsource.utils.DateUtil;
	import de.bigsource.utils.StringUtil;
	import de.bigsource.zarkov.model.ant.AntTarget;
	import de.bigsource.zarkov.model.ant.AntTask;
	import de.bigsource.zarkov.model.database.AntTargets;
	import de.bigsource.zarkov.model.database.AntTaskMessages;
	import de.bigsource.zarkov.model.vo.BuildOutputVO;
	import de.bigsource.zarkov.notifications.BuildNotifications;

	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	import mx.controls.Alert;

	public class BuildProxy extends Proxy implements IProxy 
	{
		public static const NAME : String = "BuildProxy";
		private var _complete : Boolean = true;
		private var _taskStart : Date;

		public function BuildProxy() 
		{
			super(NAME);
		}

		override public function onRegister() : void
		{
			DBConfig.tablepackage = "de.bigsource.zarkov.model.database";
			
			DB.addTable(DBTables.ANTTARGETS);			DB.addTable(DBTables.ANTTASK_MESSAGES);
		}

		public function build(p_target : AntTarget, p_index : int = 0, p_targetID : int = -1) : void
		{
			if(_complete)
			{
				
				//_complete = false;

				var target : AntTarget = p_target;				target.currentIndex = p_index;
				if(target != null)
				{
					var targetObj : AntTargets;
					if(p_targetID == -1)
					{
						_taskStart = new Date();
						
						var antTargetObj : AntTargets = new AntTargets();
						antTargetObj.projectName = target.antFile.name;
						antTargetObj.targetName = target.name;
						antTargetObj.startTime = new Date();
						targetObj = DB.create(DBTables.ANTTARGETS, antTargetObj) as AntTargets;
					} 
					else 
					{
						targetObj = DB.findOne(DBTables.ANTTARGETS, {id:p_targetID}) as AntTargets;
					}
					
					//Check if there are dependent targets
					var task : AntTask;
					if(target.dependendTasks.length > 0 && p_index < target.dependendTasks.length)
					{
						task = target.dependendTasks[p_index] as AntTask;
					} 
					else 
					{
						task = target.children[p_index - target.dependendTasks.length] as AntTask;
					}
					
					task.targetID = targetObj.id;
						
					setID(targetObj.id);					setState(targetObj.id, "running");					setTaskName(targetObj.id, target.name);
					
					if(p_index > 0)
					{
						addMessage("", targetObj.id);
					}
					addMessage("<h2>[launch " + task.name + "]</h2>", targetObj.id);

					task.execute();
				} 
				else 
				{
					trace("Kein Target");
				}
			} 
			else 
			{
				Alert.show("Task in progress!", "Attention");
			}
		}

		private function setState(p_id : uint, p_state : String) : void 
		{
			var task : AntTargets = DB.findOne(DBTables.ANTTARGETS, {id:p_id}) as AntTargets;
			task.state = p_state;
			sendNotification(BuildNotifications.ON_BUILD_RESPONSE);
		}

		private function setTaskName(p_id : uint, p_name : String) : void 
		{
			var task : AntTargets = DB.findOne(DBTables.ANTTARGETS, {id:p_id}) as AntTargets;
			task.taskName = p_name;
			sendNotification(BuildNotifications.ON_BUILD_RESPONSE);
		}

		private function setEndTime(p_id : uint) : void 
		{
			var task : AntTargets = DB.findOne(DBTables.ANTTARGETS, {id:p_id}) as AntTargets;
			task.endTime = new Date();
			sendNotification(BuildNotifications.ON_BUILD_RESPONSE);
		}

		private function setID(p_id : uint) : void 
		{
			sendNotification(BuildNotifications.ON_SET_BUILDID_REQUEST, p_id);
		}

		public function buildComplete(p_task : AntTask = null) : void
		{
			
			setState(p_task.targetID, "finished");
			setEndTime(p_task.targetID);
			if(p_task.antTarget.children.length - 1 + p_task.antTarget.dependendTasks.length - 1 >= p_task.antTarget.currentIndex)
			{
				TweenMax.delayedCall(1, build, [p_task.antTarget, p_task.antTarget.currentIndex + 1, p_task.targetID]);
			} 
			else 
			{
				_complete = true;
			}
		}

		public function addMessage(p_msg : String, p_id : int) : void 
		{
			var target : AntTargets = DB.findOne(DBTables.ANTTARGETS, {id:p_id}) as AntTargets;
			target.lastMessage = stripTags(p_msg);

			DB.create(DBTables.ANTTASK_MESSAGES, {message:p_msg, anttarget_id:target.id});			
			sendNotification(BuildNotifications.ON_BUILD_RESPONSE);		
		}

		public function callException(p_msg : String, p_id : int) : void 
		{
			var target : AntTargets = DB.findOne(DBTables.ANTTARGETS, {id:p_id}) as AntTargets;
			target.lastMessage = stripTags(p_msg);
			target.state = "exception";
			
			DB.create(DBTables.ANTTASK_MESSAGES, {message:p_msg, anttarget_id:target.id});
			setEndTime(p_id);
			
			_complete = true;
			
			sendNotification(BuildNotifications.ON_BUILD_RESPONSE);
		}

		private function stripTags(p_msg:String):String
		{
			return p_msg.replace(/<.*?>/g, "");
		}

		override public function onRemove() : void
		{
		}

		public function quitall() : void 
		{
		}

		public function get targets() : Array
		{
			var ar : Array = [];
			var tasks : Array = DB.findMany(DBTables.ANTTARGETS, {});
			for each (var task : AntTargets in tasks) 
			{
				var vo : BuildOutputVO = new BuildOutputVO();
				vo.id = task.id;
				vo.lastMessage = task.lastMessage;
				vo.projectName = task.projectName;
				vo.state = task.state;
				vo.taskName = task.taskName;				vo.targetName = task.targetName;
				if(task.endTime != null)
				{					vo.duration = StringUtil.WithLeadingZero(DateUtil.getMinutes(task.endTime, task.startTime)) + ":" + StringUtil.WithLeadingZero(DateUtil.getSeconds(task.endTime, task.startTime)) + " Minutes";
				}
				ar.push(vo);
			}
			return ar;
		}

		public function outputVO(p_id : int) : BuildOutputVO 
		{
			var task : AntTargets = DB.findOne(DBTables.ANTTARGETS, {id:p_id}) as AntTargets;
			if(task != null)
			{
				var vo : BuildOutputVO = new BuildOutputVO();
				vo.id = task.id;				vo.lastMessage = task.lastMessage;				vo.projectName = task.projectName;				vo.targetName = task.targetName;
				vo.state = task.state;				vo.taskName = task.taskName;
			
				for each (var msg : AntTaskMessages in task.many(DBTables.ANTTASK_MESSAGES)) 
				{
					vo.messages.push(msg.message);
				}
			}
			return vo;
		}

		public function clear() : void 
		{
			var tasks : Array = DB.findMany(DBTables.ANTTARGETS, {});
			for each (var task : AntTargets in tasks) 
			{
				if(task.state != "running")
				{
					for each (var msg : AntTaskMessages in task.many(DBTables.ANTTASK_MESSAGES)) 
					{
						msg.deleteEntry(DBTables.ANTTASK_MESSAGES);
					}
					task.deleteEntry(DBTables.ANTTARGETS);
				}
			}
			sendNotification(BuildNotifications.ON_BUILD_RESPONSE);
		}
	}
}