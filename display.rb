require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"
require 'byebug'


class Display
  attr_reader :board
  def initialize(cursor_pos, board)
    @board = board
    @cursor_pos = cursor_pos
    @cursor = Cursor.new(@cursor_pos, board)
    @selected =
    @loop = false
    looper
  end

  def looper
    while @loop == false
      render
      @cursor_pos = @cursor.get_input

    end
  end

  def render
    system("clear")
    puts @cursor_pos
    puts "   #{(0..7).to_a.join("  ")}"
    i = 0
    @board.grid.each_with_index do |row, idr|
      print "#{idr} "
      row.each_with_index do |col, idc|
        if [idr, idc] == @cursor_pos
          print " #{col.symbol.encode('utf-8')} ".colorize(:color => :white, :background => :light_blue)
        else
          print " #{col.symbol} "
        end
      end
      print "\n"
    end
  end


end

if __FILE__ == $PROGRAM_NAME
board = Board.new
disp = Display.new([0,0], board)
end
