require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_accessor :symbol
  def initialize
    @symbol = " "
    @label = " "
  end
end
