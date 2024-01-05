class RandomizedSet
  attr_accessor :lookup

  def initialize()
    @lookup = {}
  end

  def insert(val)
    return false if lookup[val]
    lookup[val] = true
    true
  end

  def remove(val)
    if lookup[val]
      lookup.delete(val)
      return true
    else
      return false
    end
  end

  def get_random()
    lookup.keys.sample
  end

end