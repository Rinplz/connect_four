require './lib/board'

class Game
  attr_reader :playing_game, :board, :input, :current_player, :columns

  def initialize()
    @playing_game = false
    @board = nil
    @input = ""
    @current_player = :human
    @columns = {"a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7}
  end

  def start()
    p "Welcome to CONNECT FOUR"
    while @input != "p" && @input != "q"
      p "Enter p to play, press q to quit."
      @input = gets.chomp()
    end
    if @input == "p"
      @board = Board.new()
      @playing_game = true
      board.build_board
      self.play_game
    else 
      return "Goodbye, player!"
    end
  end

  def play_game
    while board.game_result == ""
      if current_player == :human
        p "Your turn."
        input = gets.chomp
        board.add_piece(current_player, columns[input.downcase])
        board.display_board
        @current_player = :computer
      else
        p "Computer turn."
        board.comp_turn
        board.display_board
        @current_player = :human
      end
      board.is_draw?
      board.end_of_game
      
    end
    p board.game_result
    @input = ""
    self.start
  end

end