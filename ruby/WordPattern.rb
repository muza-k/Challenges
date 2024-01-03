# @param {String} pattern
# @param {String} s
def word_pattern(pattern, s)
  lookup = {}
  string_arr = s.split(' ')
  index = 0
  final_string = []
  pattern.each_char do |c|
    if lookup[c]
      final_string << lookup[c]
    else
      lookup[c] = string_arr[index]
      final_string << string_arr[index]
    end
    index = index + 1
  end
  return false if lookup.values.uniq.length != lookup.values.length
  final_string.join(' ') == s
end

pattern = "abbaab"
s = "dog cat cat dog dog cat"
puts word_pattern(pattern, s)