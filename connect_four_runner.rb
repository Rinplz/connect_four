require './lib/game'

game = Game.new()
p "Welcome to CONNECT FOUR"
p "Enter p to play, press q to quit."
input = gets.chomp()
game.start_input(input)