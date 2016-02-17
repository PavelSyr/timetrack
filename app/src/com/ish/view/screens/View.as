package com.ish.view.screens
{
	import com.ish.model.INotifiable;
	import com.ish.view.components.TaskView;
	
	import flash.display.Sprite;
	
	public class View extends Sprite implements INotifiable
	{
		public function View()
		{
			super();
		}
		
		public function notify($data : Object) : void
		{
			var tv : TaskView = $data as TaskView;
			tv.y = height;
			addChild(tv);
		}
	}
}