def jump(nums)
  jumps = 0
  max_reach = 0
  current_position = 0
  if nums.length <= 1
    return jumps
  end

  while current_position < nums.length
    current_element = nums[current_position] #2 - [2,3,1,1,4]
    next_best_index = current_position + 1
    next_best_distance = 0
    max_reach = 0
    #find best next position
    possible_best_index = next_best_index
    (1..current_element).each do |jump_distance|
      #puts "Jump distance #{jump_distance}"
      return jumps + 1 if !nums[possible_best_index] || possible_best_index == nums.length-1
      reach = nums[possible_best_index] + jump_distance
      if reach > max_reach
        next_best_index = possible_best_index
        max_reach = reach
      end
      #puts "Max reach for #{possible_best_index} index position is #{reach}"
      possible_best_index = possible_best_index + 1
    end
    #puts "Best Max reach found - #{max_reach} #{next_best_index}"
    jumps = jumps + 1
    #puts "Total jumps - #{jumps}"
    current_position = next_best_index
    return jumps if next_best_index >= nums.length
  end
end

nums = [2, 3, 1, 1, 4]
jump(nums)