package de.bigsource.zarkov.view.components.skins
{
	import mx.skins.Border;

	import flash.filters.GlowFilter;

	public class BorderSkin extends Border
	{
		private var _backgroundColor : uint = 0xffffff;

		public function BorderSkin()
		{
			super();
		}

		override protected function updateDisplayList(unscaledWidth : Number, unscaledHeight : Number) : void
		{            
			super.updateDisplayList(unscaledWidth, unscaledHeight);          
             
			graphics.clear();
			graphics.beginFill(_backgroundColor);
			graphics.lineStyle(0, 0, 0);
			graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
			graphics.endFill();

			filters = [new GlowFilter(0x000000,.5,2,2,2,3), new GlowFilter(0xffffff,.5,4,4,2,3)];
			
		}
	}    
}