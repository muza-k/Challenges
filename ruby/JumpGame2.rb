def jump(nums)
  return 0 if nums.length == 1
  !nums.pop
  nums.push(1)
  min_jumps(nums)
end

def min_jumps(nums)
  return 0 if !nums
  # if there are only 2 elements in array and jump size is 1 for first element, return 1
  return 1 if nums.length <= 2 && nums.first >= 1

  # the first element in array is going to be the max element in sub arrays, if it reaches target, return 1
  jump_distance = nums.first
  return 1 if nums.length-1 <= jump_distance

  max_value = nums.max
  max_index = nums.index(max_value)
  sub_array1 =  nums[0..max_index]
  sub_array2 = nums[max_index..-1]
  return min_jumps(sub_array1) + min_jumps(sub_array2)
end

nums = [1, 1, 1, 1]
puts jump(nums)