package com.ish.view.components.buttons
{
	public class PauseIconButton extends IconButton
	{
		public function PauseIconButton($bgWidth:Number, $bgHeight:Number, $bgColor:uint, $iconColor:uint)
		{
			super($bgWidth, $bgHeight, $bgColor, $iconColor);
		}
		
		override protected function drawIcon ($color : uint, $alpha : Number) : void {
			var gap : int = 5;
			var iconH : Number = (_bgWidth < _bgHeight)? _bgWidth : _bgHeight;
			var iconW : Number = (iconH - gap) >> 1; 
			var rX : Number = (_bgWidth - iconH) >> 1;
			var rY : Number = (_bgHeight - iconH) >> 1;
			graphics.beginFill($color, $alpha);
			graphics.drawRect(rX, rY, iconW, iconH);
			graphics.drawRect(rX+gap, rY, iconW, iconH);
			graphics.endFill();
		}
	}
}