require_relative 'piece.rb'

class Pawn
  attr_accessor :symbol, :pos
  def initialize(pos)
    @symbol = "\u265F"
    @pos = pos
  end
end
