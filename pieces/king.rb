require_relative 'piece.rb'
require_relative 'stepping.rb'

class King < Piece
  attr_accessor :pos, :symbol, :color, :potential_moves
  include SteppingPiece
  def initialize(pos, color)
    color == :black ? @symbol = "\u265A" : @symbol = "\u2654"
    @pos = pos
    @color = color
    @potential_moves = [
      [1,0], [1,1], [1,-1],
      [-1,0], [-1,1], [-1,-1],
      [0,1], [0,-1]
    ]
  end
end
