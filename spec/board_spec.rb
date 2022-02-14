require './lib/board'

RSpec.describe Board do
  it 'can create an empty board' do
    board = Board.new

    expect(board.build_board).to eq(["ABCDEFG", ".......", ".......", ".......", ".......", ".......", "......."])
  end

  it 'can add a piece based on provided input' do
    board = Board.new
    board.build_board

    board.add_piece(:human, 1)

    expect(board.board).to eq(["ABCDEFG", ".......", ".......", ".......", ".......", ".......", "X......"])
  end

  it 'can detect if a column is invalid' do
    board = Board.new
    board.build_board

    6.times do
      board.add_piece(:human, 1)
    end

    expect(board.invalid_columns).to eq([0])
    expect(board.add_piece(:human, 1)).to eq("Please input a valid column")
  end


end
