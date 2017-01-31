require_relative 'board', 'cursor'
require 'colorize'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
end
