package hxbt.composites;
import hxbt.Behavior.Status;

/**
 * A sequence goes through all behaviors attached to it from left to right.
 * Keeps going through behavior until all behaviors have returned SUCCESS.
 * If a single behavior returns FAILURE, the whole sequence fails.
 * @author Kristian Brodal
 * @author Kenton Hamaluik
 */
class Sequence<T> extends Composite<T>
{
	private var m_currentChild : Behavior<T>;
	private var m_currentIndex : Int;
	
	
	public function new() 
	{
		super();
	}
	
	override function onInitialize(context : T)
	{
		m_currentIndex = 0;
	}
	
	override function onTerminate(context : T, status : Status)
	{
		for(_child in m_children)
		{
			_child.status = Status.INVALID;
		}
	}
	
	override function update(context : T, dt : Float) : Void
	{
		if (status == Status.SUCCESS) return; // do not repeat the sequence
		
		// get the current child which is being evaluated
		m_currentChild = m_children[m_currentIndex];
		var s = m_currentChild.tick(context, dt);
		
		//	If the child failed or is still running, early return.
		if (s != Status.SUCCESS)
		{
			return;
		}
		m_currentIndex++;
		//	If end of array hit the whole sequence succeeded.
		if (m_currentIndex == m_children.length)
		{
			//	Reset index otherwise it will crash on next run through
			m_currentIndex = 0;
			status = Status.SUCCESS;
			return;
		}
		
		status = Status.RUNNING;
		return;
	}
}