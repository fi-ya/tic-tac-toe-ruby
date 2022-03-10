# frozen_string_literal: true

require_relative 'board'
require_relative 'message'
require_relative 'game'
require_relative 'display'

def start_game
  # new_board = Board.new(Message.new)
  # new_board.game_setup
  # new_board.turn

  new_game = Game.new(Board.new(Message.new), Message.new, Display.new)
  new_display = Display.new
  new_display.game_setup
  new_game.turn
end

start_game
