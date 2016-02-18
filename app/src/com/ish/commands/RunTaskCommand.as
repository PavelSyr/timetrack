package com.ish.commands
{
	import com.ish.model.Model;
	import com.ish.interfaces.ICommand;

	public class RunTaskCommand implements ICommand
	{
		public function RunTaskCommand()
		{
		}
		
		public function execute($data:Object):void
		{
			Model.inst.runTask(int($data));
		}
	}
}