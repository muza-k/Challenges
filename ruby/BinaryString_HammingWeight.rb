# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  binary_string = n.to_s(2)
  binary_string.count('1')
end