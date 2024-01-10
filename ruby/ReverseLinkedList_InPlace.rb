
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def reverse(head)
  previous_node = nil
  current_node = head
  next_node = current_node.next

  while current_node
    current_node.next = previous_node
    previous_node = current_node
    break if !next_node
    current_node = next_node
    next_node = current_node.next
  end

  puts current_node.inspect
end


n5 = ListNode.new(5)
n4 = ListNode.new(4, n5)
n3 = ListNode.new(3, n4)
n2 = ListNode.new(2, n3)
n1 = ListNode.new(1, n2)


reverse(n1)