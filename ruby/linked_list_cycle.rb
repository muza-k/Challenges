# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  visited_nodes = {}
  current_node = head
  while current_node
    return true if visited_nodes[current_node]
    visited_nodes[current_node] = true
    current_node = current_node.next
  end
  return false

end

