package com.ish.commands
{
	import com.ish.model.Model;
	import com.ish.interfaces.ICommand;

	public class AddNewTaskCommand implements ICommand
	{
		public function AddNewTaskCommand()
		{
		}
		
		public function execute($data:Object):void
		{
			Model.inst.addTask();
		}
	}
}