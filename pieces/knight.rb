require_relative 'piece.rb'
require_relative 'stepping.rb'

class Knight < Piece
  attr_accessor :pos, :symbol, :color
  include SteppingPiece
  def initialize(pos, color)
    color == :black ? @symbol = "\u265E" : @symbol = "\u2658"
    @pos = pos
    @color = color
    @potential_moves = [
      [1,2], [1,-2],
      [-1,2], [-1,-2],
      [2,1], [2,-1],
      [-2,1], [-2,-1]
    ]
  end

  private
  attr_reader :potential_moves

end
