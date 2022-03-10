# frozen_string_literal: true

class Message
  def welcome
    "\nLet's play Tic Tac Toe\n------------------------\n Player one = X\n Player two = O\n\n"
  end

  def generate_board(board)
    " #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]} \n" \
      "-----------\n" \
      " #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]} \n" \
      "-----------\n" \
      " #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]} \n"
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
end
