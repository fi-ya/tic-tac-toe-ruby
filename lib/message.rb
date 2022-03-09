# frozen_string_literal: true

class Message
  def welcome
    "\n Let's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n"
  end

  def enter_num
    "\n Enter a number between 0-8\n\n"
  end

  def invalid_move
    "\n Invalid move. Try again\n\n"
  end

  def tie
    "\n It's a tie. Game Over!\n\n"
  end

  def won
    "\n You Won!\n\n"
  end
end
