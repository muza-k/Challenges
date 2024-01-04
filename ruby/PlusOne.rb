# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  value = digits.join('').to_i + 1
  value = value.to_s.chars
  value.map(&:to_i)
end