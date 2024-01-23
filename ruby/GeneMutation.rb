def min_mutation(start_gene, end_gene, bank)
  return -1 if bank.empty? || !bank.include?(end_gene)
  visited = Set.new([start_gene])
  queue = [[start_gene, 0]]

  until queue.empty?
    current_gene, mutations = queue.shift
    return mutations if current_gene == end_gene

    bank.each do |gene|
      next if visited.include?(gene) || !one_char_difference?(current_gene, gene)

      visited.add(gene)
      queue << [gene, mutations + 1]
    end
  end

  -1
end

def one_char_difference?(str1, str2)
  str1.length == str2.length && str1.chars.each_with_index.count { |char, i| char != str2[i] } == 1
end


startGene = "AAAAAAAA"
endGene = "CCCCCCCC"
bank = ["AAAAAAAA","AAAAAAAC","AAAAAACC","AAAAACCC","AAAACCCC","AACACCCC","ACCACCCC","ACCCCCCC","CCCCCCCA"]
puts min_mutation(startGene, endGene, bank)

#3:15