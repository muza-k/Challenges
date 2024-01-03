# @param {String} s
# @param {String} t
# @return {Boolean}
def prepare_map(s)
  lookup = {}
  s.each_char do |c|
    if lookup[c]
      lookup[c] = lookup[c] + 1
    else
      lookup[c] = 1
    end
  end
  lookup
end

def is_anagram(s, t)
  first_lookup = prepare_map(s)
  second_lookup = prepare_map(t)
  #compare maps
  first_lookup == second_lookup
end




s = "anagraa"
t = "nagaram"
puts is_anagram(s, t)