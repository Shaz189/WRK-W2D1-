require_relative 'piece.rb'

class Pawn
  attr_accessor :symbol, :pos
  def initialize(pos, color)
    color == :black ? @symbol = "\u265F" : @symbol = "\u2659"
    @pos = pos
    @color = color
  end
end
