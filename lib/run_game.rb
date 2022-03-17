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
  display = Display.new(message,validate_response, board)
  game_mode = GameMode.new(display)

  game_controller = GameController.new(display, game_mode, message)
  game_controller.start


end

start_game
