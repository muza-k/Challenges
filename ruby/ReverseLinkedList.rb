# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
  return head if left == right
  input_arr = []
  current_node = head
  while current_node
    input_arr << current_node.val
    current_node = current_node.next
  end
  head = nil
  # puts "Input Arr - #{input_arr.inspect}"
  # puts "Truncated list - #{input_arr[left-1, right-1]}"
  left = left - 1
  right = right - 1
  len = input_arr.size
  before_part = input_arr[0,left] || []
  after_part = input_arr[right+1,len-1] || []
  reversed_list = input_arr[left..right].reverse
  #puts "Reversed List - #{reversed_list.inspect}"
  final_list = [before_part, reversed_list, after_part].flatten

  i = final_list.length - 1
  next_node = nil
  node = nil
  while i >= 0
    node = ListNode.new(final_list[i])
    node.next = next_node
    next_node = node
    i = i - 1
  end

  node
end



#
# n5 = ListNode.new(5)
# n4 = ListNode.new(4, n5)
# n3 = ListNode.new(3, n4)
# n2 = ListNode.new(2, n3)
# n1 = ListNode.new(1, n2)
n5 = ListNode.new(5)
n3 = ListNode.new(3, n5)

reverse_between(n3, 1, 2)