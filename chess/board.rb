class Board

  attr_reader :@board :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}


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

  

end
