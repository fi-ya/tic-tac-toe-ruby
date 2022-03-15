# frozen_string_literal: true

require_relative 'board'
require_relative 'message'

class Game
  attr_reader :board, :message, :display, :player1, :player2, :current_player

  def initialize(board, display, message, player1, player2)
    @board = board
    @message = message
    @display = display
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def turn
    until game_over?
      play_turn(current_player, current_player.get_move)
      display.print_to_terminal(board.generate_board)
      display.print_enter_num unless game_over?
    end
    game_status
  end

  def play_turn(player, move)
    if valid_move?(move)
      update_board(player, move)
      update_current_player
    else
      display.print_invalid_move
    end
  end

  def update_board(player, move)
    player == player1 ? board.mark_board(player1.marker, move) : board.mark_board(player2.marker, move)
  end

  def update_current_player
    current_player == player1 ? set_current_player(player2) : set_current_player(player1)
  end

  def set_current_player(current_player)
    @current_player = current_player
  end

  def game_over?
    board.board_full? || board.win?
  end

  def valid_move?(index)
    !board.position_taken?(index) && index.between?(1, 9)
  end

  def game_status
    if board.board_full? && !board.win?
      display.print_tie
    else
      display.print_won
    end
  end
end
