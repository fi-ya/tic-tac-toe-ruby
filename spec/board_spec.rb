# frozen_string_literal: true

require 'board'
require 'game'

describe Board do
  let(:message) { Message.new }
  subject(:board) { described_class.new }

  context '.generate' do
    it 'should display the board' do
      expect(board.generate).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display correct player marker in the top left corner' do
      verify_top_left('X')
      verify_top_left('O')
    end

    it 'should display an X in the middle middle row' do
      board.mark_board('X', 5)
      expect(board.generate).to eq(" 1 | 2 | 3 \n-----------\n 4 | X | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the middle right row' do
      board.mark_board('X', 6)
      expect(board.generate).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | X \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display correct players marker in the bottom right row' do
      verify_bottom_right('X')
      verify_bottom_right('O')
    end

    it 'should show player mark at position 4 if space is free and move is valid' do
      board.grid = %w[X 2 3 O 5 6 7 8 9]

      expect(board.generate).to eq(" X | 2 | 3 \n-----------\n O | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end
  end

  context '#get_player_mark' do
    it 'should show an empty board and updates board with player marker X on the first play' do
      board.grid = %w[1 2 3 4 5 6 7 8 9]
      expect(board.get_player_mark).to eq('X')
    end

    it 'should return the correct player mark on second turn for player O' do
      board.grid = %w[1 X 3 4 5 6 7 8 9]
      expect(board.get_player_mark).to eq('O')
    end

    it 'should return the correct player mark on third turn for player X' do
      board.grid = %w[1 X O 4 5 6 7 8 9]
      expect(board.get_player_mark).to eq('X')
    end
  end

  context 'position taken' do
    it 'should check to see if position is taken returns true' do
      board.grid = %w[X 2 3 4 5 6 7 8 9]

      expect(board.position_taken?(1)).to eq(true)
    end

    it 'should check to see if position is taken returns false' do
      board.grid = %w[X 2 O 4 5 6 7 8 9]

      expect(board.position_taken?(2)).to eq(false)
    end
  end

  context 'available moves' do
    it 'should keep track of available moves in an array' do
      board.grid = %w[X 2 3 O 5 6 7 8 9]

      expect(board.available_moves).to eq(%w[2 3 5 6 7 8 9])
      expect(board.available_moves.length).to eq(7)
    end
  end

  context 'board is correctly assessed ' do
    it 'should return board_full? as false when new board is initilaised' do
      expect(board.board_full?).to eq(false)
    end

    it 'should return board_full? as true when board is full' do
      board.grid = %w[X O X O X O X O]

      expect(board.available_moves.empty?).to eq(true)
    end
  end

  context 'game play' do
    it 'should have a list of winning moves' do
      winning_moves = Board::WINNING_MOVES
      expect(winning_moves).to eq([
                                    [0, 1, 2],
                                    [3, 4, 5],
                                    [6, 7, 8],
                                    [0, 3, 6],
                                    [1, 4, 7],
                                    [2, 5, 8],
                                    [0, 4, 8],
                                    [2, 4, 6]
                                  ])
    end

    it 'should correctly identify winning player and return X marker' do
      board.grid = %w[X X X O 5 6 O 8 9]

      expect(board.winning_player).to eq('X')
    end

    it 'should correctly identify winning player and return O marker' do
      board.grid = %w[O O O X 5 6 X 8 9]

      expect(board.winning_player).to eq('O')
    end

    it 'should correctly identify winning play and return true' do
      board.grid = %w[X X X O 5 6 O 8 9]

      expect(board.win?).to eq(true)
    end

    it 'should correctly identify losing play and return false' do
      board.grid = %w[X X O O O X X O X]

      expect(board.win?).to eq(false)
    end
  end

  # Helper methods
  def verify_top_left(player)
    board.mark_board(player, 1)

    expect(board.generate).to eq(" #{player} | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
  end

  def verify_bottom_right(player)
    board.mark_board(player, 9)

    expect(board.generate).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | #{player} \n")
  end
end
