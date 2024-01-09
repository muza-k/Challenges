# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  rows = board.length
  cols = board[0].length
  result = []

  (0..rows-1).each do |r|
    result[r] = []
    (0..cols-1).each do |c|
      result[r][c] = evaluate_cell(board, r, c, rows, cols)
    end
  end

  (0..rows-1).each do |r|
    (0..cols-1).each do |c|
      board[r][c] = result[r][c]
    end
  end

  # puts "result - "
  # board.each do |row|
  #   puts row.inspect
  # end
end

def evaluate_cell(board, r, c, rows, cols)
  neighbours = []

  row_lower_limit = r
  col_lower_limit = c
  row_upper_limit = r
  col_upper_limit = c
  cell = board[r][c]
  if r-1 >= 0
    row_lower_limit = r-1
  end

  if c-1 >= 0
    col_lower_limit = c-1
  end

  if r+1 <= rows - 1
    row_upper_limit = r + 1
  end

  if c+1 <= cols - 1
    col_upper_limit = c + 1
  end

  (row_lower_limit..row_upper_limit).each do |row|
    (col_lower_limit..col_upper_limit).each do |col|
      if [row, col] != [r, c]
        neighbours << board[row][col]
      end

    end
  end
  puts "Neighbours of board[#{r}][#{c}] are #{neighbours.inspect}"

  living_cells = neighbours.count(1)
  if cell == 1 && living_cells < 2
    return 0 #underpopulation
  end

  if cell == 1 && living_cells == 2 ||living_cells == 3
    return 1 #next gen
  end

  if cell == 1 && living_cells > 3
    return 0 #overpopulation
  end

  if cell == 0 && living_cells == 3
    return 1 #reproduction
  end

  return 0
end

board =
  [
   [0,1,0],
   [0,0,1],
   [1,1,1],
   [0,0,0]
  ]
game_of_life(board)