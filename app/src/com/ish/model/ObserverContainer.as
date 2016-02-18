package com.ish.model
{
	import com.ish.interfaces.INotifiable;

	public class ObserverContainer
	{
		private var _observers : Vector.<INotifiable>;
		
		public function ObserverContainer()
		{
			_observers = new Vector.<INotifiable>();
		}
		
		public function addObserver($observer : INotifiable) : void
		{
			if (_observers.indexOf($observer) == -1){
				_observers.push($observer);
			}
		}
		
		public function removeObserver($observer : INotifiable) : void
		{
			var index : int = _observers.indexOf($observer);
			if (index != -1)
				_observers.splice(index, 1);
		}
		
		public function notifyAll($data : Object) : void
		{
			for (var i:int = 0; i < _observers.length; i++) 
			{
				_observers[i].notify($data);
			}
			
		}
	}
}