package com.ish.model
{
	public class AbstractModel
	{
		protected var _observerContainer : ObserverContainer;
		
		public function AbstractModel()
		{
			_observerContainer = new ObserverContainer();
		}
		
		public function addObserver($observer : INotifiable) : void
		{
			_observerContainer.addObserver($observer);
		}
		
		public function notifyAll($data : Object) : void
		{
			_observerContainer.notifyAll($data);
		}
		
	}
}