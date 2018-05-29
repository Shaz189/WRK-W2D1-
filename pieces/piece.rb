
class Piece
  attr_accessor :pos, :symbol
  def initialize(pos, color)
    @symbol = "P"#.colorize(:color => color)
    @pos = pos
    @color = color
  end

end
