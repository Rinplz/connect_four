class Board

attr_reader :board, :column_count, :invalid_columns
  def initialize
    @board = []
    @column_count = [6, 6, 6, 6, 6, 6, 6]
    @invalid_columns = []
  end

  def build_board
    @board = ["ABCDEFG", ".......", ".......", ".......", ".......", ".......", "......."]
  end

  def reset_columns
    @column_count = [6, 6, 6, 6, 6, 6, 6]
  end

  def add_piece(player, column)
    piece = ""
    if player == :human
      piece = "X"
    else
      piece = "O"
    end
    column = column - 1

    @invalid_columns.each do |index|
      if column == index || column < 0 || column > 6
        return "Please input a valid column"
      end
    end

    row = column_count[column]
    arr_to_change = @board[row].split("")
    arr_to_change[column] = piece
    @board[row] = arr_to_change.join("")
    column_count[column] -= 1

    if column_count[column] == 0
      @invalid_columns << column
    end

    return board
  end

  def is_draw?
    return @invalid_columns.length == 7
  end
end
