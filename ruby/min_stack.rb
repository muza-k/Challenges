class MinStack
  attr_accessor :lookup, :min
  def initialize()
    @lookup = []
  end


=begin
    :type val: Integer
    :rtype: Void
=end
  def push(val)
    @lookup.push(val)
  end


=begin
    :rtype: Void
=end
  def pop()
    @lookup.pop()
  end


=begin
    :rtype: Integer
=end
  def top()
    @lookup[-1]
  end


=begin
    :rtype: Integer
=end
  def get_min()
    @lookup.min
  end


end

# Your MinStack object will be instantiated and called as such:
obj = MinStack.new()
obj.push(21)
obj.push(22)
obj.push(23)
obj.pop()
param_3 = obj.top()
puts "Top - #{param_3}"
param_4 = obj.get_min()
puts "Min - #{param_4}"