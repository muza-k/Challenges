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
  slow = head
  fast = head
  while true
    return false if !slow || !fast || !slow.next || !fast.next || !fast.next.next
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end
  return true
end

