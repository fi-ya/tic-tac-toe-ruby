# frozen_string_literal: true

require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'message'
require_relative 'computer_player'
require_relative 'human_player'

def start_game
  board = Board.new
  message = Message.new
  display = Display.new(message, board)
  # computer_player = ComputerPlayer.new
  player1 = ComputerPlayer.new('X', 'Computer', board, display)
  player2 = HumanPlayer.new('O', 'Human', display)
  game = Game.new(board, display, player1, player2)

  display.game_setup
  # player chooses game
  game.turn
end

start_game
