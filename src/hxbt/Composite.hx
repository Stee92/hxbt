package hxbt;

/**
 * ...
 * @author Kristian Brodal
 */
class Composite<T> extends Behavior<T>
{
	private var m_children : Array<Behavior<T>>;
	
	public function new() 
	{
		super();
		m_children = new Array<Behavior<T>>();
	}
	
	/*
	 * Add child to the end of the child array.
	 */
	public function add(b : Behavior<T>) : Composite<T>
	{
		m_children.push(b);
		return this;
	}
	
	/*
	 * Remove given child from the array of children.
	 */
	public function remove(b : Behavior<T>) : Composite<T>
	{
		m_children.remove(b);
		return this;
	}
}