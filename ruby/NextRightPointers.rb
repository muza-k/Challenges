# Definition for a Node.
class Node
    attr_accessor :val, :left, :right, :next
    def initialize(val)
        @val = val
        @left, @right, @next = nil, nil, nil
    end
end

# @param {Node} root
# @return {Node}
def connect(root)

end


n4 = Node.new(4)
n5 = Node.new(5)
n7 = Node.new(7)
n2 = Node.new(2)
n2.left = n4
n2.right = n5
n3 = Node.new(3)
n3.right = n7
n1 = Node.new(1)
n1.left = n2
n1.right = n3
connect(n1)    