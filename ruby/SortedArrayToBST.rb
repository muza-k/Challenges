# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  root_index = nums.size/2
  root_value = nums[root_index]
  node = TreeNode.new(root_value)
  left_array = nums[0...root_index]
  right_array = nums[root_index+1..-1]
  node.left = sorted_array_to_bst(left_array) if left_array.any?
  node.right = sorted_array_to_bst(right_array) if right_array.any?
  node
end

nums = [-10, -3, 0, 5, 9]

puts sorted_array_to_bst(nums).inspect