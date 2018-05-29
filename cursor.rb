require 'byebug'
require "io/console"
require_relative 'display.rb'
KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class MoveError < StandardError; end

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    begin
      key = KEYMAP[read_char]
      # debugger
      raise MoveError.new("invalid") unless valid_move?(MOVES[key])
      handle_key(key)
      rescue MoveError => e
      puts e.message
      retry
    end
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    # debugger
      case key
      when :left, :right, :up, :down
        update_pos(MOVES[key]) if valid_move?(MOVES[key])
        nil
      when :ctrl_c
        Process.exit(0)
      when :return, :space
        @cursor_pos
      end

  end

  def update_pos(diff) #[0, 1]
    # debugger
    current = @cursor_pos
    x = diff[0] + current[0]
    y = diff[1] + current[1]
    @cursor_pos = [x, y]
    Display.new(@cursor_pos, @board)
  end

  def valid_move?(pos)
    current = @cursor_pos
    x = pos[0] + current[0]
    y = pos[1] + current[1]
    x >= 0 && x <= 7 && y >= 0 && y <= 7
  end
end
