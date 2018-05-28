
class Piece
  attr_accessor :pos
  def initialize(pos)
    @pos = pos
  end
  
  def move(new_pos)
    @pos = [new_pos[0], new_pos[-1]]
  end
end