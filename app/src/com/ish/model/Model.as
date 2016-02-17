package com.ish.model
{
	import com.ish.controller.TaskController;
	import com.ish.view.components.TaskView;
	
	public class Model extends AbstractModel
	{
		private static var _inst : Model;
		public static function get inst () : Model
		{
			if (!_inst)
				_inst = new Model();
			return _inst;
		}
		
		
		private var _taskMap : Vector.<TaskController>;
		
		public function Model()
		{
			super();
			_taskMap = new Vector.<TaskController>();
		}
		
		public function addTask() : void
		{
			var id : int = _taskMap.length;
			var tm : TaskModel = new TaskModel();
			var tc : TaskController = new TaskController(tm);
			var tv : TaskView = new TaskView();
			tm.addObserver(tv);
			_taskMap.push(tc);
			_observerContainer.notifyAll(tv);
			tm.id = _taskMap.length-1;
			tc.idel();
		}
		
		public function runTask($id : int) : void
		{
			var tc : TaskController = getTaskControllerById($id);
			if (tc){
				tc.start();
			}
		}
		
		public function pauseTask($id : int) : void
		{
			var tc : TaskController = getTaskControllerById($id);
			if (tc){
				tc.pause();
			}
		}
		
		public function resumeTask($id : int) : void
		{
			var tc : TaskController = getTaskControllerById($id);
			if (tc){
				tc.resume();
			}
		}
		
		public function stopTask($id : int) : void
		{
			var tc : TaskController = getTaskControllerById($id);
			if (tc){
				tc.stop();
			}
			addTask();
		}
		
		public function getTaskControllerById($id : int) : TaskController
		{
			var tc : TaskController;
			if ($id < _taskMap.length){
				tc = _taskMap[$id];
			}
			return tc;
		}
	}
}