class LRUCache
  class Node
    attr_accessor :key, :value, :prev, :next

    def initialize(key, value)
      @key = key
      @value = value
    end
  end

  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @head = Node.new(nil, nil)
    @tail = Node.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    return -1 unless @cache.key?(key)

    node = @cache[key]
    move_to_head(node)
    node.value
  end

  def put(key, value)
    if @cache.key?(key)
      node = @cache[key]
      node.value = value
      move_to_head(node)
    else
      if @cache.length >= @capacity
        remove_last
      end
      new_node = Node.new(key, value)
      @cache[key] = new_node
      add_to_head(new_node)
    end
  end

  private

  def move_to_head(node)
    remove_node(node)
    add_to_head(node)
  end

  def remove_last
    last_node = @tail.prev
    remove_node(last_node)
    @cache.delete(last_node.key)
  end

  def remove_node(node)
    prev_node = node.prev
    next_node = node.next
    prev_node.next = next_node
    next_node.prev = prev_node
  end

  def add_to_head(node)
    next_node = @head.next
    node.prev = @head
    node.next = next_node
    @head.next = node
    next_node.prev = node
  end
end