def snakes_and_ladders(board)
  n = board.size
  n2 = n * n
  board.reverse!.map!.with_index { |r,i| i.even? ? r : r.reverse }.flatten!
  board.unshift nil
  visited = Array.new(n2 + 1)
  visited[1] = true
  steps = 0
  queue = [1]
  until queue.empty?
    steps += 1
    queue.size.times do
      cur = queue.shift
      (cur + 1 .. [cur + 6, n2].min).each do |nex|
        next if visited[nex]
        return steps if nex == n2
        b = board[nex]
        unless b == -1
          visited[nex] = true
          nex = b
          return steps if nex == n2
        end
        queue << nex
        visited[nex] = true if b == -1
      end
    end
  end
  -1
end
board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]
puts snakes_and_ladders(board)
