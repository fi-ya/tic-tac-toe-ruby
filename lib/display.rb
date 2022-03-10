require_relative 'board'
require_relative 'message'
class Display

    attr_accessor :players_move, :grid, :message, :board

    def initialize(message, board)
        @message = message
        @board = board
        @players_move = players_move
    end

    def game_setup
      print_to_terminal(message.welcome)
      print_to_terminal(message.generate_board(board))
      print_to_terminal(message.enter_num)
  end

    def print_to_terminal(msg)
        print msg
    end

    def player_input
      players_move = gets.chomp.to_i
      print_players_move
      players_move
    end

    def print_players_move
      print_to_terminal(message.players_move(board.get_player_mark(board), players_move))
    end
    
end