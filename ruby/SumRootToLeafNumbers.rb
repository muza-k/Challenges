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
# @return {Integer}
def sum_numbers(root)
  root_val = ""
  numbers = getNumber(root, root_val)
  sum = 0
  numbers.each do |number|
    sum += number.to_i
  end
  sum
end

def getNumber(root, root_val)
  root_val = "#{root_val}#{root.val}"
  numbers = []
  numbers << getNumber(root.left, root_val) if root.left
  numbers << getNumber(root.right, root_val) if root.right
  if !root.left && !root.right
    numbers << root_val
  end
  numbers.flatten
end

n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n1 = TreeNode.new(1, n2, n3)
puts sum_numbers(n1)

#3.55