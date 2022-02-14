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

  it 'can detect a draw state' do
    board = Board.new
    board.build_board

    7.times do |index|
      6.times do
        board.add_piece(:human, (index + 1))
      end
    end

    expect(board.invalid_columns).to eq([0, 1, 2, 3, 4, 5, 6])
    expect(board.is_draw?).to eq(true)
  end

  it 'can handle computer turn' do
    board = Board.new
    board.build_board

    board.add_piece(:human, 1)
    expect(board.board).to eq(['ABCDEFG', '.......', '.......', '.......', '.......', '.......', 'X......'])
    board.comp_turn
    # If the computer turn went correctly, the board should have changed from it's state after the human turn.  We don't care which column it took.
    expect(board.board).not_to eq(['ABCDEFG', '.......', '.......', '.......', '.......', '.......', 'X......'])
    # This doesn't test if the board is full, because that state should never call comp_turn.
  end

  it 'will not place a computer turn in an invalid column' do
    board = Board.new
    board.build_board
    6.times do |index|
      6.times do 
        board.add_piece(:human, index + 1)
      end
    end

    expect(board.board).to eq(['ABCDEFG', 'XXXXXX.', 'XXXXXX.', 'XXXXXX.', 'XXXXXX.', 'XXXXXX.', 'XXXXXX.'])
    board.comp_turn
    expect(board.board).to eq(['ABCDEFG', 'XXXXXX.', 'XXXXXX.', 'XXXXXX.', 'XXXXXX.', 'XXXXXX.', 'XXXXXXO'])
  end



end
