# frozen_string_literal: true

require_relative 'message'

class Board
  attr_accessor :board, :players_move

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

  def initialize(message)
    @board = %w[1 2 3 4 5 6 7 8 9]
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
    @board[index - 1] = player
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
    board[index - 1] == 'X' || board[index - 1] == 'O'
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(1, 9) ? true : false
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

  def print_players_move
    print_to_terminal(@message.players_move(get_player_mark(@board), @players_move))
  end

  def player_input
    @players_move = gets.chomp.to_i
    print_players_move
    @players_move
  end

  def turn
    until game_over?
      play_turn(get_player_mark(@board), player_input)
      print_to_terminal(generate_board)
      print_to_terminal(@message.enter_num) unless game_over?
    end
    game_status(@board)
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

  def winning_player(board)
    board.count('X') > board.count('O') ? 'X' : 'O'
  end

  def available_moves
    available_moves = []
    @board.each do |cell|
      available_moves.push(cell) if cell != 'X' && cell != 'O'
    end
    available_moves
  end

  def board_full?
    available_moves.empty?
  end

  def win?(board)
    winning_plays = []

    WINNING_MOVES.all? do |winning_game|
      winning_plays.push(board[winning_game[0]] == board[winning_game[1]] && board[winning_game[1]] == board[winning_game[2]] ? true : false)
    end

    winning_plays.any? { |game| game == true }
  end

  def game_status(board)
    if board_full? && !win?(board)
      print_to_terminal(@message.tie)
    else
      print_to_terminal(@message.won(winning_player(board)))
    end
  end

  def game_over?
    board_full? || win?(@board)
  end
end
