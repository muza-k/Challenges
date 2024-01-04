# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  i = 2
  index = 2
  return nums.size if nums.size < 2
  while i < nums.length
    if nums[index-2] != nums[i]
      nums[index] = nums[i]
      index += 1
    end
    i += 1
  end
  index
end

nums = [1,1,1,2,2,3]
puts remove_duplicates(nums)