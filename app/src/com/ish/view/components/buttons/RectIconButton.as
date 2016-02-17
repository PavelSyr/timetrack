package com.ish.view.components.buttons
{
	public class RectIconButton extends IconButton
	{
		public function RectIconButton($bgWidth:Number, $bgHeight:Number, $bgColor:uint, $iconColor:uint)
		{
			super($bgWidth, $bgHeight, $bgColor, $iconColor);
		}
		
		override protected function drawIcon ($color : uint, $alpha : Number) : void {
			var size : Number = (_bgWidth < _bgHeight)? _bgWidth : _bgHeight;
			var rX : Number = (_bgWidth - size) >> 1;
			var rY : Number = (_bgHeight - size) >> 1;
			graphics.beginFill($color, $alpha);
			graphics.drawRect(rX, rY, size, size);
			graphics.endFill();
		}
	}
}