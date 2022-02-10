class Board

attr_accessor :board
  def initialize
    @board = []
  end

  def build_board
    @board = ["ABCDEFG", "......", "......", "......", "......", "......", "......."]
  end
end
