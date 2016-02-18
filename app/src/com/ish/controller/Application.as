class Arg {}
package com.ish.controller
{
	import com.ish.model.AbstractModel;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;

	public class Application extends AbstractModel
	{
		private static var _inst : Application;
		public static function get inst () : Application
		{
			if (!_inst){
				_inst = new Application(new Arg());
			}
			return _inst;
		}
		
		public function Application($arg : Arg)
		{
			super();
			$arg = null;
			
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, onActivate);
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, onDeactivate);
			NativeApplication.nativeApplication.addEventListener(Event.EXITING, onExiting);
		}
		
		protected function onExiting(event:Event):void
		{
			notifyAll(event.type);
		}
		
		protected function onDeactivate(event:Event):void
		{
			notifyAll(event.type);
		}
		
		protected function onActivate(event:Event):void
		{
			notifyAll(event.type);
		}
	}
}
