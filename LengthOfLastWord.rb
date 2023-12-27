# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  s = s.strip
  s = s.split(' ')
  s[-1].length
end


s = "Hello World  "
puts length_of_last_word(s)