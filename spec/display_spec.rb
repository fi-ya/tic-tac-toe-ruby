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

  context 'correct input output' do
    it 'should print the board to the terminal' do
      expect do
        display.print_to_terminal(board.generate)
      end.to output(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n").to_stdout
    end

    xit 'should take the correct player input from the terminal' do
      allow($stdin).to receive(:gets).and_return(0)
      expect(display.players_move).to eq(0)
    end

    it 'should display the player and the move they have made' do
      expect do
        display.print_to_terminal(message.players_move('X', 1))
      end.to output("\nPlayer X chose 1 \n\n").to_stdout
    end
  end

  context 'at start of new game prints the correct messages' do
    it 'should display a welcome message' do
      expect do
        display.print_welcome
      end.to output("\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n").to_stdout
    end
  end

  context 'validate game mode choice' do
    xit 'should validate the users input and return error if input out of limits' do
      allow($stdin).to receive(:gets).and_return(1)
      output = display.validate_game_mode_choice
      expect(output).to eq(1)
    end
  end
end
