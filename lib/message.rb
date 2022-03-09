# frozen_string_literal: true

class Message
  def welcome
    "\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n"
  end

  def enter_num
    "\nEnter a number between 0-8: "
  end

  def players_move(player, move)
    "\nPlayer #{player} chose #{move} \n\n"
  end

  def invalid_move
    "\nInvalid move. Try again\n\n"
  end

  def tie
    "\nIt's a tie. Game Over!\n\n"
  end

  def won(player)
    "\nPlayer #{player} wins!\n\n"
  end
end
