require_relative 'piece.rb'

class Knight < Piece
  def initialize(pos, color)
    color == :black ? @symbol = "\u265E" : @symbol = "\u2658"
    @pos = pos
    @color = color
  end
end
