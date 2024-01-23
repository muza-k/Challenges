def one_char_difference?(str1, str2)
  str1.length == str2.length && str1.chars.each_with_index.count { |char, i| char != str2[i] } == 1
end

def precompute_transformations(word_list)
  transformations = Hash.new { |h, k| h[k] = [] }
  word_list.each do |word|
    word.length.times do |i|
      key = word[0...i] + '_' + word[i+1..-1]
      transformations[key] << word
    end
  end
  transformations
end

def ladder_length(begin_word, end_word, word_list)
  return 0 unless word_list.include?(end_word)

  transformations = precompute_transformations(word_list)

  queue = [[begin_word, 1]]
  visited = {begin_word => true}

  until queue.empty?
    current_word, count = queue.shift
    return count if current_word == end_word

    current_word.length.times do |i|
      key = current_word[0...i] + '_' + current_word[i+1..-1]
      transformations[key].each do |adjacent_word|
        unless visited[adjacent_word]
          visited[adjacent_word] = true
          queue.push([adjacent_word, count + 1])
        end
      end
    end
  end

  0
end