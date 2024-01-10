class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def remove_nth_from_end(head, n)
  #traverse list and get the length
  current_node = head
  length = 1
  while current_node.next
    length = length + 1
    current_node = current_node.next
  end

  return nil if length == 1

  #nth node from end = l-n from start
  pos = length - n + 1

  return head.next if pos == 1

  #get to i node
  i = 1
  current_node = head
  while i < pos - 1
    current_node = current_node.next
    i = i + 1
  end
  next_node = nil
  next_node = current_node.next.next if current_node.next
  current_node.next = next_node
  head
end
#
# n5 = ListNode.new(5)
# n4 = ListNode.new(4, n5)
# n3 = ListNode.new(3, n4)
# n2 = ListNode.new(2, n3)
# n1 = ListNode.new(1, n2)
n1 = ListNode.new(1)
n2 = ListNode.new(2)
n1.next = n2

remove_nth_from_end(n1, 2)