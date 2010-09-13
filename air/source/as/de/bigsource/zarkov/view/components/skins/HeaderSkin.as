package de.bigsource.zarkov.view.components.skins
{
	import mx.skins.ProgrammaticSkin;

	import flash.display.CapsStyle;
	import flash.display.GradientType;
	import flash.display.LineScaleMode;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;

	public class HeaderSkin extends ProgrammaticSkin
	{
		
		public function HeaderSkin()
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
			graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
			graphics.endFill();
			
			graphics.lineStyle(1, 0x929292, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.moveTo(0, unscaledHeight - 1);
			graphics.lineTo(unscaledWidth, unscaledHeight-1);
			graphics.lineStyle(1, 0xebebeb, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.moveTo(0, unscaledHeight);
			graphics.lineTo(unscaledWidth, unscaledHeight);
		}
	}    
}