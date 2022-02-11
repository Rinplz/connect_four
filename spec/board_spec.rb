require './lib/board'

RSpec.describe Board do
  it 'can create an empty board' do
    board = Board.new

    expect(board.build_board).to eq(["ABCDEFG", ".......", ".......", ".......", ".......", ".......", "......."])
  end

  it 'can add a piece based on provided input' do
    board = Board.new
    board.build_board

    board.add_piece(:player, "a")

    expect(board.board).to eq(["ABCDEFG", ".......", ".......", ".......", ".......", ".......", "X......"])
  end


end
