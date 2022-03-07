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
      end.to output("\n Let's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n").to_stdout
    end

    it 'should display correct enter number instruction' do
      expect do
        @new_board.print_to_terminal(@message.enter_num)
      end.to output("\n Enter a number between 0-8\n\n").to_stdout
    end

    it 'should display invalid move message' do
      expect do
        @new_board.print_to_terminal(@message.invalid_move)
      end.to output("\n Invalid move. Try again\n\n").to_stdout
    end

    it 'should display game over message' do
      expect { @new_board.print_to_terminal(@message.game_over) }.to output("\n Nobody won. Game Over!\n\n").to_stdout
    end

    it 'should display winning message' do
      expect { @new_board.print_to_terminal(@message.won) }.to output("\n You Won!\n\n").to_stdout
    end
  end
end
