# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)

  count = {}
  majority_element = nums.length/2
  nums.each do |n|
    if (count[n])
      count[n] = count[n] + 1
    else
      count[n] = 1
    end

    if (count[n] > majority_element)
     return n
    end

  end

end

nums = [2,2,1,1,1,2,2]
puts majority_element(nums)