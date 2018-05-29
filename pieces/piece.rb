require 'byebug'
class Piece
  attr_accessor :pos, :symbol, :color
  def initialize(pos, color)
    @symbol = "P"#.colorize(:color => color)
    @pos = pos
    @color = color
  end

  def self.all
    arr = []
    ObjectSpace.each_object(Piece) {|x| arr << x}
    arr
  end

  def land_check?(coord)
    arr = Piece.all.select{ |piece| piece.pos == coord}
    return true if arr.empty?
    arr[0].color != @color
  end


  # def valid_land(pos)
  #   pos.color == self.color
  # end

end
