def three_sum(nums)
  nums.sort!
  length = nums.size
  matching_sets = []

  for i in 0..(length - 2)
    # Skip duplicates
    next if i > 0 && nums[i] == nums[i - 1]

    left = i + 1
    right = length - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]

      if sum == 0
        matching_sets << [nums[i], nums[left], nums[right]]

        # Skip duplicates
        left += 1 while left < right && nums[left] == nums[left + 1]
        right -= 1 while left < right && nums[right] == nums[right - 1]

        left += 1
        right -= 1
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end

  matching_sets
end

nums = [-1, 0, 1, 2, -1, -4]
result = three_sum(nums)
puts result.inspect
