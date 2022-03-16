# frozen_string_literal: true

require_relative 'display'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
class GameMode
  attr_reader :display, :board

  def initialize(display, board)
    @display = display
    @board = board
  end

  def choose_game_mode
    display.print_choose_game_mode
    display.game_mode_choice
    display.validate_game_mode_choice
  end

  def get_player1(game_mode_chosen)
    case game_mode_chosen
    when 1
      HumanPlayer.new('X', 'Human', display)
    when 2
      ComputerPlayer.new('X', 'Computer', board, display)
    end
  end
end
