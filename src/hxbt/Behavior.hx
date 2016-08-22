package hxbt;
import hxbt.Behavior.Status;

/*
 * Behavior states.
 */
enum Status 
{
	INVALID;
	SUCCESS;
	FAILURE;
	RUNNING;
}

/**
 * Base class for all actions, conditons and composites.
 * A composite is a branch in the behavior tree.
 * @author Kristian Brodal
 */
 @:keepSub
class Behavior<T>
{
	
	public var status(default, null) : Status = Status.INVALID;
	
	public function new() 
	{
	}
	
	public function update( context : T, dt : Float) : Void { }
	public function onInitialize( context : T) : Void { }
	public function onTerminate(context : T, status : Status) : Void { }
	
	public function tick(context : Dynamic, dt : Float) : Status 
	{
		if (status == Status.INVALID)
		{
			status = Status.RUNNING;
			onInitialize(context);
		}
		
		update(context, dt);
		
		if (status != Status.RUNNING)
		{
			onTerminate(context, status);
		}
		
		return status;
	}
	
}