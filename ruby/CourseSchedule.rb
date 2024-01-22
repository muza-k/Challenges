def can_finish(num_courses, prerequisites)
  return true if !prerequisites || prerequisites.length == 0
  course_count = 0

  lookup = {}
  prerequisites.each do |key, value|
    if lookup[key]
      lookup[key] << value
    else
      lookup[key] = [value]
    end
  end

  puts "Lookup - #{lookup.inspect}"


  can_complete = true
  prerequisites.each do |course|
    can_complete = dfs(course[0], lookup, { }, num_courses, course_count)
    puts "Course #{course.inspect} can be completed - #{can_complete}"
    return false if !can_complete
  end

  return can_complete
end

def dfs(first_course, lookup, visited, num_courses, course_count)
  return false if visited[first_course]

  visited[first_course] = true

  dependencies = lookup[first_course]
  dependencies.each do |dep|
    return true if !lookup[dep]
    valid = dfs(dep, lookup, visited, num_courses, course_count)
    return false if !valid
  end
  true
end


prerequisites = [[2,0],[1,0],[3,1],[3,2],[1,3]]
num = 2
can_finish(2, prerequisites)