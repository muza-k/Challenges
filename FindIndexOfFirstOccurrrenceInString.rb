# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  x =  haystack.index(needle)
  return -1 if !x
  x
end
haystack = "sadbutsad",
needle = "sad"

puts str_str(haystack, needle)