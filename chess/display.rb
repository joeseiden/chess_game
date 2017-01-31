require_relative 'cursor'
require 'colorize'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system('clear')
    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        pos
        if @cursor.cursor_pos == pos
          print @board[pos].value.colorize(:background => :light_red) unless @board[pos].nil?
        elsif (row + col).even?
          print @board[pos].value.colorize(:background => :default) unless @board[pos].nil?
        else
          print @board[pos].value.colorize(:background => :white) unless @board[pos].nil?
        end
      end
      puts "\n"
    end

  end

  def show
    while true
      render
      @cursor.get_input
    end
  end

end
