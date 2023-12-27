# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  key = strs[0]
  prefix = ''
  key.each_char do |c|
    prefix = prefix + c
    if !check_if_prefix_present(strs, prefix)
      return prefix[0..-2]
    end
  end
end

def check_if_prefix_present(strs, prefix)
  strs.each do |str|
    return false if !str.start_with?(prefix)
  end

  return true
end


strs = ["dog","racecar","car"]
puts longest_common_prefix(strs)