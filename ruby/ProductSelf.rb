# @param {Integer[]} nums
# @return {Integer[]}
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  prefix = []
  suffix = []
  prefix_value = 1
  suffix_value = 1
  length = nums.size
  index = 0
  while (index < length)
    prefix_value = prefix_value * nums[index]
    suffix_value = suffix_value * nums[length-index-1]
    prefix << prefix_value
    suffix.unshift(suffix_value)
    index = index + 1
  end
  puts "Prefix array - "
  puts prefix.inspect
  puts "Suffix array - "
  puts suffix.inspect
  sum = []
  nums.each_with_index do |num, index|
    prefix_index = index-1
    suffix_index = index+1

    prefix_value = prefix_index < 0 ? 1 : prefix[prefix_index]
    suffix_value = suffix_index >= length ? 1 : suffix[index+1]
    puts "For number #{num} prefix value - #{prefix_value} and suffix value - #{suffix_value}"
    sum << prefix_value * suffix_value
  end

  return sum
end

nums = [0, 0]
#[24,12,8,6]
puts product_except_self(nums).inspect