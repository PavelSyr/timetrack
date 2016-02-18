package com.ish.commands
{
	import com.ish.model.Model;
	import com.ish.interfaces.ICommand;

	public class PauseTaskCommand implements ICommand
	{
		public function PauseTaskCommand()
		{
		}
		
		public function execute($data:Object):void
		{
			Model.inst.pauseTask(int($data));
		}
	}
}