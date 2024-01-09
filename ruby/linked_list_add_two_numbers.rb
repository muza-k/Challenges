# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    #traverse list l1
    r1 = traverse_list(l1)
    puts "Number 1 - #{r1.inspect}"
    # traverse list l2
    r2 = traverse_list(l2)
    puts "Number 2 - #{r2.inspect}"
    r = r1 + r2
    puts "Sum - #{r.inspect}"
    prev_node = nil
    node = nil
    r.to_s.each_char do |c|
        puts "Output - #{c}"
        node = ListNode.new(c.to_i, prev_node)
        prev_node = node
    end

    node
end

def traverse_list(l)
    result = [l.val]
    while (l.next)
        l = l.next
        result << l.val
    end
    result = result.join('').reverse.to_i
end

n2 = ListNode.new(2)
n4 = ListNode.new(4)
n3 = ListNode.new(9)
n2.next = n4
n4.next = n3

n5= ListNode.new(5)
n6 = ListNode.new(6)
n4_ = ListNode.new(4)
n9_ = ListNode.new(9)
n5.next = n6
n6.next = n4_
n4_.next = n9_

add_two_numbers(n2, n5)