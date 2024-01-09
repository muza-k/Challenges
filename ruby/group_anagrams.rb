# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  lookup = {}
  strs.each_with_index do |str, index|
    str = str.chars.sort.join("")
    if lookup[str]
      lookup[str] << index
    else
      lookup[str] = [index]
    end
  end
  result = []
  lookup.values.each do |value|
    anagrams = []
    value.each do |i|
      anagrams << strs[i]
    end
    result << anagrams
  end
  result.inspect
end


strs = ["eat","tea","tan","ate","nat","bat"]
puts group_anagrams(strs)