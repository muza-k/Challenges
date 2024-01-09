# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  rows = matrix.size
  cols = matrix[0].size
  zero_elements = []

  (0..rows-1).each do |row|
    (0..cols-1).each do |col|
      zero_elements << [row, col] if matrix[row][col] == 0
    end
  end

  zero_elements.each do |el|
    i, j = el[0], el[1]
    clear_out(matrix, i, j, rows, cols)
  end

  puts zero_elements.inspect
  matrix.each do |row|
    puts row.inspect
  end
end

def clear_out(result, row, col, rows, columns)
  (0..columns-1).each do |j|
    result[row][j] = 0
  end
  (0..rows-1).each do |i|
    result[i][col] = 0
  end
end

matrix =
[
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]

set_zeroes(matrix)