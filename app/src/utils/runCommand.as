package utils
{
	import com.ish.interfaces.ICommand;

	public function runCommand($command : ICommand, $data : Object) : void
	{
		$command.execute($data);
	}
}