require_relative 'piece.rb'

class Queen < Piece
  include SlidingPiece

  attr_accessor :pos, :symbol, :color, :potential_moves
  def initialize(pos, color)
    color == :black ? @symbol = "\u265B" : @symbol = "\u2655"
    @pos = pos
    @color = color
    @potential_moves = []
    assign_moves
  end

  def assign_moves
    @potential_moves = STRAIGHT_MOVES + DIAGONAL_MOVES
  end

end
