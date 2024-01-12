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
def build_tree(preorder, inorder)
    length = inorder.length
    root = preorder.shift

    if length == 0
        return nil
    end

    if preorder.length == 0
        return TreeNode.new(root)
    end

    root_index = inorder.index(root)
    inorder_left = inorder[0...root_index]
    inorder_right = inorder[root_index+1..-1]
    preorder_left = preorder[0,inorder_left.length]
    preorder_right = preorder[inorder_left.length..-1]
    node = TreeNode.new(root, build_tree(preorder_left, inorder_left), build_tree(preorder_right, inorder_right))
    puts node.inspect
    node
end


preorder = [1, 2]
inorder = [2, 1]
build_tree(preorder, inorder)