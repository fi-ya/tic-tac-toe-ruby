# frozen_string_literal: true

require 'custom_marker'

describe CustomMarker do
  let(:message) { Message.new }
  let(:board) { Board.new }
  let(:validate_response) { ValidateResponse.new }
  let(:display) { Display.new(message, board, validate_response) }
  let(:player1) { ComputerPlayer.new('X', 'Computer', display) }
  let(:player2) { HumanPlayer.new('O', 'Human', display) }

  subject(:custom_marker) { described_class.new(display, player1, player2) }
end
