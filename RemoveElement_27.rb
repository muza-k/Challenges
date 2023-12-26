def remove_element(nums, val)
  last_index = nums.length - 1
  for i in (nums.length - 1).downto(0)
    if (nums[i] == val)
      nums[i] = nums[last_index]
      nums[last_index]=0
      last_index = last_index - 1
    end
  end
  return last_index + 1
end
