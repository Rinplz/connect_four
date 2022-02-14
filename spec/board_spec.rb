require './lib/board'
require 'pry'

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

    board.is_draw?

    expect(board.invalid_columns).to eq([0, 1, 2, 3, 4, 5, 6])
    expect(board.game_result).to eq("Draw")
  end

  it 'can detect if game is won horizontally' do
    board = Board.new
    board.build_board

    board.add_piece(:human, 1)
    board.add_piece(:human, 2)
    board.add_piece(:human, 3)
    board.add_piece(:human, 4)
    board.end_of_game

    expect(board.game_result).to eq("Player Wins")
  end

  it 'can detect if a game is won vertically' do
    board = Board.new
    board.build_board

    board.add_piece(:human, 1)
    board.add_piece(:human, 1)
    board.add_piece(:human, 1)
    board.add_piece(:human, 1)
    board.end_of_game

    expect(board.game_result).to eq("Player Wins")
  end

  it 'can detect if a game is won diagonally from bottom left to top right' do
    board = Board.new
    board.build_board

    board.add_piece(:human, 1)
    board.add_piece(:computer, 2)
    board.add_piece(:human, 2)
    board.add_piece(:computer, 3)
    board.add_piece(:computer, 3)
    board.add_piece(:human, 3)
    board.add_piece(:computer, 4)
    board.add_piece(:computer, 4)
    board.add_piece(:computer, 4)
    board.add_piece(:human, 4)
    board.end_of_game

    expect(board.game_result).to eq("Player Wins")
  end

  it 'can detect if a game is won diagonally from bottom right to top left' do
    board = Board.new
    board.build_board

    board.add_piece(:human, 7)
    board.add_piece(:computer, 6)
    board.add_piece(:human, 6)
    board.add_piece(:computer, 5)
    board.add_piece(:computer, 5)
    board.add_piece(:human, 5)
    board.add_piece(:computer, 4)
    board.add_piece(:computer, 4)
    board.add_piece(:computer, 4)
    board.add_piece(:human, 4)
    board.end_of_game

    expect(board.game_result).to eq("Player Wins")
  end


end
