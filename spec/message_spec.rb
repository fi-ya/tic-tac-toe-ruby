# frozen_string_literal: true

require 'message'

describe Message do
  before do
    @message = Message.new
    @new_board = Board.new(@message)
  end

  context 'print messages in the terminal ' do
    it 'should display correct welcome message' do
      expect do
        @new_board.print_to_terminal(@message.welcome)
      end.to output("\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n").to_stdout
    end

    it 'should display correct enter number instruction' do
      expect do
        @new_board.print_to_terminal(@message.enter_num)
      end.to output("\nEnter a number between 1-9: ").to_stdout
    end

    it 'should display the player and the move they have made' do
      expect do
        @new_board.print_to_terminal(@message.players_move('X', 1))
      end.to output("\nPlayer X chose 1 \n\n").to_stdout
    end

    it 'should display invalid move message' do
      expect do
        @new_board.print_to_terminal(@message.invalid_move)
      end.to output("\nInvalid move. Try again\n\n").to_stdout
    end

    it 'should display game over message' do
      expect { @new_board.print_to_terminal(@message.tie) }.to output("\nIt's a tie. Game Over!\n\n").to_stdout
    end

    it 'should display winning message' do
      expect { @new_board.print_to_terminal(@message.won('X')) }.to output("\nPlayer X wins!\n\n").to_stdout
    end
  end
end
