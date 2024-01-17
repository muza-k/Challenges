# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
  # Building the graph
  graph = Hash.new { |h, k| h[k] = Hash.new }
  equations.each_with_index do |(a, b), i|
    graph[a][b] = values[i]
    graph[b][a] = 1.0 / values[i]
  end

  # Depth-First Search function
  def dfs(graph, start, goal, visited)
    return 1.0 if start == goal
    visited.add(start)

    graph[start].each do |neighbor, value|
      next if visited.include?(neighbor)
      product = dfs(graph, neighbor, goal, visited)
      return value * product if product
    end

    nil
  end

  # Answering queries
  queries.map do |a, b|
    if graph.include?(a) && graph.include?(b)
      product = dfs(graph, a, b, Set.new)
      product || -1.0
    else
      -1.0
    end
  end
end

equations = [["x1","x2"],["x2","x3"],["x3","x4"],["x4","x5"]]
values = [3.0,4.0,5.0,6.0]
queries = [["x1","x5"],["x5","x2"],["x2","x4"],["x2","x2"],["x2","x9"],["x9","x9"]]

calc_equation(equations, values, queries)