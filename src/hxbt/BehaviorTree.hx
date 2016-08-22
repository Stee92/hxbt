package hxbt;

/**
 * Base of a behavior tree, this is used to hold the rest of the tree for the AI
 * as this has extra functionality.
 * @author Kristian Brodal
 */
class BehaviorTree<T>
{
	//	Root of the behavior tree.
	private var m_tree : Behavior<T>;
	
	//	The context contains all the data needed to run
	//	the different behaviors. Also called blackboard in some cases.
	private var m_context : T;
	
	public function new() 
	{
	}
	
	public function setRoot(root : Behavior<T>) : Void
	{
		m_tree = root;
	}
	
	public function setContext(context : T) : Void
	{
		m_context = context;
	}
	
	public function update(dt : Float) : Void
	{
		if (m_tree != null)
		{
			m_tree.tick(m_context, dt);
		}
	}
}