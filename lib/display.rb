# frozen_string_literal: true

require_relative 'board'
require_relative 'message'
require_relative 'validate_response'
class Display
  attr_accessor :message, :board, :validate_response, :mode_choice, :play_exit

  def initialize(message, board, validate_response)
    @message = message
    @board = board
    @validate_response = validate_response
  end

  def print_welcome
    print_to_terminal(message.welcome)
  end

  def print_board
    print_to_terminal(board.generate)
  end

  def print_enter_num
    print_to_terminal(message.enter_num)
  end

  def players_move
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

  def print_choose_game_mode
    print_to_terminal(message.choose_game_mode)
  end

  def print_error_choose_game_mode
    print_to_terminal(message.error_game_mode)
  end

  def print_game_starting
    print_to_terminal(message.game_starting)
  end
  
  def print_play_again_exit
    print_to_terminal(message.play_again_exit)
  end

  def print_error_play_again_exit
    print_to_terminal(message.error_play_again_exit)
  end

  def print_exit_msg
    print_to_terminal(message.exit_msg)
  end

  def print_to_terminal(msg)
    print msg
  end

  def game_mode_choice
    @mode_choice = gets.chomp.to_i
    mode_choice
  end

  def validate_game_mode_choice
    until validate_response.game_mode?(mode_choice)
      print_error_choose_game_mode
      game_mode_choice
    end
    mode_choice
  end

  def play_exit_choice
    @play_exit = gets.chomp.to_i
    play_exit
  end

  def validate_play_again_choice
    until validate_response.play_again?(play_exit)
      p "play exit is: #{play_exit}"
      print_error_play_again_exit
      play_exit_choice
    end
    play_exit
  end

end
