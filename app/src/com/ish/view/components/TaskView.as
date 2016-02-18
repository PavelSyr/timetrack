package com.ish.view.components
{
	import com.ish.TaskEnum;
	import com.ish.commands.PauseTaskCommand;
	import com.ish.commands.ResumeTaskCommand;
	import com.ish.commands.RunTaskCommand;
	import com.ish.commands.StopTaskCommand;
	import com.ish.interfaces.INotifiable;
	import com.ish.model.TaskModel;
	import utils.ButtonPool;
	import utils.FunctioinMap;
	import utils.TextUtils;
	import com.ish.view.components.buttons.Button;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	public class TaskView extends Sprite implements INotifiable
	{
		private var _startTimeTF : TextField;
		private var _taskTF      : TextField;
		private var _endTimeTF   : TextField;
		private var _pauseTF     : TextField;
		private var _resultTF    : TextField;
		private var _rectBtn     : Button;
		private var _pauseBtn    : Button;
		private var _stopBtn     : Button;
		private var _state       : int;
		private var _stateMap    : FunctioinMap;
		
		public function TaskView()
		{
			super();
			draw(840, 35);
			prepareComponents();
			layout();
			addChildren();
			_stateMap = new FunctioinMap();
			_stateMap.map(TaskEnum.STATE_IDEL, toIdel);
			_stateMap.map(TaskEnum.STATE_PAUSE, toPause);
			_stateMap.map(TaskEnum.STATE_RESUME, toResume);
			_stateMap.map(TaskEnum.STATE_RUN, toRun);
			_stateMap.map(TaskEnum.STATE_STOP, toStop);
		}
		
		
		public function notify($data : Object) : void
		{
			var model : TaskModel = $data as TaskModel;
			var result : Number = model.result;
			_startTimeTF.text = (model.startDate > 0)? TextUtils.getLocalTimeStr(model.startDate) : "0";
			_endTimeTF.text = (model.endDate > 0)? TextUtils.getLocalTimeStr(model.endDate) : "0";
			_pauseTF.text = (model.pauseDelay > 0)? TextUtils.getTimeStr(model.pauseDelay) : "0";
			_resultTF.text = (result > 0)?  TextUtils.getTimeStr(result)+ "/" + TextUtils.getHours(result).toFixed(2) : "0"
			if (_taskTF.text && _taskTF.text.length > 0){
				model.task = _taskTF.text;
			} else {
				_taskTF.text = model.task;
			}
			state = model.state;
			_rectBtn.data = model.id;
			_pauseBtn.data = model.id;
			_stopBtn.data = model.id;
		}
		
		protected function set state ($state : int) : void
		{
			_state = $state;
			_stateMap.call(_state);
		}
		
		protected function prepareComponents() : void
		{
			var tH : int = 25
			_startTimeTF = TextUtils.getDefaultTextField(100, tH, TextFieldType.DYNAMIC);
			_taskTF		 = TextUtils.getDefaultTextField(300, tH, TextFieldType.INPUT);
			_endTimeTF	 = TextUtils.getDefaultTextField(100, tH, TextFieldType.DYNAMIC);
			_pauseTF	 = TextUtils.getDefaultTextField(100, tH, TextFieldType.DYNAMIC);
			_resultTF	 = TextUtils.getDefaultTextField(100, tH, TextFieldType.DYNAMIC);
			_startTimeTF.border = 
			_taskTF.border = 
			_endTimeTF.border =
			_pauseTF.border = 
			_resultTF.border = true;
			
			_rectBtn  = ButtonPool.getCircleButton();
			_pauseBtn = ButtonPool.getPauseButton();
			_stopBtn  = ButtonPool.getRectButton();
			
			_rectBtn.registerCommand(new RunTaskCommand());
			_pauseBtn.registerCommand(new PauseTaskCommand());
			_stopBtn.registerCommand(new StopTaskCommand());
		}
		
		protected function layout () : void
		{
			var gap : int = 0;
			_startTimeTF.x = 0;
			_startTimeTF.y = (height - _startTimeTF.height) >> 1;
			_taskTF.x = _startTimeTF.x + _startTimeTF.width + gap;
			_taskTF.y = _startTimeTF.y;
			_endTimeTF.x = _taskTF.x + _taskTF.width + gap;
			_endTimeTF.y = _startTimeTF.y;
			_rectBtn.x = _endTimeTF.x + _endTimeTF.width + gap;
			_rectBtn.y = _startTimeTF.y;
			_pauseBtn.x = _rectBtn.x;
			_pauseBtn.y = _rectBtn.y;
			_stopBtn.x = _pauseBtn.x + _pauseBtn.width + gap;
			_stopBtn.y = _pauseBtn.y;
			_pauseTF.x = _stopBtn.x + _stopBtn.width + gap;
			_pauseTF.y = _stopBtn.y;
			_resultTF.x = _pauseTF.x + _pauseTF.width + gap;
			_resultTF.y = _pauseTF.y;
		}
		
		protected function addChildren () : void
		{
			addChild(_startTimeTF);
			addChild(_taskTF);
			addChild(_endTimeTF);
			addChild(_pauseTF);
			addChild(_resultTF);
			addChild(_rectBtn);
			addChild(_stopBtn);
			addChild(_pauseBtn);
		}
		
		protected function draw($width : Number , $height : Number) : void
		{
			graphics.clear();
			graphics.lineStyle(1, 0);
			graphics.drawRect(0,0,$width,1);
			graphics.drawRect(0,$height,$width,1);
			graphics.lineStyle();
		}
		
		private function toIdel():void
		{
			_rectBtn.visible = true;
			_pauseBtn.visible = false;
		}
		
		private function toRun():void
		{
			_rectBtn.visible = false;
			_pauseBtn.visible = true;
		}
		
		private function toResume():void
		{
			_rectBtn.visible = false;
			_pauseBtn.visible = true;
		}
		
		private function toPause():void
		{
			_rectBtn.registerCommand(new ResumeTaskCommand());
			_rectBtn.visible = true;
			_pauseBtn.visible = false;
		}
		
		private function toStop():void
		{
			_rectBtn.visible = false;
			_pauseBtn.visible = false;
			_stopBtn.visible = false;
		}
	}
}