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

    it 'should have correct name for computer player' do
      expect(human_player.name).to eq('Human')
    end
  end

  context 'human player move' do
    xit 'should take the correct player input from the terminal' do
      # p "human move: #{$stdin}"
      board.grid = %w[X 2 3 5 6 7 8 9]
      allow($stdin).to receive(:gets).and_return(2)
      expect(human_player.get_move).to eq(2)
    end
  end
end
