# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  return true if nums.length <= 1
  index = nums.size-2
  goal_index = nums.size-1
  while index >= 0
    jump_distance = nums[index]
    #puts "Jump distance from #{index} is #{jump_distance}"
    if (jump_distance >= (goal_index - index))
      #puts "Goal being revised to index #{index}"
      goal_index = index
      return true if goal_index == 0
    else
      #puts "Goal not being revised as jump distance #{jump_distance} is lower than #{goal_index-index} distance "
    end
    index -= 1
  end
  false
end

nums = [3, 2, 1, 0, 4]
#nums = [2, 3, 1, 1, 4]
puts can_jump(nums)