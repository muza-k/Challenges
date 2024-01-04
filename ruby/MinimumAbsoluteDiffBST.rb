# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference(root)
  values = []
  traverse(root, values)
  diff = []
  index = 0
  values = values.sort
  while index < values.length - 1
    diff << (values[index] - values[index+1]).abs
    index = index + 1
  end
  diff.min
end

def traverse(root, values)
  return if !root
  values.push(root.val)
  traverse(root.left, values)
  traverse(root.right, values)
end