require_relative 'piece.rb'
class Bishop < Piece
  def initialize(pos, color)
    color == :black ? @symbol = "\u265D" : @symbol = "\u2657"
    @pos = pos
    @color = color
  end

end
