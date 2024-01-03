
def is_happy(n)
  visited_numbers = {}
  begin
    square_and_add(n, visited_numbers)
  rescue SystemStackError => e
    return false
  end
end



def square_and_add(n, visited_numbers)
  return false if visited_numbers[n]
  visited_numbers[n] = true
  s = n.to_s
  total = 0
  s.each_char do |c|
    total = total + c.to_i ** 2
  end
  return square_and_add(total, visited_numbers) if total != 1
  true
end

puts is_happy(2)