# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  index = 0
  s.each_char do |c|
    index = t.index(c)
    # if index found, reset index
    if index
      t = t[index+1..-1]
    else
      return false
    end
  end
  true
end

s = "aaaaaa"
t = "bbaaaa"
puts is_subsequence(s, t)