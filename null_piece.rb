require_relative 'piece.rb'

class NullPiece < Piece 
  def initialize
    @pos = Array.new {Array.new}
  end
end