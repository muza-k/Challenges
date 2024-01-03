# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = Stack.new
  s.each_char do |c|
    if c == "("
      stack.push(c)
    elsif c == ")"
      z = stack.pop
      return false if z != "("
    elsif c == "["
      stack.push(c)
    elsif c == "]"
      z = stack.pop
      return false if z != "["
    elsif c == "{"
      stack.push(c)
    elsif c == "}"
      z = stack.pop
      return false if z != "{"
    end
  end
  return true if stack.empty?
  false
end

class Stack
  def initialize
    @stack = []
  end

  def push(item)
    @stack.push(item)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

  def empty?
    @stack.empty?
  end

end

s = "()[]{}"
puts is_valid(s)