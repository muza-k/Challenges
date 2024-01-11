# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end
# @param {ListNode} head
# @return {ListNode}
def rotate_right(head, k)
  #traverse list and get length
  return nil if !head

  current_node = head
  len = 1
  while current_node.next
    current_node = current_node.next
    len += 1
  end

  rotations = k%len

  return head if len <= 1 || k == 0 || rotations == 0

  #get list end
  i = 1
  current_node = head
  while i < len - rotations
    current_node = current_node.next
    i += 1
  end



  start_node = current_node.next
  current_node.next = nil

  #get to end of start node and join to head
  current_node = start_node
  while current_node && current_node.next
    current_node = current_node.next
  end
  current_node.next = head

  # puts "End node is #{current_node.val}"
  # puts "Length of list - #{len}, rotations - #{rotations}"
  #puts start_node.inspect
  start_node
end


n1 = ListNode.new(1)
n2 = ListNode.new(2)
n3 = ListNode.new(3)
n4 = ListNode.new(4)
n5 = ListNode.new(5)

n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
rotate_right(n1, 6)
