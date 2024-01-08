# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)

  # validate rows
  board.each do |row|
    valid = validate_subarray(row)
    return false if !valid
  end

  # validate columns
  (0..8).each do |col_index|
    input_arr = []
    (0..8).each do |row_index|
      input_arr << board[row_index][col_index]
    end
    #puts "Input array generated - #{input_arr.inspect}"
    valid = validate_subarray(input_arr)
    return false if !valid
  end

  #valid boxes
  [[0, 0], [0, 3], [0, 6], [3, 0], [3, 3], [3, 6], [6, 0], [6, 3], [6, 6]].each do |indexes|
    input_arr = []
    #puts "--start array"
    start_index, end_index = indexes[0], indexes[1]
    (start_index..start_index+2).each do |i|
      (end_index..end_index+2).each do |j|
        #puts "new node - #{i} #{j} "
        input_arr << board[i][j]
      end
    end
    #puts "Input array generated from matrix - #{input_arr.inspect}"
    valid = validate_subarray(input_arr)
    return false if !valid
  end

  return true
end

# validates a subarray for sudoku rules
def validate_subarray(nums)
  lookup = {}
  nums.each do |num|
    next if num == "." #ignore dots
    return false if lookup[num]
    lookup[num] = true
  end
  true
end



board = [
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]]

puts is_valid_sudoku(board)

#Start: 09.28
#End - 09.55