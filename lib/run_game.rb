# frozen_string_literal: true

require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'message'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'game_mode'
require_relative 'game_controller'

def start_game
  board = Board.new
  message = Message.new
  validate_response = ValidateResponse.new
  display = Display.new(message, board, validate_response)
  game_mode = GameMode.new(display, board)

  game_controller = GameController.new(display, game_mode, board)
  game_controller.start


end

start_game
