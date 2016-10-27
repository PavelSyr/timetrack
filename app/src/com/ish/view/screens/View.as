package com.ish.view.screens
{
	import com.ish.interfaces.INotifiable;
	import com.ish.view.components.CommandView;
	import com.ish.view.components.TaskView;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class View extends Sprite implements INotifiable
	{
		private var _commandView : CommandView;
		
		public function View()
		{
			super();
			_commandView = new CommandView(770, 35);
			_commandView.y = 2;
			addChild(_commandView);
		}
		
		public function notify($data : Object) : void
		{
			if ($data != null){
				var tv : TaskView = $data as TaskView;
				addChild(tv);
			}
			refresh();
		}
		
		private function refresh() : void
		{
			var i : int = 0;
			var gap : int = 2;
			var nextY : Number = _commandView.y + _commandView.height + gap;
			while(i < numChildren){
				var ch : DisplayObject = getChildAt(i);
				if (ch != _commandView){
					ch.y = nextY;
					nextY = ch.y + ch.height + gap;
				}
				i++;
			}
		}
	}
}