package com.ish.commands
{
	import com.ish.model.Model;
	import com.ish.interfaces.ICommand;

	public class ResumeTaskCommand implements ICommand
	{
		public function ResumeTaskCommand()
		{
		}
		
		public function execute($data:Object):void
		{
			Model.inst.resumeTask(int($data));
		}
	}
}