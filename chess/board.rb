class Board

  attr_reader :@board :grid
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
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    @grid[pos] = value
  end

  def populate
    start_rows = [0,1,6,7]

    @grid.each do |row|

      row.each do |col|
        if start_rows.include?(row)
          @grid[row, col] = Piece.new
        else
          @grid[row, col] = nil
        end
      end
    end
  end

  def start_rows




end
