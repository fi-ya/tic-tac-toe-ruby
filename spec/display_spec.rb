# frozen_string_literal: true

require 'display'
require 'board'
require 'message'
require 'validate_response'

describe Display do
  let(:message) { Message.new }
  let(:board) { Board.new }
  let(:validate_response) { ValidateResponse.new }
  
  subject(:display) { described_class.new(message, board, validate_response) }

  context 'correct terminal output' do

    it 'should display a welcome message' do
      expect do
        display.print_welcome
      end.to output("\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n").to_stdout
    end

    it 'should print the board to the terminal' do
      expect do
        display.print_to_terminal(board.generate)
      end.to output(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n").to_stdout
    end

    it 'should display the player and the move they have made' do
      expect do
        display.print_to_terminal(message.players_move('X', 1))
      end.to output("\nPlayer X chose 1 \n\n").to_stdout
    end
  end

  context 'get players input' do
    
    it 'should return an interger when choosing a game mode' do
      allow(display).to receive(:gets).and_return('1')
      expect(display.game_mode_choice).to eq(1)
    end

    it 'should return an interger when playing a move' do
      allow(display).to receive(:gets).and_return('1')
      expect(display.players_move).to eq(1)
    end 
    
   it 'should return an interger when choosing to replay or quit' do
      allow(display).to receive(:gets).and_return('1')
      expect(display.get_play_exit_choice).to eq(1)
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