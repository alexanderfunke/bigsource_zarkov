package de.bigsource.zarkov.view.components.skins
{
	import mx.skins.ProgrammaticSkin;

	import flash.display.CapsStyle;
	import flash.display.GradientType;
	import flash.display.LineScaleMode;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;

	public class ControlBarSkin extends ProgrammaticSkin
	{
		
		public function ControlBarSkin()
		{
			super();
		}

		override protected function updateDisplayList(unscaledWidth : Number, unscaledHeight : Number) : void
		{            
			super.updateDisplayList(unscaledWidth, unscaledHeight); 
			
			var matrix : Matrix = new Matrix();
			matrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2);

			graphics.clear();
			graphics.beginGradientFill(GradientType.LINEAR, [0xeeeeee,  0xcccccc], [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			graphics.drawRect(1, 0, unscaledWidth-2, unscaledHeight);
			graphics.endFill();
			
			graphics.lineStyle(1, 0x929292, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.moveTo(1, unscaledHeight - 1);
			graphics.lineTo(unscaledWidth-2, unscaledHeight-1);
			
			graphics.lineStyle(1, 0xebebeb, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.moveTo(1, unscaledHeight);
			graphics.lineTo(unscaledWidth-2, unscaledHeight);

			graphics.lineStyle(1, 0xebebeb, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.moveTo(1, 1);
			graphics.lineTo(unscaledWidth-2, 1);
		}
	}    
}