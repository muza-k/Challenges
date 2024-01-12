# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  root = postorder.slice!(-1)
  if (inorder.length == 0)
    return nil
  end

  if postorder.length == 0
    return TreeNode.new(root)
  end

  root_index = inorder.index(root)
  inorder_left = inorder[0...root_index]
  inorder_right = inorder[root_index+1..-1]
  postorder_left = postorder[0, inorder_left.length]
  postorder_right = postorder[postorder_left.length..-1]
  a = 1
  node = TreeNode.new(root, build_tree(inorder_left, postorder_left), build_tree(inorder_right, postorder_right))
  node
end


inorder = [9,3,15,20,7]
postorder = [9,15,7,20,3]
build_tree(inorder, postorder)

#3.42