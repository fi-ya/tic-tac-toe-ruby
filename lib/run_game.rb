# frozen_string_literal: true

require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'message'
require_relative 'computer_player'

def start_game
  board = Board.new
  message = Message.new
  display = Display.new(message, board)
  computer_player = ComputerPlayer.new
  game = Game.new(board, display, message, computer_player='X')

  display.game_setup
  # player chooses game
  game.turn
end

start_game
