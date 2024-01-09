# Definition for Node.
class Node
    attr_accessor :val, :next, :random
    def initialize(val = 0)
        @val = val
		  @next = nil
		  @random = nil
    end
end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  result = []
  input_arr = []
  current_node = head
  while current_node
    node = Node.new(current_node.val)
    result << node
    input_arr << current_node
    current_node = current_node.next
  end

  i = 0
  while i < result.length
    result[i].next = result[i+1]
    random_node = input_arr[i].random
    random_index = input_arr.index(random_node)
    result[i].random = result[random_index] if !random_index.nil?
    i = i+1
  end

  result.first
end




