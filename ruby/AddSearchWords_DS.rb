class WordDictionary
  attr_accessor :lookup

  def initialize()
    @lookup = {}
  end

  def add_word(word)
    root = @lookup
    word.chars.each do |char|
      root[char] ||= {}
      root = root[char]
    end
    root[:is_word] = true
  end

  def search(word)
    search_recursively(word, 0, @lookup)
  end

  private

  def search_recursively(word, index, node)
    return node[:is_word] == true if index == word.length

    char = word[index]
    if char == "."
      node.each_key do |key|
        next if key == :is_word
        return true if search_recursively(word, index + 1, node[key])
      end
      false
    else
      return false unless node[char]
      search_recursively(word, index + 1, node[char])
    end
  end
end

# Your WordDictionary object will be instantiated and called as such:
obj = WordDictionary.new()
obj.add_word("bad")
obj.add_word("dad")
obj.add_word("mad")
puts obj.search("b..")  # Expected to return true