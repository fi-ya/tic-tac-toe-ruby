# frozen_string_literal: true
require 'game_mode'
require 'board'
require 'display'
require 'human_player'
require 'computer_player'

describe 'GameMode' do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:validate_response) { ValidateResponse.new }
  let(:display) { Display.new(message, board, validate_response) }
  # let(:player1) { ComputerPlayer.new('X', 'Computer', board, display) }
  # let(:player2) { HumanPlayer.new('O', 'Human', display) }
  # let(:game) { Game.new(board, display, player1, player2) }

  subject(:game_mode) { described_class.new(display, board) }

  it 'should create new HumanPlayer with choice 1 ' do
    game_mode_chosen = 1
    expect(game_mode.get_player1(game_mode_chosen)).to be_instance_of(HumanPlayer)
  end
end
