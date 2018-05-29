require_relative 'piece.rb'
require_relative 'sliding.rb'
class Rook < Piece
  attr_accessor :pos, :symbol, :color, :potential_moves
  include SlidingPiece
  def initialize(pos, color)
    color == :black ? @symbol = "\u265C" : @symbol = "\u2656"
    @pos = pos
    @color = color
    @potential_moves = []
    assign_moves
  end

  def assign_moves
    @potential_moves = STRAIGHT_MOVES
  end

end
