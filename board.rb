require 'byebug'
require_relative 'pieces.rb'


class Board
  attr_accessor :grid, :null_piece
  def initialize
    @null_piece = NullPiece.instance
    create_board
  end

  def create_board
    @grid = Array.new(8) {Array.new(8, null_piece)}
    @grid[0].each_index do |x|
      @grid[0][x] = Piece.new([0, x])
    end
    @grid[1].each_index do |x|
      @grid[1][x] = Pawn.new([1, x])
    end

    @grid[7].each_index do |x|
      @grid[7][x] = Piece.new([7, x])
    end
    @grid[6].each_index do |x|
      @grid[6][x] = Pawn.new([6, x])
    end
  end

  def []=(pos, piece)
    # debugger
    x,y = pos
    @grid[x][y] = piece
  end

  def [](pos)
    # debugger
    x,y = pos
    @grid[x][y]
  end

  def move_piece(start_pos, end_pos)
    # debugger
    start_piece = self[start_pos]
    self[end_pos] = start_piece
    start_piece.pos = end_pos
    self[start_pos] = @null_piece
  end

  def get_end_input
    begin
      puts "enter ending row"
      end_pos_row = gets.chomp.to_i
      puts "enter ending column"
      end_pos_col = gets.chomp.to_i
      end_pos = [end_pos_row, end_pos_col]
      raise EndPosError.new("Invalid end position.") if false
    rescue EndPosError => err
      p err.message
      retry
    end
    end_pos
  end

  def get_start_pos
    begin
      puts "enter starting row"
      start_pos_row = gets.chomp.to_i
      puts "enter starting column"
      start_pos_col = gets.chomp.to_i
      start_pos = [start_pos_row, start_pos_col]
      raise StartPosError.new("Invalid start position.") if @grid[start_pos[0]][start_pos[-1]].class == NullPiece
    rescue StartPosError => err
      p err.message
      retry
    end
    start_pos
  end

  def start_end_pos
    move_piece(get_start_pos, get_end_input)
  end

end

class StartPosError < StandardError; end
class EndPosError < StandardError; end
