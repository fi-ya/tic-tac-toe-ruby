# frozen_string_literal: true

require 'game'
require 'board'
require 'display'
require 'message'

describe Game do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:display) { Display.new(message, board) }
  subject(:game) { described_class.new(board, display, message) }

  context 'players take turns and marks the board' do
    it 'should display player X marker in top left and player O marker bottom right' do
      game.play_turn('X', 1)
      game.play_turn('O', 9)

      output = board.generate_board
      expect(output).to eq(" X | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | O \n")
    end

    it 'should check to see if position is taken returns true' do
      game.play_turn('X', 1)

      output = game.position_taken?(1)
      expect(output).to eq(true)
    end

    it 'should check to see if position is taken returns false' do
      game.play_turn('X', 0)
      game.play_turn('O', 8)

      output = game.position_taken?(1)
      expect(output).to eq(false)
    end

    it 'should verify if move is not valid if player picks zero' do
      output = game.valid_move?(0)
      expect(output).to eq(false)
    end

    it 'should verify if move valid if player picks 6' do
      output = game.valid_move?(6)
      expect(output).to eq(true)
    end

    it 'should show an error message when invalid move' do
      output = game.play_turn('X', 0)
      expected = display.print_to_terminal("\n Invalid move. Try again\n\n")
      expect(output).to eq(expected)
    end

    it 'should show player mark at position 4 if space is free and move is valid' do
      game.play_turn('X', 4)

      output = board.generate_board
      expect(output).to eq(" 1 | 2 | 3 \n-----------\n X | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
    end

    it 'should keep track of available moves in an array' do
      game.play_turn('X', 4)
      game.play_turn('O', 1)

      output = board.available_moves
      expect(output).to eq(%w[2 3 5 6 7 8 9])
      expect(output.length).to eq(7)
    end
  end

  context 'players take turns and marks the board' do
    it 'should verify no more moves allowed after 9 turns' do
      dummy_full_board

      output = game.turn

      expect(output).to eq(display.print_to_terminal("\nIt's a tie. Game Over!\n\n"))
    end

    it 'should return board_full? as false when new board is initilaised' do
      expect(board.board_full?).to eq(false)
    end

    it 'should return board_full? as true when board is full' do
      dummy_full_board

      board_full = board.available_moves.empty?

      expect(board_full).to eq(true)
    end
  end

  context 'game status messages'

  # it 'should print game won message ' do
  #   expect do
  #     game.game_status(%w[X X X O 5 6 O 8 9])
  #   end.to output("\nPlayer X wins!\n\n").to_stdout
  # end

  def dummy_full_board
    game.play_turn('X', 1)
    game.play_turn('O', 2)
    game.play_turn('X', 3)
    game.play_turn('O', 4)
    game.play_turn('X', 5)
    game.play_turn('O', 6)
    game.play_turn('X', 7)
    game.play_turn('O', 8)
    game.play_turn('X', 9)
  end
end