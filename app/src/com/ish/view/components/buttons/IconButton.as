package com.ish.view.components.buttons
{
	public class IconButton extends BaseButton
	{
		protected var _iconColor : uint
		
		public function IconButton($bgWidth:Number, $bgHeight:Number, $bgColor:uint, $iconColor : uint)
		{
			_iconColor = $iconColor;
			super($bgWidth, $bgHeight, $bgColor);
		}
		
		override protected function drawUp () : void
		{
			graphics.clear();
			drawBg();
			drawIcon(_iconColor, 1);
		}
		
		override protected function drawDown () : void
		{
			graphics.clear();
			drawBg();
			drawIcon(_iconColor, 0.5);
		}
		
		protected function drawIcon ($color : uint, $alpha : Number) : void {
		}
	}
}