# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  lookup = {}
  i = 0
  j = 0
  lookup["00"] = matrix[0][0]
  #puts "Adding #{matrix[0][0]}"
  row_len = matrix.size
  col_len = matrix[0].size
  total = row_len * col_len

  count = 0
  if col_len > 1
    action = 'increment_j'
  else
    action = 'increment_i'
  end
  while count < total - 1
    if action == 'increment_i'
      i = i + 1
      action = 'decrement_j' if i >= row_len - 1 || lookup["#{i+1}#{j}"]
    elsif action =='increment_j'
      j = j + 1
      action = 'increment_i' if j >= col_len - 1 || lookup["#{i}#{j+1}"]
    elsif action =='decrement_i'
      i = i - 1
      action = 'increment_j' if i <= 0 || lookup["#{i-1}#{j}"]
    elsif action =='decrement_j'
      j = j - 1
      action = 'decrement_i' if j <= 0 || lookup["#{i}#{j-1}"]
    end
    lookup["#{i}#{j}"] = matrix[i][j]  if !lookup["#{i}#{j}"]
    #puts "Adding #{matrix[i][j]}"
    count += 1
  end
  puts lookup.inspect
  return lookup.values

end



matrix =
  [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,16]
  ]
puts spiral_order(matrix)

#start- 10.08