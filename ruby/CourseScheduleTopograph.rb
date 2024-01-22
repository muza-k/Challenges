
def can_finish(num_courses, prerequisites)
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
    puts "Zero indegree element - #{zero_indegree_el}"
    lookup.delete(zero_indegree_el)
    topo_graph << zero_indegree_el
    lookup.each do |k, dependency|
      if dependency.include?(zero_indegree_el)
        puts "Deleting zero_indegree_element #{zero_indegree_el} from array #{dependency.inspect}"
        dependency.delete(zero_indegree_el)
      end
    end

    lookup.each do |k, v|
      queue << k if v.length == 0
      puts "New queue after adding element #{k} is #{queue.inspect}"
    end
    puts "New lookup after deleting elements #{lookup.inspect}"

  end

  puts "Topograph - #{topo_graph.inspect}"
end

prerequisites = [[2,0],[1,0],[3,1],[3,2]] #,[1,3]
num = 2
can_finish(2, prerequisites)