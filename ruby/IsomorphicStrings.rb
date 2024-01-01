# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  return false if s.length != t.length

  index = 0
  lookup = {}
  new_word = ""
  while(index < s.length)
    char = s[index]
    if lookup[char]
      new_word << lookup[char]
    else
      lookup[char] = t[index]
      new_word << lookup[char]
    end
    index = index + 1
  end

  has_duplicates = lookup.values.length != lookup.values.uniq.length
  if(has_duplicates)
    return false
  end
  return t == new_word
end

puts is_isomorphic("badc", "baba")