def calculate(s)
  s = s.gsub(' ', '')
  number = 0
  sign = 1
  res = 0
  stack = []
  s.each_char do |c|
    if c.match?(/\d/)
      number = number * 10 + c.to_i
    elsif c == '+'
      number = sign * number
      res = res + number
      number = 0
      sign = 1
    elsif c == '-'
      number = sign * number
      res = res + number
      sign = -1
      number = 0
    elsif c == '('
      stack.push(res)
      stack.push(sign)
      res = 0
      sign = 1
    elsif c == ')'
      number = sign * number
      res = res + number
      number = 0
      res = res * stack.pop
      res = res + stack.pop
    end
  end

  number = sign * number
  res = res + number
  res
end


s = "1 + ( 2 + 3 ) + 4 - (7 + 1)"
puts calculate(s)

#12.45