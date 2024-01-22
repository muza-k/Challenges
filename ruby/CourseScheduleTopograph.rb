
def can_finish(num_courses, prerequisites)
  return true if prerequisites == []
  lookup = Hash.new { |h, k| h[k] = [] }
  queue = []
  topo_graph = []

  # empty arrays
  (0..num_courses-1).each do |course|
    lookup[course] = []
  end

  # prepare indegree of each course
  prerequisites.each do |k|
    course, dependency = k
    lookup[course] << dependency
  end

  # push elements with 0 indegree into queue
  lookup.each do |k, v|
    queue << k if v.length == 0
  end

  while queue.any?

    zero_indegree_el = queue.shift
    puts "Lookup value - #{lookup.inspect}"
    puts "Zero indegree element - #{zero_indegree_el}"
    lookup.delete(zero_indegree_el)
    topo_graph << zero_indegree_el

    # delete zero_index_el
    lookup.each do |k, dependency|
      if dependency.include?(zero_indegree_el)
        puts "Deleting zero_indegree_element #{zero_indegree_el} from array #{dependency.inspect}"
        dependency.delete(zero_indegree_el)
      end
    end

    puts "Lookup after removing zero indegree element - #{lookup.inspect}"
    lookup.each do |k, v|
      if v.length == 0
        queue << k if !queue.include?(k)
        puts "New queue after adding element #{k} is #{queue.inspect}"
        lookup.delete(k)
      end
    end
    puts "New lookup after deleting elements #{lookup.inspect}"

  end

  puts "Topograph - #{topo_graph.inspect}"
  if topo_graph.length != num_courses
    return true
  end
end

prerequisites = [[1,4],[2,4],[3,1],[3,2]]
num = 5
can_finish(num, prerequisites)