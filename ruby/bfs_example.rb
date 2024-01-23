class Node
  attr_accessor :val, :neighbours

  def initialize(val)
    @neighbours = []
    @val = val
  end
end

def bfs(node)
  queue = []
  visited = {}
  queue = [node]
  while !queue.empty?
    current_node = queue.shift
    visited[current_node.val] = true
    # get current neighbours
    # call bfs on current neighbors if they haven't been visited
    current_node.neighbours.each do |n|
      if !visited[n.val]
        queue.push(n)
      end
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

n0.neighbours = [n1, n2, n3, n7]
n1.neighbours = [n4, n5]
n2.neighbours = [n6]
n3.neighbours = []

puts bfs(n0)

# 2.34 - #3.04 - BFS