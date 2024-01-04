# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @return {Float[]}


def average_of_levels(root)
  nodes = {}
  traverse(root, 0, nodes)
  result = []
  nodes.each do |key, val|
    result << val.sum.to_f/val.size
  end
  result
end

def traverse(node, level, nodes)
  return if !node
  if nodes[level]
    nodes[level] = nodes[level].push(node.val)
  else
    nodes[level] = [node.val]
  end
  traverse(node.left, level + 1, nodes)
  traverse(node.right, level + 1, nodes)
end


n3 = TreeNode.new(3)
n9 = TreeNode.new(9)
n20 = TreeNode.new(20)
n15 = TreeNode.new(15)
n7 = TreeNode.new(7)
n3.left = n9
n3.right = n20
n20.left = n15
n20.right = n7

puts average_of_levels(n3)