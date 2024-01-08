# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  p1 = 0
  p2 = 1
  length = s.length
  return 0 if !length || length == 0
  max_len = 1
  lookup =  {}
  lookup[s[p1]] = true
  while p2 < length
    p1_val = s[p1]
    p2_val = s[p2]
    if !lookup[p2_val]
      lookup[p2_val] = true
      p2 = p2 + 1
      substr_len = p2 - p1
      max_len = substr_len if substr_len > max_len
    else
      lookup[p1_val] = nil
      p1 = p1 + 1
    end
  end
  return max_len

end


#Start: 09.07 - #end: 09.18
s = "abcabcbb"
puts length_of_longest_substring(s)