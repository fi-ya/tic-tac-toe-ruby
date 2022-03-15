# frozen_string_literal: true

require 'display'

describe Display do
  let(:message) { Message.new }
  let(:board) { Board.new }
  subject(:display) { described_class.new(message, board) }

  context 'correct input output' do
    it 'should print the board to the terminal' do
      expect do
        display.print_to_terminal(board.generate_board)
      end.to output(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n").to_stdout
    end

    xit 'should take the correct player input from the terminal' do
      allow($stdin).to receive(:gets).and_return(0)
      expect(display.get_player_input).to eq(0)
    end
  end

  context 'print messages in the terminal ' do
    it 'should display correct welcome message' do
      expect do
        display.print_to_terminal(message.welcome)
      end.to output("\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n").to_stdout
    end

    it 'should display correct enter number instruction' do
      expect do
        display.print_to_terminal(message.enter_num)
      end.to output("\nEnter a number between 1-9: ").to_stdout
    end

    it 'should display the player and the move they have made' do
      expect do
        display.print_to_terminal(message.players_move('X', 1))
      end.to output("\nPlayer X chose 1 \n\n").to_stdout
    end

    it 'should display invalid move message' do
      expect do
        display.print_to_terminal(message.invalid_move)
      end.to output("\nInvalid move. Try again\n\n").to_stdout
    end

    it 'should display game over message' do
      expect do
        display.print_to_terminal(message.tie)
      end.to output("\nIt's a tie. Game Over!\n\n").to_stdout
    end

    it 'should display winning message' do
      expect do
        display.print_to_terminal(message.won('X'))
      end.to output("\nPlayer X wins!\n\n").to_stdout
    end
  end

  context 'at start of new game prints the correct messages' do
    it 'should display a welcome message, new board and enter number message' do
      expect do
        display.game_setup
      end.to output("\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n\nEnter a number between 1-9: ").to_stdout
    end
  end
end
