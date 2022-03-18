# frozen_string_literal: true

require 'human_player'
require 'validate_response'
require 'board'
require 'message'

describe HumanPlayer do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:validate_response) { ValidateResponse.new }
  let(:display) { Display.new(message, board, validate_response) }
  subject(:human_player) { described_class.new('O', 'Human', display) }

  context 'human marker and name' do
    it 'should have O marker for human' do
      expect(human_player.marker).to eq('O')
    end

    it 'should have correct name and class for human player' do
      expect(human_player.name).to eq('Human')
      expect(human_player).to be_instance_of(HumanPlayer)
    end
  end
end
