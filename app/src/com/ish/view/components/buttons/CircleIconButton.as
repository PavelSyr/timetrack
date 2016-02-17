package com.ish.view.components.buttons
{
	public class CircleIconButton extends IconButton
	{
		public function CircleIconButton($bgWidth:Number, $bgHeight:Number, $bgColor:uint, $iconColor : uint)
		{
			super($bgWidth, $bgHeight, $bgColor, $iconColor);
		}
		
		override protected function drawIcon ($color : uint, $alpha : Number) : void {
			var cX : Number = _bgWidth >> 1;
			var cY : Number = _bgHeight >> 1;
			var cR : Number = (cX < cY)? cX : cY;
			graphics.beginFill($color, $alpha);
			graphics.drawCircle(cX, cY, cR);
			graphics.endFill();
		}
	}
}