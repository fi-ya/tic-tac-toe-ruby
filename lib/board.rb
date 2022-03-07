# frozen_string_literal: true

require_relative 'message'

class Board
  attr_accessor :board

  WINNING_MOVES = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
]

  def initialize(message)
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @message = message
  end

  def generate_board
    " #{@board[0]} | #{@board[1]} | #{@board[2]} \n" \
      "-----------\n" \
      " #{@board[3]} | #{@board[4]} | #{@board[5]} \n" \
      "-----------\n" \
      " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def place_player(player, index)
    @board[index] = player
  end

  def play_turn(player, index)
    if player == 'X' && valid_move?(index)
      place_player('X', index)
    elsif player == 'O' && valid_move?(index)
      place_player('O', index)
    else
      print_to_terminal(@message.invalid_move)
    end
  end

  def position_taken?(index)
    board[index] == 'X' || board[index] == 'O'
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def turn_count
    counter = 0

    board.each do |space|
      counter += 1 if %w[X O].include?(space)
    end

    counter
  end

  def print_to_terminal(msg)
    puts msg
  end

  def print_board_with_msg
    print_to_terminal(generate_board)
    print_to_terminal(@message.enter_num)
  end

  def game_setup
    print_to_terminal(@message.welcome)
    print_board_with_msg
  end

  def player_input
    gets.chomp.to_i
  end

  def turn
    until turn_count == 9
      play_turn(get_player_mark(@board), player_input)
      print_board_with_msg
    end
    print_to_terminal(@message.game_over)
  end

  def get_player_mark(board)
    if board.count('X') == board.count('O')
      'X'
    elsif board.count('X') > board.count('O')
      'O'
    else
      'X'
    end
  end

  def win?(board, player)
    WINNING_MOVES.any? do |winning_play|
         winning_play.all? do |position| 
            board[position] == player 
         end
    end
  end

 
end

new_board = Board.new(Message.new)
board = ['','','0','','','O','X','X','X']
p new_board.win?(board, 'X')