require_relative 'piece'

class Board

  attr_reader :board, :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate
  end

  def rows
    @grid
  end

  def cols
    @grid.transpose
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x, y = pos
    @grid[x][y] = value
  end

  def populate
    start_rows = [0,1,6,7]

    @grid.each_with_index do |row, row_i|
      row.each_index do |col_i|
        if start_rows.include?(row_i)
          @grid[row_i][col_i] = Piece.new
        else
          @grid[row_i][col_i] = nil
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new 'There is no piece there' if self[start_pos].nil?
    raise ArgumentError.new 'That is not a valid destination' unless valid_pos?(end_pos)

    
  end

  def valid_pos?(pos)
    return false if pos.any? { |el| el < 0 || el > 7 }
  end



end
