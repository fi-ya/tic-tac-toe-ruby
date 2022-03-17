require_relative 'display'
require_relative 'game'
require_relative 'game_mode'
require_relative 'human_player'

class GameFactory
  attr_accessor :display, :game_mode, :player1, :player2, :game, :board
  
  def initialize(display, game_mode, board)
    @board = board
    @display = display
    @game_mode = game_mode
  end

  def create_game
    # board = Board.new
    display.print_welcome
    @player1 = game_mode.get_player1(game_mode.choose_game_mode)
    @player2 = HumanPlayer.new('O', 'Human', display)
    @game = Game.new(board, display, player1, player2)
  end

  def start_game
    display.print_game_starting
    display.print_enter_num
    game.start_game
  end

  def replay_exit_option
    display.print_replay_or_exit
    display.play_exit_choice
    replay_or_exit(display.validate_play_again_choice)
  end

  def replay_or_exit(play_again_choice)
    if play_again_choice == 1 
      create_game
    else
      display.print_exit_msg
    end
  end

end
