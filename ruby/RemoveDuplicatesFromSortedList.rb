# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  return head if !head || !head.next
  p = ListNode.new(0)
  p.next = head
  start = p
  current_node = head
  next_node = current_node.next
  while current_node
    if next_node && current_node.val == next_node.val
      while next_node && next_node.val == current_node.val
        next_node = next_node.next
      end
      p.next = next_node
      current_node = next_node
      next_node = next_node.next if next_node
    else
      p.next = current_node
      p = current_node
      current_node = next_node
      next_node = next_node.next if next_node
    end
  end
  start.next
end