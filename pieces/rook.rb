require_relative 'piece.rb'

class Rook < Piece
  def initialize(pos, color)
    color == :black ? @symbol = "\u265C" : @symbol = "\u2656"
    @pos = pos
    @color = color
  end

end
