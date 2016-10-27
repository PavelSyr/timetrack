package com.ish.controller
{
	import com.ish.TaskEnum;
	import com.ish.interfaces.ISerializable;
	import com.ish.model.TaskModel;
	
	import utils.FunctioinMap;
	
	public class TaskController implements ISerializable
	{
		private var _stateMap  : FunctioinMap;
		private var _model 	   : TaskModel;

		public function TaskController($model : TaskModel)
		{
			_model = $model;
			_stateMap = new FunctioinMap();
			_stateMap.map(TaskEnum.STATE_IDEL, idelState);
			_stateMap.map(TaskEnum.STATE_RUN, runState);
			_stateMap.map(TaskEnum.STATE_RESUME, resumeState);
			_stateMap.map(TaskEnum.STATE_PAUSE, pauseState);
			_stateMap.map(TaskEnum.STATE_STOP, stopState);
			_stateMap.map(TaskEnum.STATE_CLEAR, clearState);
		}
		
		public function get id () : int
		{
			return _model.id;
		}
		
		public function idel():void
		{
			setState(TaskEnum.STATE_IDEL);
		}
		
		public function start() : void
		{
			setState(TaskEnum.STATE_RUN);
		}
		
		public function resume() : void
		{
			setState(TaskEnum.STATE_RESUME);
		}
		
		public function pause() : void
		{
			setState(TaskEnum.STATE_PAUSE);
		}
		public function stop() : void
		{
			setState(TaskEnum.STATE_STOP);
		}
		
		public function clear():void
		{
			setState(TaskEnum.STATE_CLEAR);
		}
		
		public function toObject() : Object
		{
			return _model.toObject();
		}
		
		public function fromObject($obj : Object) : void
		{
			_model.fromObject($obj);
			setState(_model.state);
		}
		
		public function dispose() : void
		{
			_model.dispose();
			_model = null;
			_stateMap.dispose();
			_stateMap = null;
		}
		
		private function setState($value : int) : void
		{
			_stateMap.call($value);
			_model.state = $value;
		}
		
		private function idelState():void
		{
			_model.startDate = new Date().time;
			_model.endDate = 0;
			_model.pauseDelay = 0;
		}
		
		private function runState() : void
		{
			_model.startDate = new Date().time;
			_model.endDate = 0;
			_model.pauseDelay = 0;
		}
		
		private function stopState() : void
		{
			_model.endDate = new Date().time;
		}
		
		private function resumeState() : void
		{
			var tmp : Number = new Date().time - _model.endDate;
			_model.pauseDelay += tmp;
			_model.endDate = 0;
		}
		
		private function pauseState() : void
		{
			_model.endDate = new Date().time;
		}
		
		
		private function clearState():void
		{
			_model.endDate = 0;
			_model.startDate = 0;
			_model.pauseDelay = 0;
			_model.state = TaskEnum.STATE_CLEAR;
		}
	}
}