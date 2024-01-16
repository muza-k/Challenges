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
  lookup = {}
  visited = {}
  dfs(node, lookup, visited)
end

def dfs(node, lookup, visited)
  puts "Calling dfs on node - #{node.val}"
  return if !node || visited[node.val]
  if node.val == 2
    a = 1
  end

  clone_node = lookup[node.val]
  clone_node = Node.new(node.val) if !clone_node
  lookup[node.val] = clone_node
  visited[node.val] = true

  node.neighbors.each do |n1|
    neighbor_node = lookup[n1.val]
    neighbor_node = Node.new(n1.val) if !neighbor_node
    lookup[n1.val] = neighbor_node
    clone_node.neighbors << neighbor_node
    dfs(n1, lookup, visited)
  end
  puts clone_node.inspect
  clone_node
end

n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n1.neighbors = [n2, n4]
n2.neighbors = [n1, n3]
n3.neighbors = [n2, n4]
n4.neighbors = [n1, n3]

puts cloneGraph(n1)