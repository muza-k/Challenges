# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  lookup = {}
  nums = Set.new(nums)
  nums.each do |n|
    lookup[n] = true
  end

  starting_points = []
  #get starting points
  nums.each do |n|
    prev_val = n-1
    if !lookup[prev_val]
      starting_points << n
    end
  end

  # for each starting point, get the sequence length
  max_sequence = 0
  starting_points.each do |start_point|
    sequence =  1
    while lookup[start_point + 1]
      #puts "Checking next point #{start_point}"
      start_point = start_point + 1
      sequence = sequence + 1
    end
    if sequence > max_sequence
      max_sequence = sequence
    end
  end

  #puts starting_points.inspect
  return max_sequence
end


nums = [100,4,200,1,3,2]
puts longest_consecutive(nums)