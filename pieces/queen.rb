require_relative 'piece.rb'

class Queen < Piece
  attr_accessor :pos, :symbol, :color
  def initialize(pos, color)
    color == :black ? @symbol = "\u265B" : @symbol = "\u2655"
    @pos = pos
    @color = color
  end

end
