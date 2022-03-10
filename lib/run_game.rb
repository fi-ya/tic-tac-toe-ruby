# frozen_string_literal: true
require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'message'

def start_game
  board = Board.new
  message = Message.new
  display = Display.new(message, board)
  game = Game.new(board, display, message)
 

  display.game_setup

  
  game.turn

  # old way 
  # new_board = Board.new(Message.new)
  # new_board.game_setup
  # new_board.turn
end

start_game
