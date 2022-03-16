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

  # player1 = ComputerPlayer.new('X', 'Computer', board, display)
  # player2 = HumanPlayer.new('O', 'Human', display)
  # game = Game.new(board, display, player1, player2)

# runner uses display to ask player to select game mode, 1 or 2
# runner itself - or GameMode object - gives this game mode selection as argument
# to get back Player 1 (either a Computer or Human)
# it creates Player 2 (Human)
# gives these to a Game, and sets Game to run


  game_mode = GameMode.new(display, board)

  display.print_welcome
  game_mode.setup_game(game_mode.choose_game_mode)

  # display.print_board
  # display.print_enter_num

  # game.turn
end

start_game
