# frozen_string_literal: true

require 'display'
require 'board'
require 'message'
require 'input_validation'

describe Display do
  let(:message) { Message.new }
  let(:board) { Board.new }
  let(:input_validation) { InputValidation.new }

  subject(:display) { described_class.new(message, board, input_validation) }

  context 'correct terminal output' do
    it 'should display a welcome message' do
      expect do
        display.welcome
      end.to output("\nLet's play Tic Tac Toe\n------------------------\n").to_stdout
    end

    it 'should print the board to the terminal' do
      expect do
        display.print_to_terminal(board.generate)
      end.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n").to_stdout
    end

    it 'should display the player and the move they have made' do
      expect do
        display.print_to_terminal(message.players_move('X', 'Human', 1))
      end.to output("\nPlayer X (Human) chose 1 \n\n").to_stdout
    end
  end

  context 'get players input' do
    it 'should return an integer when choosing a game mode' do
      allow(display).to receive(:gets).and_return('1')
      expect(display.game_mode_choice).to eq(1)
    end

    it 'should return an interger when playing a move' do
      allow(display).to receive(:gets).and_return('1')
      expect(display.human_player_move('X', 'Human')).to eq(1)
    end

    it 'should return an interger when choosing to replay or quit' do
      allow(display).to receive(:gets).and_return('1')
      expect(display.get_play_exit_choice).to eq(1)
    end

    it 'should return an string when player 1 is choosing a custom marker' do
      allow(display).to receive(:gets).and_return('s')
      expect(display.get_custom_marker1_choice).to eq('S')
    end

    it 'should return an string when player 2 is choosing a custom marker' do
      allow(display).to receive(:gets).and_return('w')
      expect(display.get_custom_marker2_choice).to eq('W')
    end
  end

  context 'validate input' do
    it 'should correctly validate input for game mode choice' do
      allow(display).to receive(:gets).and_return('2')
      expect(display.validate_game_mode_choice).to eq(2)
    end

    it 'should correctly validate input for play again option' do
      allow(display).to receive(:gets).and_return('1')
      expect(display.validate_play_again_choice).to eq(1)
    end
  end
end
