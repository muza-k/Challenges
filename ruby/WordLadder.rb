#04:07
# @return {Integer}
def one_char_difference?(str1, str2)
  str1.length == str2.length && str1.chars.each_with_index.count { |char, i| char != str2[i] } == 1
end
def ladder_length(begin_word, end_word, word_list)
  queue = []
  queue.push([begin_word, 1])
  visited = {}
  until queue.empty?
    current_word, count = queue.shift
    visited[current_word] = true
    return count if current_word == end_word
    #return count+1 if one_char_difference?(current_word, end_word)
    count = count + 1
    possible_words = []
    word_list.each do |word|
      if one_char_difference?(current_word, word)
        possible_words << [word, count] if !visited[word]
      end
    end
    #puts "Possible words for #{current_word.inspect} are #{possible_words.inspect}"
    possible_words.each do |word|
      queue.push(word)
    end
  end

  return 0
end

beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log","cog"]
puts ladder_length(beginWord, endWord, wordList)

