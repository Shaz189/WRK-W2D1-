STRAIGHT_MOVES = [
  [[0, 1],[0, 2],[0, 3],[0, 4],[0, 5],[0, 6],[0, 7]], #right
  [[0, -1],[0, -2],[0, -3],[0, -4],[0, -5],[0, -6], [0, -7]], #left
  [[1, 0],[2, 0],[3, 0],[4, 0],[5, 0],[6, 0],[7, 0]], #up
  [[-1, 0],[-2, 0],[-3, 0],[-4, 0],[-5, 0],[-6, 0],[-7, 0]] #down
]

DIAGONAL_MOVES = [
  [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]], #up-right
  [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]], #down-left
  [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]], #up-left
  [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]] #down-right
]

module SlidingPiece

  def moves
    current_pos = @pos
    arr = []
    @potential_moves.each do |direction|
      direction.each do |move|
        x,y = current_pos
        x += move[0]
        y += move[1]
        new_pos = [x,y]
        arr << new_pos if land_check?(new_pos)
        break if land_check?(new_pos) == false
      end
    end
    arr
  end

end
