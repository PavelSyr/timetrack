package utils
{
	import flash.net.SharedObject;
	import flash.utils.Dictionary;

	public class SORepository
	{
		private var _keys : Dictionary
		private var so_prefix :String = "so";
		
		public function SORepository($prefix : String = "so")
		{
			_keys = new Dictionary();
			so_prefix = $prefix;
		}
		
		public function save ($obj : Object, $key : String="") : void
		{
			_keys[$key] = true;
			var so : SharedObject = SharedObject.getLocal(so_prefix + $key);
			for (var k : String in $obj){
				so.data[k] = $obj[k];
			}
			so.flush();
		}
		
		public function load ($key : String="") : Object
		{
			_keys[$key] = true;
			var so : SharedObject = SharedObject.getLocal(so_prefix + $key);
			var obj : Object = {};
			for (var k : String in so.data){
				obj[k] = so.data[k];
			}
			return obj;
		}
		
		public function clear ($key : String="") : void
		{
			var so : SharedObject = SharedObject.getLocal(so_prefix + $key);
			so.clear();
			so.flush();
			delete _keys[$key];
		}
		
		public function clearAll() : void
		{
			for (var key : String in _keys) 
			{
				clear(key);
			}
		}
		
		public function dispose () : void
		{
			so_prefix = null;
			for (var key : String in _keys) 
			{
				delete _keys[key];
			}
			_keys = null;
		}
	}
}