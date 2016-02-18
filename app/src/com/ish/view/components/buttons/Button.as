package com.ish.view.components.buttons
{
	import com.ish.interfaces.ICommand;
	import utils.runCommand;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	public class Button extends Sprite
	{
		public static const STATE_UP : int = 0;
		public static const STATE_DOWN : int = 1;
		
		protected var _command : ICommand;
		protected var _state   : int;
		protected var _drawMap : Dictionary;
		protected var _data    : Object;
		
		protected var _bgWidth  : Number;
		protected var _bgHeight : Number;
		protected var _bgColor  : uint;
		
		public function Button($bgWidth : Number, $bgHeight : Number, $bgColor: uint)
		{
			super();
			_bgColor = $bgColor;
			_bgHeight = $bgHeight;
			_bgWidth = $bgWidth;
			_drawMap = new Dictionary();
			initDrawMap();
			addListeners();
			state = STATE_UP;
			buttonMode = true;
		}
		
		public function get data():Object{return _data;}
		public function set data($value:Object):void{_data = $value;}
		
		public function get state () : int{return _state;}
		public function set state ($value : int) : void{
			_state = $value;
			draw();
		}
		
		public function registerCommand($command : ICommand) : void
		{
			_command = $command;
		}
		
		public function dispose() : void
		{
			removeListeners();
			_command = null;
		}
		
		protected function initDrawMap():void
		{
			
		}
		
		protected function draw () : void
		{
			var f: Function = _drawMap[_state];
			if (f)
				f.call(this);
		}
		
		protected function drawBg (): void
		{
			graphics.beginFill(_bgColor);
			graphics.drawRect(0,0,_bgWidth, _bgHeight);
			graphics.endFill();
		}
		
		protected function addListeners() : void
		{
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			addEventListener(MouseEvent.MOUSE_UP, onUp);
			addEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		
		protected function removeListeners () : void
		{
			removeEventListener(MouseEvent.CLICK, onClick);
			removeEventListener(MouseEvent.MOUSE_DOWN, onDown);
			removeEventListener(MouseEvent.MOUSE_UP, onUp);
			removeEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			runCommand(_command, _data);
		}
		
		protected function onUp(event:MouseEvent):void
		{
			state = STATE_UP;
		}
		
		protected function onDown(event:MouseEvent):void
		{
			state = STATE_DOWN;
		}
		
		protected function onOut(event:MouseEvent):void
		{
			state = STATE_UP;			
		}
	}
}