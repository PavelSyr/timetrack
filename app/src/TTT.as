package
{
	import com.ish.model.Model;
	import com.ish.view.screens.View;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	public class TTT extends Sprite
	{
		public function TTT()
		{
			(stage)? initApp() : addEventListener(Event.ADDED_TO_STAGE, initApp);
		}
		
		protected function initApp(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initApp);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			var model : Model = Model.inst;
			var view : View = new View();
			addChild(view);
			model.addObserver(view);
			model.addTask();
		}
	}
}