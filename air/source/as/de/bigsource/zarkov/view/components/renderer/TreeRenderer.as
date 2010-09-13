package de.bigsource.zarkov.view.components.renderer
{
	import de.bigsource.zarkov.model.ant.AntFile;
	import de.bigsource.zarkov.model.ant.AntTarget;
	import de.bigsource.zarkov.model.ant.AntTask;

	import mx.controls.Image;
	import mx.controls.treeClasses.*;
	import mx.core.BitmapAsset;

	import flash.display.DisplayObject;

	public class TreeRenderer extends TreeItemRenderer
	{
		private var img : Image = new Image();

		[Embed(source="../../../../../../../assets/images/error.png")]
		public var ErrorIcon : Class;

		[Embed(source="../../../../../../../assets/images/project.png")]
		public var ProjectIcon : Class;

		[Embed(source="../../../../../../../assets/images/task.png")]
		public var TaskIcon : Class;

		[Embed(source="../../../../../../../assets/images/target.png")]
		public var TargetIcon : Class;
		
		[Embed(source="../../../../../../../assets/images/defaulttarget.png")]
		public var DefaultTargetIcon : Class;

		public function TreeRenderer()
		{
			super();
			this.addChild(this.img as DisplayObject);
		}

		override public function set data(value : Object) : void
		{
			super.data = value;
		}

		override protected function updateDisplayList(unscaledWidth : Number, unscaledHeight : Number) : void 
		{

			super.updateDisplayList(unscaledWidth, unscaledHeight);
			if(super.data)
			{
				setStyle("fontFamily", "Myriad Pro"); 
								label.y = 3;
								
				img.x = this.getChildAt(3).x;
				img.y = this.getChildAt(3).y;
				img.width = 16;
				img.height = 16;
				
				var bmpErrorIcon : BitmapAsset = new ErrorIcon() as BitmapAsset;				var bmpProjectIcon : BitmapAsset = new ProjectIcon() as BitmapAsset;				var bmpTaskIcon : BitmapAsset = new TaskIcon() as BitmapAsset;				var bmpTargetIcon : BitmapAsset = new TargetIcon() as BitmapAsset;				var bmpDefaultTargetIcon : BitmapAsset = new DefaultTargetIcon() as BitmapAsset;

				getChildAt(3).visible = false;
				
				if(data is AntFile)
				{	
					if(data["hasError"])
					{
						img.source = bmpErrorIcon;
					} 
					else 
					{
						img.source = bmpProjectIcon;
					}
				} else if(data is AntTarget)
				{	
					if(data["isDefault"])
					{
						img.source = bmpDefaultTargetIcon;
					} 
					else 
					{
						img.source = bmpTargetIcon;
					}
				} else if(data is AntTask)
				{	
					img.source = bmpTaskIcon;
//				} else if(data is AntSubTask)
//				{	
//					img.source = "assets/task.png";
				}
			}
		}
	}
}