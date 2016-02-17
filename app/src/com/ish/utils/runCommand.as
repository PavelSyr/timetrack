package com.ish.utils
{
	import com.ish.commands.ICommand;

	public function runCommand($command : ICommand, $data : Object) : void
	{
		$command.execute($data);
	}
}