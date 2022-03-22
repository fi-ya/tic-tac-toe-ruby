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

  context 'Computer vs human game' do
    it 'should not set a custom marker for computer player' do    
      custom_marker.set_player1_custom_marker
      expect(player1.marker).to eq('X')
    end

    it 'should display a message with computers marker' do    
      expect{custom_marker.get_player1_custom_marker}.to output("\nPlayer 1 (Computer) chose X marker \n").to_stdout
    end

    it 'should set a custom marker for human player 2' do    
      allow(display).to receive(:gets).and_return('s')
      expect{custom_marker.get_player2_custom_marker}.to output("\nPlayer 2 (Human) choose your custom marker: \nPlayer 2 (Human) your marker is S \n").to_stdout
    end
  end

  context 'Human vs human game' do
    let(:player1) { HumanPlayer.new('O', 'Human', display) }
    it 'should set a custom marker for human player 1' do    
      allow(display).to receive(:gets).and_return('a')
      expect {custom_marker.get_player1_custom_marker}.to output("\nPlayer 1 (Human) choose your custom marker: \nPlayer 1 (Human) your marker is A \n").to_stdout
    end

    it 'should set a custom marker for human player 2' do    
      allow(display).to receive(:gets).and_return('b')
      expect{custom_marker.get_player2_custom_marker}.to output("\nPlayer 2 (Human) choose your custom marker: \nPlayer 2 (Human) your marker is B \n").to_stdout
    end
  end

end


