class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

def has_path_sum(root, target_sum)
  return false if !root
  child_target = target_sum - root.val
  return false if !root.left && !root.right && child_target != 0
  return true if child_target == 0 && !root.left && !root.right
  has_path_sum(root.left, target_sum - root.val) || has_path_sum(root.right, target_sum - root.val)
end

n1 = TreeNode.new(-2)
n2 = TreeNode.new(-3)
n1.right = n2
puts has_path_sum(n1, -5)