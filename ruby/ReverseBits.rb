# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  val = n.to_s(2)
  val = val.rjust(32, '0')
  reverse_val = val.reverse
  reverse_val.to_i(2)
end