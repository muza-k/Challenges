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
# @return {TreeNode}
def invert_tree(root)
  # If no left & right nodes, do nothing and return
  return if !root || (!root.left && !root.right)

  # if left node is present and no right node, switch and return
  if root.left && !root.right
    root.right = root.left
    root.left = nil
    invert_tree(root.right)
  end

  # if right node is present and no left node, switch and return
  if root.right && !root.left
    root.left = root.right
    root.right = nil
    invert_tree(root.left)
  end

  # if left and right nodes are present, switch and invert their children
  t = root.left
  root.left = root.right
  root.right = t
  invert_tree(root.left)
  invert_tree(root.right)
end