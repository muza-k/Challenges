class Node
  attr_accessor :val, :neighbours

  def initialize(val)
    @neighbours = []
    @val = val
  end
end

def dfs(node)
  stack = []
  visited = {}

  stack << node

  until stack.empty?
    current_node = stack.pop
    visited[current_node.val] = true
    #get children and add to stack
    current_node.neighbours.each do |n|
      next if visited[n.val]
      stack.push(n)
    end
  end

  puts visited.inspect
end

n0 = Node.new(0)
n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n5 = Node.new(5)
n6 = Node.new(6)
n7 = Node.new(7)

n0.neighbours = [n1, n3]
n1.neighbours = [n2]
n2.neighbours = [n1,n4]
n3.neighbours = []

puts dfs(n0)

# 2.34 - #3.04 - BFS