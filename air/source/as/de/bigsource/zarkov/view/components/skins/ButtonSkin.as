package de.bigsource.zarkov.view.components.skins
{
	import flash.display.SpreadMethod;
	import flash.display.GradientType;
	import flash.geom.Matrix;

	import mx.skins.ProgrammaticSkin;

	import flash.display.CapsStyle;
	import flash.display.LineScaleMode;

	public class ButtonSkin extends ProgrammaticSkin
	{
		private var _borderThickness : uint = 1;

		private var _innerBorderColor : uint = 0x929292;
		private var _outerBorderColor : uint = 0xeeeeee;


		public function ButtonSkin()
		{
			super();
		}

		override protected function updateDisplayList(unscaledWidth : Number, unscaledHeight : Number) : void
		{            
			super.updateDisplayList(unscaledWidth, unscaledHeight); 
			
			var matrix : Matrix = new Matrix();
			matrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2);
			var backgroundFillColor : int;
			var backgroundFillColor2 : int;
			
			switch (name) 
			{
				case "upSkin":
					backgroundFillColor = 0xeeeeee;
					backgroundFillColor2 = 0xcccccc;
					break;
				case "overSkin":
					backgroundFillColor = 0x929292;
					backgroundFillColor2 = 0xeeeeee;
					break;
				case "downSkin":
					backgroundFillColor = 0x888888;
					backgroundFillColor2 = 0x777777;
					color: 
					0xFF0000;
					break;
				case "disabledSkin":
					backgroundFillColor = 0xCCCCCC;
					backgroundFillColor2 = 0xCCCCCC;
					break;
			}
			
			graphics.clear();
			graphics.lineStyle(_borderThickness, _innerBorderColor, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.beginGradientFill(GradientType.LINEAR, [backgroundFillColor,  backgroundFillColor2], [1, 1], [0, 255], matrix, SpreadMethod.PAD);
			graphics.drawRoundRect(0, 0, unscaledWidth - _borderThickness, unscaledHeight - _borderThickness, 10, 10);
			graphics.endFill();
            
			graphics.lineStyle(_borderThickness, _outerBorderColor, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.beginFill(0xffffff, 0);
			graphics.drawRoundRect(-_borderThickness, -_borderThickness, unscaledWidth + _borderThickness, unscaledHeight + _borderThickness, 10, 10);
			graphics.endFill();
		}
	}    
}