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
  root.next = nil
  lookup = {}
  populate_nodes_at_level(root, 1, lookup)
  lookup.each do |key, nodes|
    puts "Nodes at level #{key}"
    i = 0
    while i < nodes.length
      if node[i+1]
        node[i].next = node[i+1]
      end
      i = i+1
    end
  end
  root
end

def populate_nodes_at_level(node, level, lookup)
  if lookup[level]
    lookup[level] << node
  else
    lookup[level] = [node]
  end
  populate_nodes_at_level(node.left, level+1, lookup) if node.left
  populate_nodes_at_level(node.right, level+1, lookup) if node.right
end



nodes = []
n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n5 = Node.new(5)
n6 = Node.new(6)
n7 = Node.new(7)
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
n3.right = n7
connect(n1)

