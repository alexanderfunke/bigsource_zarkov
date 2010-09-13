package de.bigsource.zarkov.view.components 
{
	import flash.geom.ColorTransform;
	import flash.events.Event;

	import de.bigsource.utils.MathUtil;
	import de.bigsource.utils.ColorUtil;

	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author alexanderfunke
	 */
	public class UILoadingCircle extends Sprite 
	{
		private var _colors : Array;
		private var _lines : Array;
		private var _counter : int;
		private var _frame : int = 0;

		public function UILoadingCircle()
		{
			
			_colors = [];			_lines = [];			_counter = 0;
			
			x = 8;			y = 8;
			for (var i : int = 0;i < 12;i++) 
			{
				var color : Number = ColorUtil.RGBtoHEX24(255 / 12 * i, 255 / 12 * i, 255 / 12 * i);
				var line : Shape = new Shape();
				line.graphics.beginFill(color);
				line.graphics.drawRect(3, -1, 5, 2);
				line.graphics.endFill();
				line.rotation = 360 / 12 * i;
				addChild(line);
				_lines.push(line);
				_colors.push(color);
			}
		}

		public function start() : void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
		}

		public function stop() : void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		
		private function onEnterFrame(event : Event) : void 
		{
			if(_frame == 2)
			{
				for (var i : int = 0;i < 12;i++) 
				{
					var val : Number = MathUtil.getColumn(i + _counter, 12);
					var color : Number = ColorUtil.RGBtoHEX24(255 / 12 * val, 255 / 12 * val, 255 / 12 * val);
					var line : Shape = _lines[i] as Shape;
					var colorTransform : ColorTransform = new ColorTransform();
					colorTransform.color = color;
					line.transform.colorTransform = colorTransform;
				}
				_counter++;
				_frame = 0;
			}
			_frame++;
		}
		
		override public function set x(p_x:Number):void
		{
			super.x=p_x+8;
		}
		
		override public function set y(p_y:Number):void
		{
			super.y=p_y+8;
		}
	}
}
