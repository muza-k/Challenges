class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  merged_list_node = nil

  # handle scenario where both are nil
  if !list1 && !list2
    return nil
  end

  # handle scenario where list1 or list2 is nil
  if list1 && !list2
    return list1
  elsif !list1 && list2
    return list2
  end

  # If both are not nil, then start comparision
  if (list1.val <= list2.val)
    merged_list_node = list1
    list1 = list1.next
  else
    merged_list_node = list2
    list2 = list2.next
  end

  current_node = merged_list_node
  first_list_node = list1
  second_list_node = list2

  while first_list_node && second_list_node
    if first_list_node.val <= second_list_node.val
      current_node.next = first_list_node
      first_list_node = first_list_node.next
    else
      current_node.next = second_list_node
      second_list_node = second_list_node.next
    end
    current_node = current_node.next
  end

  while first_list_node
    current_node.next = first_list_node
    current_node = current_node.next
    first_list_node = first_list_node.next
  end

  while second_list_node
    current_node.next = second_list_node
    current_node = current_node.next
    second_list_node = second_list_node.next
  end

  merged_list_node
end

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node4 = ListNode.new(4)
node1.next = node2
node2.next = node4

second_node1 = ListNode.new(1)
second_node3 = ListNode.new(3)
second_node4 = ListNode.new(4)
second_node1.next = second_node3
second_node3.next = second_node4

merge_two_lists(node1, second_node1)