# frozen_string_literal: true

require 'game_controller'

describe GameController do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:validate_response) { ValidateResponse.new }
  let(:display) { Display.new(message, board, validate_response) }
  let(:game_mode) { GameMode.new(display) }
  let(:player1) { ComputerPlayer.new('X', 'Computer', display) }
  let(:player2) { HumanPlayer.new('O', 'Human', display) }
  let(:game) { Game.new(board, display, player1, player2) }

  subject(:game_controller) { described_class.new(display, game_mode, message, board) }

  context '.replay_or_exit' do
    it 'should exit the game when option 2 selected' do
      expect { game_controller.replay_or_exit(2) }.to output("\nThanks for playing Tic Tac Toe!\n\n").to_stdout
    end
  end
end
