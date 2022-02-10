require './lib/board'
require './lib/game'

RSpec.describe 'Game' do
  it 'exists' do
    game = Game.new()

    expect(game).to be_an_instance_of(Game)
  end

  it 'prompts for game start' do
    game = Game.new()

    expect(game.input).to eq("")

    game.start()

    expect(game.input).not_to eq("")
  end

end