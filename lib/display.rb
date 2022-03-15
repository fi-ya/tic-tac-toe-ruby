# frozen_string_literal: true

require_relative 'board'
require_relative 'message'
class Display
  attr_accessor :message, :board

  def initialize(message, board)
    @message = message
    @board = board
  end

  def game_setup
    print_to_terminal(message.welcome)
    print_to_terminal(board.generate)
    print_enter_num
  end

  def print_enter_num
    print_to_terminal(message.enter_num)
  end

  def get_player_input
    player_move = gets.chomp.to_i
    print_players_move(player_move)
    player_move
  end

  def print_invalid_move
    print_to_terminal(message.invalid_move)
  end

  def print_players_move(players_move)
    print_to_terminal(message.players_move(board.get_player_mark, players_move))
  end

  def print_tie
    print_to_terminal(message.tie)
  end

  def print_won
    print_to_terminal(message.won(board.winning_player))
  end

  def print_to_terminal(msg)
    print msg
  end
end
