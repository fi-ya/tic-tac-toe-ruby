# frozen_string_literal: true

require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'message'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'game_mode'
require_relative 'game_factory'

def start_game
  board = Board.new
  message = Message.new
  validate_response = ValidateResponse.new
  display = Display.new(message, board, validate_response)
  game_mode = GameMode.new(display, board)

  game_factory = GameFactory.new(display, game_mode, board)
  game_factory.create_game
  game_factory.start_game
  game_factory.replay_exit_option
end

start_game
