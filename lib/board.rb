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
    column = column - 1
    row = column_count[column]
    arr_to_change = @board[row].split("")
    arr_to_change[column] = piece
    @board[row] = arr_to_change.join("")
    return board
  end
end
