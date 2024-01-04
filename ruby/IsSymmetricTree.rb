class Node
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end


def is_symmetric(root)
  is_same(root.left, root.right)
end

def is_same(node1, node2)
  return true if !node1 && !node2
  return false if (node1 && !node2) || (node2 && !node1)
  return false if node1.val != node2.val
  is_same(node1.left, node2.right) && is_same(node1.right, node2.left)
end

Tree1Node3 = Node.new(3)
Tree1Node4 = Node.new(4)
Tree1Node2 = Node.new(2, Tree1Node3, Tree1Node4)

Tree2Node4 =  Node.new(4)
Tree2Node3 = Node.new(3)
Tree2Node2 = Node.new(2, Tree2Node4, Tree2Node3)

Node1 = Node.new(1, Tree1Node2, Tree2Node2)
puts is_symmetric(Node1)