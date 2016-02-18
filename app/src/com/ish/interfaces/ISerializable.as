package com.ish.interfaces
{
	public interface ISerializable 
	{
		function toObject() : Object
		function fromObject($obj : Object) : void
	}
}