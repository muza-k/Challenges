# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  index = 0
  while index < nums.length
    if nums[index] == nums[index+1]
     nums.delete_at(index)
     puts "index - #{index}"
    else
      index = index + 1;
    end
  end
  return nums.length
end

numbers = [0,0,1,1,1,2,2,3,3,4]

puts remove_duplicates(numbers)
puts numbers.inspect