# frozen_string_literal: true

require 'game_mode'
require 'board'
require 'display'
require 'human_player'
require 'computer_player'

describe GameMode do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:validate_response) { ValidateResponse.new }
  let(:display) { Display.new(message, board, validate_response) }
  # let(:player1) { HumanPlayer.new('O', 'Human', display) }
  # let(:player2) { ComputerPlayer.new('X', 'Computer', display) }
  # let(:game) { Game.new(board, display, player1, player2) }

  subject(:game_mode) { described_class.new(display) }

  context '.get_player1' do
    it 'should create new instance of HumanPlayer with choice 1' do
      expect(game_mode.get_player1(1)).to be_instance_of(HumanPlayer)
    end

    it 'should create new instance of ComputerPlayer with choice 2 ' do
      expect(game_mode.get_player1(2)).to be_instance_of(ComputerPlayer)
    end
  end 
end
