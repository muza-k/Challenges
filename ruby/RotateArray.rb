# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k.times do
    shift(nums)
  end
  puts nums.inspect
end

def shift(nums)
  n = nums.pop
  nums.unshift(n)
end

nums = [1,2,3,4,5,6,7]
k = 3
rotate(nums, k)