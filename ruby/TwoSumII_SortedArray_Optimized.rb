def two_sum(nums, target)
  p1 = 0
  p2 = nums.length - 1
  matches = []
  while p1 < p2
    sum = nums[p1] + nums[p2]

    if sum == target
      matches << [nums[p1], nums[p2]]
    end

    if sum - target > 0
      p2 = p2 - 1
    else
      p1 = p1 + 1
    end
  end
  puts matches.inspect
end

nums = [2,7,11,15]
target = 9
puts two_sum(nums, target)