# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  lookup = {}
  nums.each_with_index do |n, i|
    if lookup[n]
      lookup[n] = lookup[n] << i
    else
      lookup[n] = [i]
    end
  end

  nums.each_with_index do |n, i|
    diff = target-n
    return lookup[diff] if lookup[diff] && lookup[diff].length > 1
    return [lookup[diff], i].flatten if lookup[diff] && lookup[diff].first != i
  end
  false
end

nums = [2, 5, 5, 11, 15]
target = 10
puts two_sum(nums, target)