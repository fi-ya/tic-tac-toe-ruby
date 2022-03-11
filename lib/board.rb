# frozen_string_literal: true

require_relative 'message'

class Board
  attr_accessor :grid, :player_mark

  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
    @player_mark = %w[X O]
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

  def generate_board
    " #{grid[0]} | #{grid[1]} | #{grid[2]} \n" \
      "-----------\n" \
      " #{grid[3]} | #{grid[4]} | #{grid[5]} \n" \
      "-----------\n" \
      " #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
  end

  def get_player_mark
    if grid.count(player_mark[0]) == grid.count(player_mark[1])
      player_mark[0]
    elsif grid.count(player_mark[0]) > grid.count(player_mark[1])
      player_mark[1]
    else
      player_mark[0]
    end
  end

  def place_player(player, index)
    grid[index - 1] = player
  end

  def available_moves
    available_moves = []
    grid.each do |cell|
      available_moves.push(cell) if cell != player_mark[0] && cell != player_mark[1]
    end
    available_moves
  end

  def board_full?
    available_moves.empty?
  end

  def win?(_board)
    winning_plays = []

    WINNING_MOVES.all? do |winning_game|
      pos1_eq_pos2 = grid[winning_game[0]] == grid[winning_game[1]]
      pos2_eq_po3 = grid[winning_game[1]] == grid[winning_game[2]]
      winning_plays.push(pos1_eq_pos2 && pos2_eq_po3 ? true : false)
    end

    winning_plays.any? { |game| game == true }
  end

  def winning_player(_board)
    grid.count(player_mark[0]) > grid.count(player_mark[1]) ? player_mark[0] : player_mark[1]
  end
end
