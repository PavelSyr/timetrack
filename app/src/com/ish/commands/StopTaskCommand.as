package com.ish.commands
{
	import com.ish.model.Model;
	import com.ish.interfaces.ICommand;

	public class StopTaskCommand implements ICommand
	{
		public function StopTaskCommand()
		{
		}
		
		public function execute($data:Object):void
		{
			Model.inst.stopTask(int($data));
		}
	}
}