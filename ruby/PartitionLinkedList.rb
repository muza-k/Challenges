class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def partition(head, x)
  lower_list = ListNode.new(0)
  upper_list = ListNode.new(0)
  lower_node = lower_list
  upper_node = upper_list
  current_node = head
  middle_node = nil
  return head if !current_node || !current_node.next #return head if there are no elements or if there is only 1 element

  while current_node
    next_node = current_node.next
    current_node.next = nil
    if current_node.val < x
      lower_node.next = current_node
      lower_node = lower_node.next
    elsif current_node.val >= x
      upper_node.next = current_node
      upper_node = upper_node.next
    end
    current_node = next_node
  end

  # puts "lower list"
  # puts lower_list.inspect
  # puts "Upper List"
  # puts upper_list.inspect
  # puts "middle node"
  # puts middle_node.inspect

  # merge lists
  lower_node.next = upper_list.next

  #puts lower_list.next.inspect
  lower_list.next
end
#
n5 = ListNode.new(5)
n4 = ListNode.new(4, n5)
n3 = ListNode.new(3, n4)
n2 = ListNode.new(2, n3)
n1 = ListNode.new(1, n2)

partition(n1, 3)