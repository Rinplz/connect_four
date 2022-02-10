require './lib/board'

class Game
  attr_reader :playing_game, :board, :input

  def initialize()
    @playing_game = false
    @board = nil
    @input = ""
  end

  def start()
    p "Welcome to CONNECT FOUR"
    while @input != "p" && @input != "q"
      p "Enter p to play, press q to quit."
      @input = gets.chomp()
    end
    if @input == "p"
      @board = Board.new()
    else 
      return "Goodbye, player!"
    end
  end
end