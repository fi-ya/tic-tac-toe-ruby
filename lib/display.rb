# frozen_string_literal: true

require_relative 'board'
require_relative 'message'
require_relative 'input_validation'
class Display
  attr_accessor :message, :board, :input_validation, :mode_choice, :replay_exit_choice, :custom_marker1,
                :custom_marker2

  def initialize(message, board, input_validation)
    @message = message
    @input_validation = input_validation
    @board = board
  end

  def clear_terminal
    system 'clear'
  end

  def welcome
    print_to_terminal(message.welcome)
  end

  def generate_board
    print_to_terminal(board.generate)
  end

  def ask_custom_marker
    print_to_terminal(message.ask_custom_marker)
  end

  def computer_mark(name, marker)
    print_to_terminal(message.computer_mark(name,marker))
  end

  def player1_custom_marker(player1_name)
    print_to_terminal(message.player1_custom_marker(player1_name))
  end

  def get_custom_marker1_choice
    @custom_marker1 = gets.chomp
    custom_marker1.upcase!
  end

  def validate_custom_marker1_choice
    until input_validation.valid_custom_marker?(custom_marker1)
      print_error_custom_marker
      get_custom_marker1_choice
    end
    custom_marker1
  end

  def print_error_custom_marker
    print_to_terminal(message.error_custom_marker)
  end

  def print_player1_custom_marker_choice(player1_name)
    print_to_terminal(message.player1_custom_marker_choice(player1_name, custom_marker1))
  end

  def print_player2_custom_marker(player2_name)
    print_to_terminal(message.player2_custom_marker(player2_name))
  end

  def get_custom_marker2_choice
    @custom_marker2 = gets.chomp
    custom_marker2.upcase!
  end

  def validate_custom_marker2_choice
    until input_validation.valid_custom_marker2?(custom_marker2, custom_marker1)
      print_error_custom_marker
      get_custom_marker2_choice
    end
    custom_marker2
  end

  def print_player2_custom_marker_choice(player2_name)
    print_to_terminal(message.player2_custom_marker_choice(player2_name, custom_marker2))
  end

  def print_show_current_player(marker, name)
    print_to_terminal(message.show_current_player(marker, name))
  end

  def print_computer_thinking
    print_to_terminal(message.computer_thinking)
  end

  def print_enter_num
    print_to_terminal(message.enter_num)
  end

  def print_invalid_move
    print_to_terminal(message.invalid_move)
  end

  def human_player_move(marker, name)
    player_move = gets.chomp.to_i
    print_players_move(marker, name, player_move)
    sleep 1.5
    player_move
  end

  def computer_move(marker, name)
    computer_move = board.available_moves[0].to_i
    print_players_move(marker, name, computer_move)
    sleep 1.5
    computer_move
  end

  def print_players_move(current_player_marker, current_player_name, players_move)
    print_to_terminal(message.players_move(current_player_marker, current_player_name, players_move))
  end

  def print_tie
    print_to_terminal(message.tie)
  end

  def print_won
    print_to_terminal(message.won(board.winning_player))
  end

  def print_game_mode_selection
    print_to_terminal(message.game_mode_selection)
  end

  def print_error_choose_game_mode
    print_to_terminal(message.error_game_mode)
  end

  def print_game_starting
    print_to_terminal(message.game_starting)
  end

  def print_replay_or_exit
    print_to_terminal(message.replay_or_exit)
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
    until input_validation.game_mode?(mode_choice)
      print_error_choose_game_mode
      game_mode_choice
    end
    mode_choice
  end

  def get_play_exit_choice
    @replay_exit_choice = gets.chomp.to_i
    replay_exit_choice
  end

  def validate_play_again_choice
    until input_validation.play_again?(replay_exit_choice)
      print_error_play_again_exit
      get_play_exit_choice
    end
    replay_exit_choice
  end
end
