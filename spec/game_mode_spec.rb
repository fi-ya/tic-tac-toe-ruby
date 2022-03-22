require 'game_mode'
require 'board'
require 'display'
require 'human_player'
require 'computer_player'

describe GameMode do
  let(:board) { Board.new }
  let(:message) { Message.new }
  let(:input_validation) { InputValidation.new }
  let(:display) { Display.new(message, board, input_validation) }

  subject(:game_mode) { described_class.new(display) }

  context '.get_player1' do
    it 'should create new instance of HumanPlayer with choice 1' do
      expect(game_mode.set_player1(1)).to be_instance_of(HumanPlayer)
    end

    it 'should create new instance of ComputerPlayer with choice 2 ' do
      expect(game_mode.set_player1(2)).to be_instance_of(ComputerPlayer)
    end
  end
end
