require_relative 'board'
require_relative 'message'

class Game

    attr_reader :board, :player_mark, :display, :message

    def initialize(board, display, message)
        @board = board
        @message = message
        @display = display
        @player_mark = ['X', "O"]
    end

    def turn
      until game_over?
        play_turn(board.get_player_mark(board), display.player_input)
        display.print_to_terminal(message.generate_board(board))
        display.print_to_terminal(message.enter_num) unless game_over?
      end
      game_status(board)
    end

    def play_turn(player, index)
        if player == 'X' && valid_move?(index)
          board.place_player('X', index)
        elsif player == 'O' && valid_move?(index)
          board.place_player('O', index)
        else
          display.print_to_terminal(message.invalid_move)
        end
      end
    
      def game_over?
        board.board_full? || win?(board)
      end

      WINNING_MOVES = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ].freeze

      def win?(board)
        winning_plays = []
    
        WINNING_MOVES.all? do |winning_game|
          pos1_eq_pos2 = board.grid[winning_game[0]] == board.grid[winning_game[1]]
          pos2_eq_po3 = board.grid[winning_game[1]] == board.grid[winning_game[2]]
          winning_plays.push(pos1_eq_pos2 && pos2_eq_po3 ? true : false)
        end
    
        winning_plays.any? { |game| game == true }
      end

      def winning_player(board)
        board.grid.count('X') > board.grid.count('O') ? 'X' : 'O'
      end

      def position_taken?(index)
        board.grid[index - 1] == 'X' || board.grid[index - 1] == 'O'
      end
    
      def valid_move?(index)
        !position_taken?(index) && index.between?(1, 9)
      end

      def game_status(board)
        if board.board_full? && !win?(board)
          display.print_to_terminal(message.tie)
        else
          display.print_to_terminal(message.won(winning_player(board)))
        end
      end

 

end