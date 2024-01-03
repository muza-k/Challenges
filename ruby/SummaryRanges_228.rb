# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  range = []

  index = 0
  mini_range = []
  while index < nums.length
   if nums[index] + 1  == nums[index+1]
     mini_range << nums[index]
     index = index+1
     next
   else
     mini_range << nums[index]
     range << mini_range
     mini_range = []
   end
   index = index+1
  end
  result = []
  range.each do |elements|
    if elements.length > 1
      result << "#{elements.first}->#{elements.last}"
    else
      result << elements.first.to_s
    end
  end
  puts result.inspect
  result
end

nums = [0,2,3,4,6,8,9]
puts summary_ranges(nums)