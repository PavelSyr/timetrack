package com.ish.commands
{
	import com.ish.interfaces.ICommand;
	import com.ish.model.Model;
	
	public class RemoveTaskCommand implements ICommand
	{
		public function execute($data:Object):void
		{
			Model.inst.removeTask(int($data));
		}
	}
}