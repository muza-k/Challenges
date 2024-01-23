# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.empty?

  lookup = {
    "2" => ['a', 'b', 'c'],
    "3" => ['d', 'e', 'f'],
    "4" => ['g', 'h', 'i'],
    "5" => ['j', 'k', 'l'],
    "6" => ['m', 'n', 'o'],
    "7" => ['p', 'q', 'r', 's'],
    "8" => ['t', 'u', 'v'],
    "9" => ['w', 'x', 'y', 'z'],
  }

  input_arr = digits.chars.map { |c| lookup[c] }
  combinations = input_arr.shift
  input_arr.each do |arr|
    combinations = combinations.product(arr)
  end

  output = []
  combinations.each do |string|
    if string.kind_of?(Array)
      output << string.join("")
    else
      output << string
    end
  end

  output
end

puts letter_combinations("23")