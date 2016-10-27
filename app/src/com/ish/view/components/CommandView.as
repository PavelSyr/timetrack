package com.ish.view.components
{
	import com.ish.commands.AddNewTaskCommand;
	import com.ish.commands.ClearTaskListCommand;
	import com.ish.view.components.buttons.Button;
	
	import flash.display.Sprite;
	
	import utils.ButtonPool;
	
	public class CommandView extends Sprite
	{
		private var _buttons : Vector.<Button>
		
		public function CommandView($width : Number, $height : Number)
		{
			super();
			draw($width, $height);
			prepareComponents();
			layout();
			addChildren();
		}
		
		protected function prepareComponents() : void
		{
			_buttons = new Vector.<Button>();
			
			var btn : Button = ButtonPool.getLabelButton("add");
			btn.registerCommand(new AddNewTaskCommand());
			_buttons.push(btn);
			btn = ButtonPool.getLabelButton("clear");
			btn.registerCommand(new ClearTaskListCommand());
			_buttons.push(btn);
		}
		
		protected function layout () : void
		{
			var nextX : Number = 2;
			var gap : Number = 2;
			for (var i:int = 0; i < _buttons.length; i++) 
			{
				_buttons[i].x = nextX;
				_buttons[i].y = (height - _buttons[i].height) >> 1;
				nextX = _buttons[i].x + _buttons[i].width + gap; 
			}
		}
		
		protected function addChildren() : void
		{
			for (var i:int = 0; i < _buttons.length; i++) 
			{
				addChild(_buttons[i]);
			}
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