# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  values = {}
  nums.each do |n|
    if values[n]
      values.delete(n)
    else
      values[n] = true
    end
  end
  puts values
  values.keys.first
end