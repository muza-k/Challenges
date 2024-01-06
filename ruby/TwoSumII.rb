# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  #prepare hash
  lookup = {}
  numbers.each_with_index do |number, index|
    lookup[number] = index
  end

  numbers.each_with_index do |number, index|
    diff = target - number
    val = lookup[diff]
    if val && val != index
      return [val+1, index+1].sort
    end
  end
end

numbers = [2,7,11,15]
target = 9
puts two_sum(numbers, target)
