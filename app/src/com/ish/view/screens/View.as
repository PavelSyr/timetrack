package com.ish.view.screens
{
	import com.ish.interfaces.INotifiable;
	import com.ish.view.components.CommandView;
	import com.ish.view.components.TaskView;
	
	import flash.display.Sprite;
	
	public class View extends Sprite implements INotifiable
	{
		private var _commandView : CommandView;
		
		public function View()
		{
			super();
			_commandView = new CommandView();
			_commandView.y = 2;
			addChild(_commandView);
		}
		
		public function notify($data : Object) : void
		{
			var tv : TaskView = $data as TaskView;
			tv.y = (height+2);
			addChild(tv);
		}
	}
}