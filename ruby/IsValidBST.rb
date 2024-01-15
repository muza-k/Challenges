# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end
def is_valid_bst(root)
  valid, min, max = is_valid(root, nil, nil)
  puts valid
  valid
end


def is_valid(root, min, max)
  return true if !root

  if (min && root.val <= min) || (max && root.val >= max)
    return false
  end

  left_valid = is_valid(root.left, min, root.val)
  right_valid = is_valid(root.right, root.val, max)

  return left_valid && right_valid
end
#
# n5 = TreeNode.new(5)
# n1 = TreeNode.new(1)
# n4 = TreeNode.new(4)
# n3 = TreeNode.new(3)
# n6 = TreeNode.new(6)
#
# n5.left = n1
# n5.right = n4
# n4.left = n3
# n4.right = n6
n1 = TreeNode.new(2)
n2 = TreeNode.new(2)
n3 = TreeNode.new(2)
n1.left = n2
n1.right = n2

puts is_valid_bst(n1).inspect