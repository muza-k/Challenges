# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  nums.each_with_index do |n, index|
    return index if target-n <= 0
  end
  nums.size
end