# frozen_string_literal: true

require 'computer_player'
require 'player'
require 'board'
require 'display'
require 'validate_response'
require 'message'

describe ComputerPlayer do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:validate_response) { ValidateResponse.new }
  let(:display) { Display.new(message, board, validate_response) }
  subject(:computer_player) { described_class.new('X', 'Computer', board, display) }

  context 'computer marker and name' do
    it 'should have X marker for computer' do
      expect(computer_player.marker).to eq('X')
    end

    it 'should have correct name for computer player' do
      expect(computer_player.name).to eq('Computer')
    end
  end

  context 'computer move' do
    it 'should return the first available empty space on the first turn as 1' do
      output = computer_player.get_move
      expect(output).to eq(1)
    end

    it 'should return the first available empty space on the second turn' do
      board.grid = %w[X O 3 5 6 7 8 9]
      output = computer_player.get_move
      expect(output).to eq(3)
    end

    it 'should return the first available empty space' do
      board.grid = %w[X O X 5 6 O 8 9]
      output = computer_player.get_move
      expect(output).to eq(5)
    end
  end
end
