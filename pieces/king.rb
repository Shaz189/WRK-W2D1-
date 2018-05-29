require_relative 'piece.rb'


class King < Piece
  def initialize(pos, color)
    color == :black ? @symbol = "\u265A" : @symbol = "\u2654"
    @pos = pos
    @color = color
  end
end
