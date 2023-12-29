# @param {String} s
# @return {Integer}
def roman_to_int(s)
  lookup  = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
  }

  neg_lookup = {
    "IV" => 4,
    "IX" => 9,
    "XL" => 40,
    "XC" => 90,
    "CD" => 400,
    "CM" => 900,

  }

  value = 0
  neg_lookup.each_key do |key|
    if (s.include?(key))
      value = value + neg_lookup[key]
      s = s.gsub(key, '')
    end
  end

  s.each_char do |c|
    value = value + lookup[c];
  end
  value
end


puts roman_to_int("MCMXCIV")
