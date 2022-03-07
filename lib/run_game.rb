# frozen_string_literal: true

require_relative 'board'
require_relative 'message'

def start_game
  new_board = Board.new(Message.new)
  new_board.game_setup
  new_board.turn
 
end

start_game
