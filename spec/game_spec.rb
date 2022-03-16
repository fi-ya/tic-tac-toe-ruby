# frozen_string_literal: true

require 'game'
require 'board'
require 'display'
require 'validate_response'
require 'message'
require 'human_player'
require 'computer_player'
require 'player'

describe Game do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:validate_response) { ValidateResponse.new }
  let(:display) { Display.new(message, board, validate_response) }
  let(:player1) { ComputerPlayer.new('X', 'Computer', board, display) }
  let(:player2) { HumanPlayer.new('O', 'Human', display) }
  subject(:game) { described_class.new(board, display, player1, player2) }

  context 'players take turns and marks the board' do
    xit 'should display player X marker in top left and player O marker bottom right' do
      # game.play_turn('X', 1)
      # game.play_turn('O', 9)
      allow(display).to receive(:gets).and_return('1', '9')
      expect do
        game.turn
      end.to output(a_string_including(" X | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | O \n")).to_stdout
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
  end

  context 'moves are verified' do
    it 'should verify no more moves allowed after 9 turns' do
      dummy_full_board

      output = game.turn

      expect(output).to eq(display.print_to_terminal("\nIt's a tie. Game Over!\n\n"))
    end
  end

  context 'correct game status messages' do
    it 'should print game won message ' do
      expect do
        board.grid = %w[X X X O 5 6 O 8 9]
        game.game_status
      end.to output("\nPlayer X wins!\n\n").to_stdout
    end

    it 'should print game tied message ' do
      expect do
        board.grid = %w[X O X X O X O X O]
        game.game_status
      end.to output("\nIt's a tie. Game Over!\n\n").to_stdout
    end
  end

  context 'set and update current player correctly' do
    it 'should update current player marker correctly to O' do
      board.grid = %w[X 2 3 4 5 6 7 8 9]
      game.update_current_player
      output = game.current_player
      expect(output.marker).to eq('O')
    end

    it 'should update current player marker correctly to X' do
      board.grid = %w[X O 3 4 5 6 7 8 9]
      output = game.current_player.marker
      expect(output).to eq('X')
    end
  end

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
