require './lib/board'

RSpec.describe Board do
  it 'can create an empty board' do
    board = Board.new

    expect(board.build_board).to eq(["ABCDEFG", "......", "......", "......", "......", "......", "......."])
  end
end
