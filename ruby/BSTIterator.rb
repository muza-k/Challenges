# Definition for a binary tree node.
class ListNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
class BSTIterator
  attr_accessor :nodes, :position
=begin
    :type root: TreeNode
=end
  def initialize(root)
    @nodes = []
    populate_nodes(root)
    @position = -1
    #puts "Nodes - #{@nodes.inspect}"
  end


=begin
    :rtype: Integer
=end
  def next()
    @position = @position + 1
    @nodes[@position] if @position < @nodes.length - 1
  end


=begin
    :rtype: Boolean
=end
  def has_next()
    if @position < @nodes.length
      return true
    else
      return false
    end
  end

  private
  def populate_nodes(root)
    return nil if !root
    populate_nodes(root.left)
    nodes << root.val
    populate_nodes(root.right)
  end

end

# Your BSTIterator object will be instantiated and called as such:
n7 = ListNode.new(7)
n3 = ListNode.new(3)
n15 = ListNode.new(15)
n9 = ListNode.new(9)
n20 = ListNode.new(20)
n7.left = n3
n7.right = n15
n15.left = n9
n15.right = n20

obj = BSTIterator.new(n7)
param_1 = obj.next()
param_2 = obj.has_next()

#10.43