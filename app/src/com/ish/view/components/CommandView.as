package com.ish.view.components
{
	import com.ish.view.components.buttons.Button;
	
	import flash.display.Sprite;
	
	import utils.ButtonPool;
	
	public class CommandView extends Sprite
	{
		private var _buttons : Vector.<Button>
		
		public function CommandView()
		{
			super();
			draw(770, 35);
			prepareComponents();
			layout();
			addChildren();
		}
		
		protected function prepareComponents() : void
		{
			_buttons = new Vector.<Button>();
		}
		
		protected function layout () : void
		{
			
		}
		
		protected function addChildren() : void
		{
			
		}
		
		protected function draw($width : Number , $height : Number) : void
		{
			graphics.clear();
			graphics.lineStyle(2, ButtonPool.BG_COLOR, 0.3);
			graphics.beginFill(ButtonPool.BG_COLOR, 0.3);
			graphics.drawRect(0,0,$width, $height);
			graphics.lineStyle();
		}
	}
}