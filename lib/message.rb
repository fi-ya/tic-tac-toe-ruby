# frozen_string_literal: true

class Message
  def welcome
    "\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n"
  end

  def enter_num
    "\nEnter a number between 1-9: "
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

  def choose_game_mode
    "\nSelect a game:\n 1. Human vs Human\n 2. Computer vs Human\n\n"
  end

  def error_game_mode
    "\nInvalid option selected. Please try again:\n1. Human vs Human\n2. Computer vs Human\n\n"
  end
end
