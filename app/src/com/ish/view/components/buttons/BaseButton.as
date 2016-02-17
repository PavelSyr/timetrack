package com.ish.view.components.buttons
{
	public class BaseButton extends Button
	{
		public function BaseButton($bgWidth : Number, $bgHeight : Number, $bgColor: uint)
		{
			super($bgWidth, $bgHeight, $bgColor);
		}

		override protected function initDrawMap() : void
		{
			_drawMap[STATE_UP] = drawUp;
			_drawMap[STATE_DOWN] = drawDown;
		}
		
		protected function drawUp () : void
		{
			graphics.clear();
			drawBg();
		}
		
		protected function drawDown () : void
		{
			graphics.clear();
			drawBg();
		}
	}
}