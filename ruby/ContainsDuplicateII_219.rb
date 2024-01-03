# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  lookup = {}
  nums.each_with_index do |n, index|
    if lookup[n]
      difference = (index - lookup[n]).abs
      return true if difference <= k
      lookup[n] = index
    else
      lookup[n] = index
    end
  end
  false
end

nums = [1,0,1,1]
k = 1
puts contains_nearby_duplicate(nums, k)