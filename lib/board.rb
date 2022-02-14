
class Board

attr_reader :board, :column_count, :invalid_columns, :game_result,:column_played
  def initialize
    @board = []
    @column_count = [6, 6, 6, 6, 6, 6, 6]
    @invalid_columns = []
    @game_result = ""
    @column_played
    @row_edited
  end

  def build_board
    @board = ["ABCDEFG", ".......", ".......", ".......", ".......", ".......", "......."]
  end

  def reset_columns
    @column_count = [0, 0, 0, 0, 0, 0, 0]
  end

  def add_piece(player, column)
    piece = ""
    if player == :human
      piece = "X"
    else
      piece = "O"
    end
    column = column - 1
    @column_played = column

    @invalid_columns.each do |index|
      if column == index || column < 0 || column > 6
        return "Please input a valid column"
      end
    end

    row = column_count[column]
    @row_edited = row
    arr_to_change = @board[row].split("")
    arr_to_change[column] = piece
    @board[row] = arr_to_change.join("")
    column_count[column] -= 1

    if column_count[column] == 0
      @invalid_columns << column
    end

    return board
  end

  def end_of_game

    board_check = []
    column_check = []
    diagonal1_check = []
    diagonal2_check = []
    7.times do |index|
      board_check << @board[index].split("")
    end

    #horizontal computer win
    if @board[@row_edited].include? "OOOO"
      @game_result = "Computer Wins"
      return @game_result
    #horizontal player win
    elsif @board[@row_edited].include? "XXXX"
      @game_result = "Player Wins"
      return @game_result
    elsif @column_count[@column_played] < 4
      #reprints a column as an array
      board_check.each do |index|
        column_check << index[@column_played]
      end
      #vertical computer win
      if column_check.join("").include? "OOOO"
        @game_result = "Computer Wins"
        return @game_result
      #vertical player win
      elsif column_check.join("").include? "XXXX"
        @game_result = "Player Wins"
        return @game_result
      else
        diag1_up = @row_edited
        diag1_down = @row_edited
        diag1_left = @column_played
        diag1_right = @column_played
        diag2_up = @row_edited
        diag2_down = @row_edited
        diag2_left = @column_played
        diag2_right = @column_played
        until diag1_down == 6 || diag1_left == -1
          diagonal1_check.append(board_check[diag1_down][diag1_left])
          diag1_down += 1
          diag1_left -= 1
        end
        until diag1_up == 0 || diag1_right == 7
          diagonal1_check.prepend(board_check[diag1_up][diag1_right])
          diag1_up -= 1
          diag1_right += 1
        end
        if diagonal1_check.join("").include? "OOOO"
          @game_result = "Computer Wins"
          return @game_result
        elsif diagonal1_check.join("").include? "XXXX"
          @game_result = "Player Wins"
          return @game_result
        end
        until diag2_down == 6 || diag2_right == 7
          diagonal2_check.append(board_check[diag2_down][diag2_right])
          diag2_down += 1
          diag2_right += 1
        end
        until diag2_up == 0 || diag2_left == -1
          diagonal2_check.prepend(board_check[diag2_up][diag2_left])
          diag2_up -= 1
          diag2_left -= 1
        end
        if diagonal2_check.join("").include? "OOOO"
          @game_result = "Computer Wins"
          return @game_result
        elsif diagonal2_check.join("").include? "XXXX"
          @game_result = "Player Wins"
          return @game_result
        end
      end
    end
  end

  def is_draw?
    if @invalid_columns.length == 7
    @game_result = "Draw"
    return @game_result
    end
  end

end
