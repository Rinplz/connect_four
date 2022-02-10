class Game
  attr_reader :playing_game, :board, :input

  def initialize()
    @playing_game = false
    @board = []
    @input = ""
  end

  def start_input(input)
    @input = input
  end
end