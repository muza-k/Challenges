# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  p1 = 0
  p2 = 1
  len = nums.size
  if (len == 1) && nums.first >= target
    return 1
  end

  if (len == 1) && nums.first < target
    return 0
  end

  sum = nums[p1] + nums[p2]
  min_count = Float::INFINITY
  while p2 < len

    if (nums[p1] >= target || nums[p2] >= target)
      return 1
    end

    # puts "------------------ New Loop ----------------"
    # puts "Start loop with p1 - #{p1}"
    # puts "Start loop with p2 - #{p2}"
    # puts "Sum of array #{nums[p1..p2]} is #{nums[p1..p2].sum}, My sum variable - #{sum}"
    if sum >= target
      count = p2-p1+1
      min_count = count if min_count > count
      sum -= nums[p1]
      p1 = p1 + 1
    else
      p2 = p2 + 1
      break if p2 >= len
      sum += nums[p2]
    end
  end

  if min_count == Float::INFINITY
    return 0
  else
    return min_count
  end
end

target = 6
nums = [10, 2, 3]
puts min_sub_array_len(target, nums)

