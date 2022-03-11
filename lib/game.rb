# frozen_string_literal: true

require_relative 'board'
require_relative 'message'

class Game
  attr_reader :board, :message, :display

  def initialize(board, display, message)
    @board = board
    @message = message
    @display = display
  end

  def turn
    until game_over?
      play_turn(board.get_player_mark, display.get_player_input)
      display.print_to_terminal(board.generate_board)
      display.print_to_terminal(message.enter_num) unless game_over?
    end
    game_status(board)
  end

  def game_over?
    board.board_full? || board.win?
  end

  def play_turn(player, index)
    if player == board.player_mark[0] && valid_move?(index)
      board.place_player(board.player_mark[0], index)
    elsif player == board.player_mark[1] && valid_move?(index)
      board.place_player(board.player_mark[1], index)
    else
      display.print_to_terminal(message.invalid_move)
    end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(1, 9)
  end

  def position_taken?(index)
    board.grid[index - 1] == board.player_mark[0] || board.grid[index - 1] == board.player_mark[1]
  end

  def game_status(board)
    if board.board_full? && !board.win?
      display.print_to_terminal(message.tie)
    else
      display.print_to_terminal(message.won(board.winning_player))
    end
  end
end
