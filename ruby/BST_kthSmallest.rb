# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  end
def kth_smallest(root, k)
  nodes = []
  traverse(root, nodes)
  nodes.sort!
  nodes[k-1]
end

def traverse(root, nodes)
  return if !root
  nodes << root.val
  traverse(root.left, nodes)
  traverse(root.right, nodes)
end

n3 = TreeNode.new(3)
n5 = TreeNode.new(5)
n1 = TreeNode.new(1)
n6 = TreeNode.new(6)
n2 = TreeNode.new(2)
n7 = TreeNode.new(7)
n4 = TreeNode.new(4)
n0 = TreeNode.new(0)
n8 = TreeNode.new(8)

n3.left = n5
n3.right = n1
n5.left = n6
n5.right = n2
n2.left = n7
n2.right = n4
n1.left = n0
n1.right = n8
puts kth_smallest(n3, 2).inspect