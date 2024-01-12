class LRUCache
  attr_accessor :capacity, :cache

  def initialize(capacity)
    @cache = {}
    @capacity = capacity
  end


  def get(key)
    el = @cache.delete(key)
    if el
      @cache.update(key => el)
      return el
    else
      return -1
    end
  end

  def put(key, value)
    @cache.delete(key)
    @cache.update(key => value)
    size = @cache.size
    if size > capacity
      @cache.shift
    end
  end
end


obj = LRUCache.new(2)
obj.put(2, "2222")
obj.put(1, "1111")
obj.put(2, "3333")
obj.put(4, "1111")
obj.get(1)
puts obj.get(2)
puts obj.cache.inspect

#["LRUCache","put","put","put","put","get","get"]
#[[2],[2,1],[1,1],[2,3],[4,1],[1],[2]]
