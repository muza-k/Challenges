def can_finish(num_courses, prerequisites)
  # Initialize an array to represent the indegree (number of prerequisites) for each course.
  indegree = Array.new(num_courses, 0)

  # Create an adjacency list to represent the course dependencies.
  adjacency_list = Array.new(num_courses) { [] }

  # Populate the indegree and adjacency list based on prerequisites.
  prerequisites.each do |prereq|
    course, dependency = prereq
    adjacency_list[dependency].push(course)
    indegree[course] += 1
  end

  # Initialize a queue to perform topological sorting.
  queue = []

  # Add courses with no prerequisites to the queue.
  indegree.each_with_index do |degree, course|
    queue.push(course) if degree == 0
  end

  # Perform topological sorting.
  while !queue.empty?
    course = queue.shift
    num_courses -= 1

    # Update indegree for courses that depend on the current course.
    adjacency_list[course].each do |dependent|
      indegree[dependent] -= 1
      queue.push(dependent) if indegree[dependent] == 0
    end
  end

  # If there are no remaining courses to take, return true; otherwise, return false.
  num_courses == 0
end

prerequisites = [[1,0],[0,2],[2,1]]
num = 2
puts can_finish(2, prerequisites)

[[2,0],[1,0],[3,1],[3,2],[1,3]]