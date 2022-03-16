# frozen_string_literal: true

require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'message'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'game_mode'

def start_game
  board = Board.new
  message = Message.new
  validate_response = ValidateResponse.new
  display = Display.new(message, board, validate_response)
  game_mode = GameMode.new(display, board)

  display.print_welcome
  player1 = game_mode.get_player1(game_mode.choose_game_mode)
  player2 = HumanPlayer.new('O', 'Human', display)
  game = Game.new(board, display, player1, player2)

  display.print_game_starting
  display.print_enter_num
  game.start_game

  # display option to restart
  # take input/validate
  # create new board

end

start_game
