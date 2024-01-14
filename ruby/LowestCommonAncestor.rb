# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def lowest_common_ancestor(root, p, q)
  lookup = { p.val => p, q.val => q}
  p_path = get_path(root, p.val, '', lookup)
  q_path = get_path(root, q.val, '', lookup)
  # puts "#{p.val} path is #{p_path.inspect}"
  # puts "#{q.val} path is #{q_path.inspect}"
  #
  # puts "compare paths"

  i = 0
  p_path = p_path.split(',').map(&:to_i)
  q_path = q_path.split(',').map(&:to_i)
  puts "P path #{p_path.inspect}"
  puts "Q path is #{q_path.inspect}"
  while i < p_path.length
    if p_path[i] != q_path[i]
      break
    end
    i = i + 1
  end
  #puts "Common ancestor is #{p_path[i-1]}"
  lookup[p_path[i-1]]
end

def get_path(root, p, path, lookup)
  if !root
    return nil
  end

  lookup[root.val] = root

  if root.val == p
    return "#{path},#{root.val}"
  end

  left_path = get_path(root.left, p, "#{path},#{root.val}", lookup) if root.left
  return left_path if left_path

  right_path = get_path(root.right, p, "#{path},#{root.val}", lookup) if root.right
  return right_path if right_path

  nil
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
puts lowest_common_ancestor(n3, n5, n1)