# frozen_string_literal: true

require_relative 'display'
require_relative 'game'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
class GameMode
  attr_reader :display, :board, :game, :human_player, :computer_player

  def initialize(display, board)
    @display = display
    @board = board
  end

  def choose_game_mode
    display.print_choose_game_mode
    display.game_mode_choice
    display.validate_game_mode_choice
  end

  def setup_game(game_mode_chosen)
    if game_mode_chosen == 1
      create_player(HumanPlayer.new('X', 'Human', display))
    else
      game_mode_chosen == 2
      create_player(ComputerPlayer.new('X', 'Computer', board, display))
    end
    display.print_game_starting
    display.print_enter_num
    game.start_game
  end

  def create_player(player1)
    create_game(board, display, player1, HumanPlayer.new('O', 'Human', display))
  end

  def create_game(*game)
    @game = Game.new(*game)
  end
end
