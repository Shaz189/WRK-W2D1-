require_relative 'piece.rb'

PAWN_MOVES = [[1,0]].freeze
PAWN_ATTACK = [[1,1], [1,-1]].freeze

class Pawn < Piece
  attr_accessor :symbol, :pos, :color


  def initialize(pos, color)
    color == :black ? @symbol = "\u265F" : @symbol = "\u2659"
    @pos = pos
    @color = color
  end

  def moves
    arr = []
    current_pos = @pos
    # move_arr = PAWN_MOVES
    # move_arr + attack_check
    PAWN_MOVES.each do |m|
      x,y = current_pos
      x += m[0]
      y += m[1]
      new_pos = [x,y]
      arr << new_pos if land_check?(new_pos)
    end
    PAWN_ATTACK.each do |m|
      x,y = current_pos
      x += m[0]
      y += m[1]
      new_pos = [x,y]
      arr << new_pos if attack_check?(new_pos)
    end
    arr
  end

  def attack_check?(coord)
    arr = Piece.all.select{ |piece| piece.pos == coord}
    return false if arr.empty? && arr[0].color != @color

  end

  # def attack_check
  #   current_pos = @pos
  #   first_attack = Piece.all.select{ |piece| piece.pos == PAWN_ATTACK.first && piece.color != @color}
  #   second_attack = Piece.all.select{ |piece| piece.pos == PAWN_ATTACK.last && piece.color != @color}
  #   return nil if first_attack.empty? && second_attack.empty?
  #   first_attack + second_attack
  # end
end
