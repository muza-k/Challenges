TrieNode = Hash

class Trie
  def initialize
    @root = TrieNode.new
  end

  # @param {string} word
  # @return {void}
  # Inserts a word into the trie.
  def insert(word)
    curr = @root
    word.each_char do |char|
      curr = (curr[char] ||= TrieNode.new)
    end
    curr[:_] = true
  end

  # @param {string} word
  # @return {boolean}
  # Returns if the word is in the trie.
  def search(word)
    last = word.each_char.inject(@root) do |curr, char|
      curr.is_a?(TrieNode) ? curr[char] : nil
    end

    last && last[:_] || false
  end

  # @param {string} prefix
  # @return {boolean}
  # Returns if there is any word in the trie
  # that starts with the given prefix.
  def starts_with(prefix)
    curr = @root
    prefix.each_char.all? do |char|
      curr = curr[char]
    end
  end
end


# Your Trie object will be instantiated and called as such:
obj = Trie.new()
obj.insert('apple')
puts obj.search('app')
param_3 = obj.starts_with('app')