# frozen_string_literal: true

require 'custom_marker'

describe CustomMarker do
  let(:message) { Message.new }
  let(:board) { Board.new }
  let(:input_validation) { InputValidation.new }
  let(:display) { Display.new(message, board, input_validation) }
  let(:player1) { ComputerPlayer.new('X', 'Computer', display) }
  let(:player2) { HumanPlayer.new('O', 'Human', display) }

  subject(:custom_marker) { described_class.new(display, player1, player2) }

  it 'should set player 1 custom marker if valid' do
    p 'player1 marker ', player1.marker
    player1_marker = 'S'
    custom_marker.set_player1_custom_marker

    expect(player1.marker).to eq('S')
  end
end
