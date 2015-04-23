package behaviour.hxbt;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.BehaviorTree;

/**
 * ...
 * @author Kenton Hamaluik
 */
class BehaviorTreeBehaviour extends BuddySuite
{
	public function new() 
	{
		var tree = new BehaviorTree();
		var behavior:MockBehaviour = new MockBehaviour();
		tree.set(behavior, null);

		describe("Using a behavior tree", {
			it("should wait until the correct time to tick its root", {
				tree.update(0.1);
				behavior.m_initializedCalled.should.be(0);
				tree.update(0.1);
				behavior.m_initializedCalled.should.be(1);
			});
		});
	}
}

