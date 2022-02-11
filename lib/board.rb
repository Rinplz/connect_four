class Board

attr_reader :board, :column_count
  def initialize
    @board = []
    @column_count = [6, 6, 6, 6, 6, 6, 6]
  end

  def build_board
    @board = ["ABCDEFG", ".......", ".......", ".......", ".......", ".......", "......."]
  end

  def reset_columns
    @column_count = ["0", "0", "0", "0", "0", "0", "0"]
  end

  def add_piece(player, column)
    piece = ""
    if player == :human
      piece = "X"
    else
      piece = "O"
    end

    return board
  end
end
