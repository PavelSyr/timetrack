package com.ish.commands
{
	import com.ish.interfaces.ICommand;
	import com.ish.model.Model;
	
	public class ClearTaskLixtCommand implements ICommand
	{
		public function execute($data:Object):void
		{
			Model.inst.cleateTaskList();
		}
	}
}