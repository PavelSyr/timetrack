package com.ish.utils
{
	import flash.utils.Dictionary;

	public class FunctioinMap
	{
		private var _map : Dictionary;
		
		public function FunctioinMap()
		{
			_map = new Dictionary();
		}
		
		public function map($key : Object, $f : Function) : void
		{
			_map[$key] = $f;
		}
		
		public function call($key : Object) : Function
		{
			var f : Function = _map[$key]
			if (f) f.call(null);
			return f;
		}
	}
}