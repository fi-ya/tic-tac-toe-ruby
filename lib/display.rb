require_relative 'board'
require_relative 'message'

class Display

    attr_reader :board, :message

    # def initialize(message)
    #     @message = message
    # end

    def print_to_terminal(msg)
        print msg
    end

    def generate_board
        " #{board[0]} | #{board[1]} | #{board[2]} \n" \
          "-----------\n" \
          " #{board[3]} | #{board[4]} | #{board[5]} \n" \
          "-----------\n" \
          " #{board[6]} | #{board[7]} | #{board[8]} \n"
    end
    
    def print_board_with_msg
      print_to_terminal(generate_board)
      print_to_terminal(message.enter_num)
    end

    def game_setup
        print_to_terminal(message.welcome)
        print_board_with_msg
    end

    def print_players_move
        print_to_terminal(@message.players_move(get_player_mark(@board), @players_move))
      end
    
    
end