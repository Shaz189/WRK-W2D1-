require 'byebug'
require_relative 'piece.rb'
require_relative 'null_piece.rb'

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @null_piece = NullPiece.new 
    @grid.each_with_index do |row, idr|
      row.each_with_index do |col, idc|
        if idr < 2 || idr > 5 
          @grid[idr][idc] = Piece.new([idr, idc])
        else 
          @null_piece.pos << [idr,idc]
        end
      end
    end
  end
  
  def move_piece(start_pos, end_pos)
    start_piece = @grid[start_pos[0]][start_pos[-1]]
    start_piece.move(end_pos)
    @grid[end_pos[0]][end_pos[-1]] = start_piece
    # @grid[start_pos[0]][start_pos[-1]] = @null_piece.pos
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