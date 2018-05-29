require_relative 'piece.rb'
class Bishop < Piece
  include SlidingPiece

  attr_accessor :pos, :symbol, :color, :potential_moves
  def initialize(pos, color)
    color == :black ? @symbol = "\u265D" : @symbol = "\u2657"
    @pos = pos
    @color = color
    @potential_moves = []
    assign_moves
  end

  def assign_moves
    @potential_moves = DIAGONAL_MOVES
  end

end
