# frozen_string_literal: true

require 'board'
require 'game'

describe Board do
  let(:message) { Message.new }
  subject(:board) { described_class.new }

  context '#generate_board' do
    it 'should display the board' do
      output = board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display correct player marker in the top left corner' do
      verify_top_left('X')
      verify_top_left('O')
    end

    it 'should display an X in the top middle row' do
      board.mark_board('X', 2)
      output = board.generate_board
      expect(output).to eq(" 1 | X | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the top right row' do
      board.mark_board('X', 3)
      output = board.generate_board
      expect(output).to eq(" 1 | 2 | X \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the middle left row' do
      board.mark_board('X', 4)
      output = board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n X | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the middle middle row' do
      board.mark_board('X', 5)
      output = board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | X | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the middle right row' do
      board.mark_board('X', 6)
      output = board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | X \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should display an X in the bottom left row' do
      board.mark_board('X', 7)
      output = board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n X | 8 | 9 \n")
    end

    it 'should display an X in the bottom middle row' do
      board.mark_board('X', 8)
      output = board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | X | 9 \n")
    end

    it 'should display correct players marker in the bottom right row' do
      verify_bottom_right('X')
      verify_bottom_right('O')
    end
  end

  context '#get_player_mark' do
    it 'should show an empty board and updates board with player marker X on the first play' do
      board.grid = %w[1 2 3 4 5 6 7 8 9]
      current_player_mark = board.get_player_mark
      expect(current_player_mark).to eq('X')
    end

    it 'should return the correct player mark on second turn for player O' do
      board.grid = %w[1 X 3 4 5 6 7 8 9]
      current_player_mark = board.get_player_mark
      expect(current_player_mark).to eq('O')
    end

    it 'should return the correct player mark on third turn for player X' do
      board.grid = %w[1 X O 4 5 6 7 8 9]
      current_player_mark = board.get_player_mark
      expect(current_player_mark).to eq('X')
    end

    it 'should return the correct player mark on fourth turn for player O' do
      board.grid = %w[1 X O X 5 6 7 8 9]
      current_player_mark = board.get_player_mark
      expect(current_player_mark).to eq('O')
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

    it 'should correctly identify winning player and return its marker' do
      board.grid = %w[X X X O 5 6 O 8 9]
      winning_player = board.winning_player
      expect(winning_player).to eq('X')
    end

    it 'should correctly identify winning player and return its marker' do
      board.grid = %w[O O O X 5 6 X 8 9]
      winning_player = board.winning_player
      expect(winning_player).to eq('O')
    end

    it 'should correctly identify winning play and return true' do
      board.grid = %w[X X X O 5 6 O 8 9]
      win = board.win?
      expect(win).to eq(true)
    end

    it 'should correctly identify losing play and return false' do
      board.grid = %w[X X O O O X X O X]
      win = board.win?
      expect(win).to eq(false)
    end
  end

  # Helper methods
  def verify_top_left(player)
    board.mark_board(player, 1)
    output = board.generate_board
    expect(output).to eq(" #{player} | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
  end

  def verify_bottom_right(player)
    board.mark_board(player, 9)
    output = board.generate_board
    expect(output).to eq(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | #{player} \n")
  end
end
