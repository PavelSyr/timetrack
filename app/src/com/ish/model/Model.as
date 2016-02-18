class Arg {}
package com.ish.model
{
	import com.ish.controller.TaskController;
	import com.ish.interfaces.INotifiable;
	import com.ish.interfaces.ISerializable;
	import com.ish.view.components.TaskView;
	
	import flash.events.Event;
	
	import utils.FunctioinMap;
	import utils.SORepository;
	
	public class Model extends AbstractModel implements ISerializable, INotifiable
	{
		private static var _inst : Model;
		public static function get inst () : Model
		{
			if (!_inst)
				_inst = new Model(new Arg());
			return _inst;
		}
		
		
		private var _tasks : Vector.<TaskController>;
		private var _noteMap : FunctioinMap;
		private var _rep : SORepository;
		
		public function Model($arg : Arg)
		{
			super();
			_rep = new SORepository("mode");
			_tasks = new Vector.<TaskController>();
			_noteMap = new FunctioinMap();
			_noteMap.map(Event.DEACTIVATE, save);
			_noteMap.map(Event.EXITING, save);
		}
		
		public function notify($data : Object) : void
		{
			_noteMap.call($data);
		}
		
		public function addTask($data : Object = null) : void
		{
			var id : int = _tasks.length;
			var tm : TaskModel = new TaskModel();
			var tc : TaskController = new TaskController(tm);
			var tv : TaskView = new TaskView();
			tm.addObserver(tv);
			_tasks.push(tc);
			_observerContainer.notifyAll(tv);
			tm.id = _tasks.length-1;
			if ($data){
				tc.fromObject($data);
			} else {
				tc.idel();
			}
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
			if ($id < _tasks.length){
				tc = _tasks[$id];
			}
			return tc;
		}
		
		public function toObject() : Object
		{
			var obj : Array = [];
			for (var i:int = 0; i < _tasks.length; i++) 
			{
				obj[i] = _tasks[i].toObject();
			}
			return obj;
		}
		
		public function fromObject($obj : Object) : void
		{
			for each (var t:Object in $obj) 
			{
				addTask(t);
			}
		}
		
		public function save() : void
		{
			_rep.save(toObject());
		}
		
		public function load() : void
		{
			fromObject(_rep.load());
		}
		
		public function init():void
		{
			load();
			if (_tasks.length == 0){
				addTask();
			}
		}
	}
}