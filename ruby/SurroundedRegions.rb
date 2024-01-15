# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  row_len = board.length
  col_len = board[0].length

  # Mark 'O's on the edges as safe
  (0...row_len).each do |r|
    dfs(board, r, 0)
    dfs(board, r, col_len - 1)
  end

  (0...col_len).each do |c|
    dfs(board, 0, c)
    dfs(board, row_len - 1, c)
  end

  # Flip 'O's to 'X' and restore the safe 'O's
  (0...row_len).each do |r|
    (0...col_len).each do |c|
      if board[r][c] == 'O'
        board[r][c] = 'X'
      elsif board[r][c] == 'E'
        board[r][c] = 'O'
      end
    end
  end
end

def dfs(board, r, c)
  return if r < 0 || c < 0 || r >= board.length || c >= board[0].length || board[r][c] != 'O'

  board[r][c] = 'E'  # Mark as safe temporarily
  dfs(board, r + 1, c)
  dfs(board, r - 1, c)
  dfs(board, r, c + 1)
  dfs(board, r, c - 1)
end

board = [
  ["X","X","X","X"],
  ["X","O","O","X"],
  ["X","X","O","X"],
  ["X","O","X","X"]
]

solve(board)