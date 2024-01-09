# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  len = matrix.size
  l = 0
  r = len-1

  while l < r
    (0..r-l-1).each do |i|
      top, bottom = l, r
      topLeft = matrix[top][l+i]
      matrix[top][l+i] = matrix[bottom-i][l]
      matrix[bottom-i][l] = matrix[bottom][r-i]
      matrix[bottom][r-i] = matrix[top+i][r]
      matrix[top+i][r] = topLeft
      matrix.each do |line|
        puts line.inspect
      end
    end
    r = r - 1
    l = l + 1
  end

end

matrix =
  [[5 ,1 ,9 ,11],
   [2 ,4 ,8 ,10],
   [13,3 ,6 ,7 ],
   [15,14,12,16]]

rotate(matrix)