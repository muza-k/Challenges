# Definition for a Node.
class Node
  attr_accessor :val, :neighbors
  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

# @param {Node} node
# @return {Node}
def cloneGraph(node)

end

n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n1.neighbors = [n2, n4]
n2.neighbors = [n1, n3]
n3.neighbors = [n2, n4]
n4.neighbors = [n1, n3]

cloneGraph(n1)