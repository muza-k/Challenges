# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  a = a.reverse
  b = b.reverse
  index = 0
  length = [a.size, b.size].max
  result = ""
  carry = 0
  while (index < length)
    sum = a[index].to_i + b[index].to_i + carry
    if sum == 3
      result << "1"
      carry = 1
    elsif sum == 2
      result << "0"
      carry = 1
    else
      result << sum.to_s
      carry = 0
    end
    index = index + 1
  end
  result << "1" if carry == 1
  puts result.reverse
end

a = "1010"
b = "1011"
#output: 10101

add_binary(a, b)

