# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def level_order(root)
  lookup = {}
  level = 0
  traverse(root, level, lookup)
  #puts "Lookup after traversing - #{lookup.inspect}"
  result = []
  lookup.each do |k, v|
    result << v
  end
  result
end

def traverse(root, level, lookup)
  return if !root

  level = level + 1
  if lookup[level]
    nodes_at_level = lookup[level]
    nodes_at_level << root.val
  else
    lookup[level] = [root.val]
  end
  traverse(root.left, level, lookup)
  traverse(root.right, level, lookup)
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
puts level_order(n3).inspect