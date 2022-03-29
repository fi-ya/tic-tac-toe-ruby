require 'human_player'
require 'input_validation'
require 'board'
require 'message'

describe HumanPlayer do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:input_validation) { InputValidation.new }
  let(:display) { Display.new(message, board, input_validation) }
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
