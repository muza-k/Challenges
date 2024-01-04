class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

end

def merge_two_lists(list1, list2)
  first_list_node = list1
  second_list_node = list2
  merged_list_node = nil

  while first_list_node && second_list_node
    if (first_list_node.val <= second_list_node.val)
      if !merged_list
        merged_list_node = first_list_node
      else
        merged_list_node.next = first_list_node
      end
      first_list_node = first_list_node.next
    else
      if !merged_list
        merged_list_node = second_list_node
      else
        merged_list_node.next = second_list_node
      end
      second_list_node = second_list_node.next
    end
  end
  puts merged_list_node.inspect
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