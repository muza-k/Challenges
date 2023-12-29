# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s = s.strip()
  s = s.downcase
  s = s.gsub(/[^a-z0-9]/, '')
  s == s.reverse
end


s = "0P"
puts is_palindrome(s)