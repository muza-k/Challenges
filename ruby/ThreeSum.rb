# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  i = 0
  nums.sort!
  length = nums.size
  original_nums = nums.clone
  matching_sets = []
  triplet_hash = {}

  while i < length - 2
    nums = original_nums.clone
    target = nums.delete_at(i)
    valid_pairs = two_sum(nums, -target)
    if valid_pairs.length > 0
      valid_pairs.each do |valid_pair|
        set = [target]
        set << valid_pair
        set.flatten!
        set.sort!
        #puts "Set made - #{set}"
        if !triplet_hash[set]
          matching_sets << set
          triplet_hash[set] = true
        end
      end
    end
    i += 1
  end
  puts "---------------matching sets --"
  puts matching_sets.inspect
  puts "------------------------------"
  matching_sets
end

def two_sum(numbers, target)
  #prepare hash
  #puts "Checking two sum in #{numbers.inspect} with target: #{target}"
  valid_pairs = []
  lookup = {}
  numbers.each_with_index do |number, index|
    lookup[number] = index
  end

  numbers.each_with_index do |number, index|
    diff = target - number
    val = lookup[diff]
    if val && val != index
      valid_pairs << [diff, number].sort
    end
  end
  #puts "Valid pairs found - #{valid_pairs} for target #{target}"
  valid_pairs
end


nums = [-1,0,1,2,-1,-4]
three_sum(nums)