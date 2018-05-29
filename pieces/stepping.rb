module SteppingPiece
  def moves
    current_pos = @pos
    arr = []
    @potential_moves.each do |m|
      x,y = current_pos
      x += m[0]
      y += m[1]
      next if x < 0 || x > 7 || y < 0 || y > 7
      new_pos = [x,y]
      arr << new_pos if land_check?(new_pos)
    end
    arr
  end
end
