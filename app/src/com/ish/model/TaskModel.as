package com.ish.model
{
	import com.ish.interfaces.ISerializable;

	public class TaskModel extends AbstractModel implements ISerializable
	{
		private var _state     : int;
		private var _id		   : int;
		private var _task	   : String;
		private var _startDate : Number;
		private var _endDate   : Number;
		private var _pauseDelay: Number;
		
		public function TaskModel()
		{
			super();
			_task = "";
			_startDate = 0;
			_endDate = 0;
			_pauseDelay = 0;
		}
		
		public function get result () : Number
		{
			return _endDate - _startDate - _pauseDelay;
		}

		public function get pauseDelay():Number{return _pauseDelay;}
		public function set pauseDelay(value:Number):void{
			if(_pauseDelay != value){
				_pauseDelay = value;
				changed();
			}
		}

		public function get id():int{return _id;}
		public function set id(value:int):void{
			if(_id != value){
				_id = value;
				changed();
			}
		}

		public function get endDate():Number{return _endDate;}
		public function set endDate(value:Number):void{
			if (_endDate != value){
				_endDate = value;
				changed();
			}
		}
		public function get startDate():Number{return _startDate;}
		public function set startDate(value:Number):void{
			if (_startDate != value){
				_startDate = value;
				changed();
			}
		}
		public function get task():String{return _task;}
		public function set task(value:String):void{
			if(_task != value){
				_task = value;
			}
		}
		public function get state():int{return _state;}
		public function set state(value:int):void{
			if(_state != value){
				_state = value;
				changed();
			}
		}
		
		public function toObject() : Object
		{
			var obj : Object = {};
			obj.state = _state;
			obj.id = _id;
			obj.task = _task;
			obj.startDate = _startDate;
			obj.endDate = _endDate;
			obj.pauseDelay = _pauseDelay;
			return obj;
		}
		
		public function fromObject($obj : Object) : void
		{
			if (!$obj) return;
			_state = $obj.state;
			_id = $obj.id;
			_task = $obj.task;
			_startDate = $obj.startDate;
			_endDate = $obj.endDate;
			_pauseDelay = $obj.pauseDelay;
			changed();
		}
		
		
		private function changed() : void
		{
			_observerContainer.notifyAll(this);
		}
		
	}
}